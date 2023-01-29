require("luasnip").filetype_extend("javascript", { "vue" })
require("luasnip").filetype_extend("typescript", { "javascript", "vue" })
require("luasnip.loaders.from_vscode").lazy_load()
