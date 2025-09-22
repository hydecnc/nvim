return {
  {
    'mfussenegger/nvim-lint',
    events = { 'BufWritePost', 'BufReadPost', 'InsertLeave' },
    linters_by_ft = {
      markdown = { 'markdownlint' },
    },
  },
}
