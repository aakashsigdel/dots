require("conform").setup({
  formatters_by_ft = {
    javascript = { "prettierd", "prettier", stop_after_first = true },
    javascriptreact = { "prettierd", "prettier", stop_after_first = true },
    typescript = { "prettierd", "prettier", stop_after_first = true },
    typescriptreact = { "prettierd", "prettier", stop_after_first = true },
  }
})

require("conform").prettierd = {
  options = {
  ft_parsers = {
        javascript = "typescript",
        javascriptreact = "typescriptreact",
        typescript = "typescript",
        typescriptreact = "typescript",
        css = "css",
        scss = "scss",
        less = "less",
        html = "html",
        json = "json",
        jsonc = "json",
        yaml = "yaml",
        markdown = "markdown",
        ["markdown.mdx"] = "mdx",
        graphql = "graphql",
        handlebars = "glimmer",
    }
  }
}
