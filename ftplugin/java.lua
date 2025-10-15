local sep = package.config:sub(1, 1)
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.stdpath 'data' .. sep .. 'jdtls-workspace' .. sep .. project_name
local eclipse_jdtls_path = vim.fn.expand '$MASON/packages/jdtls'
local equinox_launcher_path = vim.fn.glob(eclipse_jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar')
-- Choose appropriate operating system
local os_name = vim.loop.os_uname().sysname
local config_os = 'config_' .. (os_name == 'Windows_NT' and 'win' or os_name == 'Linux' and 'linux' or 'mac')
local config_path = eclipse_jdtls_path .. '/' .. config_os
-- Directly copied from nvim-lspconfig
local root_markers1 = {
  -- Multi-module projects
  'mvnw',
  'gradlew',
  'build.gradle',
  'build.gradle.kts',
  -- Use git directory as last resort for multi-module maven projects
  -- In multi-module maven projects it is not really possible to determine what is the parent directory
  -- and what is submodule directory. And jdtls does not break if the parent directory is at higher level than
  -- actual parent pom.xml so propagating all the way to root git directory is fine
  '.git',
}
local root_markers2 = {
  -- Single-module projects
  'build.xml', -- Ant
  'pom.xml', -- Maven
  'settings.gradle', -- Gradle
  'settings.gradle.kts', -- Gradle
}
-- local root_markers = vim.fn.has 'nvim-0.11.3' == 1 and { root_markers1, root_markers2 } or vim.list_extend(root_markers1, root_markers2)
local root_markers = vim.list_extend(root_markers1, root_markers2)
local root_dir = require('jdtls.setup').find_root(root_markers)
-- Bundle configuration for Debugger and Test
local bundles = {
  vim.fn.glob('$MASON/share/java-debug-adapter/com.microsoft.java.debug.plugin-*.jar', true),
}
vim.list_extend(bundles, vim.split(vim.fn.glob('$MASON/share/java-test/*.jar', true), '\n'))
local extendedClientCapabilities = require('jdtls').extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
-- Configuration table
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    'java', -- or '/path/to/java17_or_newer/bin/java'
    -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens',
    'java.base/java.util=ALL-UNNAMED',
    '--add-opens',
    'java.base/java.lang=ALL-UNNAMED',

    '-jar',
    equinox_launcher_path,

    '-configuration',
    config_path,

    '-data',
    workspace_dir,
  },

  root_dir = root_dir,

  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
      inlayHints = {
        parameterNames = {
          enabled = 'all',
        },
      },
      format = {
        settings = {
          url = 'https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml',
          profile = 'GoogleStyle',
        },
      },
    },
  },

  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  init_options = {
    bundles = bundles,
    extendedClientCapabilities = extendedClientCapabilities,
  },
}
-- Starts a new client & server or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == 'jdtls' then
      local wk = require 'which-key'
      wk.add {
        {
          mode = 'n',
          buffer = args.buf,
          { '<leader>cx', group = 'extract' },
          { '<leader>cxv', require('jdtls').extract_variable_all, desc = 'Extract Variable' },
          { '<leader>cxc', require('jdtls').extract_constant, desc = 'Extract Constant' },
          { '<leader>cgs', require('jdtls').super_implementation, desc = 'Goto Super' },
          { '<leader>cgS', require('jdtls.tests').goto_subjects, desc = 'Goto Subjects' },
          { '<leader>co', require('jdtls').organize_imports, desc = 'Organize Imports' },
        },
      }
      wk.add {
        {
          mode = 'v',
          buffer = args.buf,
          { '<leader>cx', group = 'extract' },
          {
            '<leader>cxm',
            [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
            desc = 'Extract Method',
          },
          {
            '<leader>cxv',
            [[<ESC><CMD>lua require('jdtls').extract_variable_all(true)<CR>]],
            desc = 'Extract Variable',
          },
          {
            '<leader>cxc',
            [[<ESC><CMD>lua require('jdtls').extract_constant(true)<CR>]],
            desc = 'Extract Constant',
          },
        },
      }

      local dap = { hotcodereplace = 'auto', config_overrides = {} }
      -- custom init for Java debugger
      require('jdtls').setup_dap(dap)
      -- Can set this to false to disable main class scan, which is a performance killer for large project
      require('jdtls.dap').setup_dap_main_class_configs {}

      -- Testing options can be overridden by replacing test with a config_overrides table
      local test = true
      -- Java Test require Java debugger to work
      -- custom keymaps for Java test runner (not yet compatible with neotest)
      wk.add {
        {
          mode = 'n',
          buffer = args.buf,
          { '<leader>t', group = 'test' },
          {
            '<leader>tt',
            function()
              require('jdtls.dap').test_class {
                config_overrides = type(test) ~= 'boolean' and test.config_overrides or nil,
              }
            end,
            desc = 'Run All Test',
          },
          {
            '<leader>tr',
            function()
              require('jdtls.dap').test_nearest_method {
                config_overrides = type(test) ~= 'boolean' and test.config_overrides or nil,
              }
            end,
            desc = 'Run Nearest Test',
          },
          { '<leader>tT', require('jdtls.dap').pick_test, desc = 'Run Test' },
        },
      }
    end
  end,
})
