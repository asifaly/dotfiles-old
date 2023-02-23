local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
    "tpope/vim-sleuth",
    "christoomey/vim-tmux-navigator",
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup({
                -- for example, context is off by default, use this to turn it on
                show_current_context = true,
                show_current_context_start = true,
                char = "┊",
                show_trailing_blankline_indent = false,
            })
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = { style = "moon" },
        config = function(_, opts)
            local tokyonight = require("tokyonight")
            tokyonight.setup(opts)
            tokyonight.load()
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        dependencies = "nvim-telescope/telescope.nvim",
        build = "make",
        cond = vim.fn.executable("make") == 1,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = true,
    },
    -- {
    --     "navarasu/onedark.nvim",
    --     config = function()
    --      require("onedark").setup({
    --          style = "darker",
    --      })
    --      require("onedark").load()
    --     end,
    -- },
    "tpope/vim-fugitive",
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { text = "+" },
                    change = { text = "~" },
                    delete = { text = "_" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            pcall(require("nvim-treesitter.install").update({ with_sync = true }))
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "kyazdani42/nvim-web-devicons",
        },
    },

    {
        "nvim-tree/nvim-tree.lua",
        config = true,
        version = "nightly", -- optional, updated every week. (see issue #1193)
    },
    {
        "numToStr/Comment.nvim",
        config = true,
    },
    {
        "folke/neodev.nvim",
        config = true,
    },
    {
        "ThePrimeagen/harpoon",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" }, -- Required
            { "williamboman/mason.nvim" }, -- Optional
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            -- Autocompletion
            { "hrsh7th/nvim-cmp" }, -- Required
            { "hrsh7th/cmp-nvim-lsp" }, -- Required
            { "hrsh7th/cmp-buffer" }, -- Optional
            { "hrsh7th/cmp-path" }, -- Optional
            { "saadparwaiz1/cmp_luasnip" }, -- Optional
            { "hrsh7th/cmp-nvim-lua" }, -- Optional

            -- Snippets
            { "L3MON4D3/LuaSnip" }, -- Required
            { "rafamadriz/friendly-snippets" }, -- Optional
        },
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end,
    },
    {
        "zbirenbaum/copilot-cmp",
        dependencies = { "copilot.lua" },
        config = true,
    },
    {
        "nvim-telescope/telescope.nvim",
        version = "0.1.1",
        dependencies = { { "nvim-lua/plenary.nvim" } },
        config = function()
            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-u>"] = false,
                            ["<C-d>"] = false,
                        },
                    },
                    file_ignore_patterns = { "node_modules" },
                },
            })

            -- Enable telescope fzf native, if installed
            pcall(require("telescope").load_extension, "fzf")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            pcall(require("nvim-treesitter.install").update({ with_sync = true }))
        end,
        config = function()
            require("nvim-treesitter.configs").setup({
                -- A list of parser names, or "all" (the four listed parsers should always be installed)
                ensure_installed = { "javascript", "typescript", "vue", "lua", "vim", "help" },
                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,
                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,
                highlight = {
                    enable = true,
                },
            })
            pcall(require("telescope").load_extension, "fzf")
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
        config = function()
            require("lualine").setup({
                options = {
                    icons_enabled = true,
                    theme = "auto",
                    component_separators = "",
                    -- section_separators = "",
                    -- component_separators = { left = "\\", right = "/" },
                    section_separators = { left = "", right = "" },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = { "filename" },
                    lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = { "location" },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {
                    lualine_a = { "buffers" },
                },
                winbar = {},
                inactive_winbar = {},
                extensions = {},
            })
        end,
    },
})

--[[luasnip.lua]]
require("luasnip").filetype_extend("javascript", { "vue" })
require("luasnip").filetype_extend("typescript", { "javascript", "vue" })
require("luasnip.loaders.from_vscode").lazy_load()

-- [[ telescope.lua ]]
local builtin = require("telescope.builtin")
local map = vim.keymap.set
-- See `:help telescope.builtin`
map("n", "<leader>'", builtin.keymaps, { desc = "['] List Key Maps" })
map("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
map("n", "<leader><space>", builtin.buffers, { desc = "[ ] Find existing buffers" })
map("n", "<leader>/", function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
    }))
end, { desc = "[/] Fuzzily search in current buffer]" })

map("n", "<leader>sf", builtin.git_files, { desc = "[S]earch Git [F]iles" })
map("n", "<leader>ff", builtin.find_files, { desc = "[F]ind All [F]iles" })
map("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
map("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
map("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
map("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
map("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })
map("n", "<leader>ws", builtin.lsp_workspace_symbols, { desc = "[W]orkspace [S]ymbols" })

-- [[ null-ls.lua ]]
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier_d_slim,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.code_actions.eslint_d,
    },
})

-- [[ lspconfig.lua ]]

local lsp = require("lsp-zero")
local cmp = require("cmp")
local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
        return false
    end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

lsp.preset("recommended")

lsp.ensure_installed({
    "emmet_ls",
    "lua_ls",
    "tailwindcss",
    "eslint",
    "volar",
    "html",
    "eslint",
})

lsp.setup_nvim_cmp({
    sources = {
        -- This one provides the data from copilot.
        { name = "copilot",  keyword_length = 0 },

        --- These are the default sources for lsp-zero
        { name = "path" },
        { name = "nvim_lsp", keyword_length = 3 },
        { name = "buffer",   keyword_length = 3 },
        { name = "luasnip",  keyword_length = 2 },
    },
    mapping = lsp.defaults.cmp_mappings({
        ["<CR>"] = cmp.mapping.confirm({
            -- documentation says this is important.
            -- I don't know why.
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        }),
        ["<Down>"] = vim.schedule_wrap(function(fallback)
            if cmp.visible() and has_words_before() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
                fallback()
            end
        end),
        ["<Up>"] = vim.schedule_wrap(function(fallback)
            if cmp.visible() and has_words_before() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior })
            else
                fallback()
            end
        end),
    }),
})

lsp.configure("volar", {
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
})

lsp.configure("eslint", {
    filetypes = {
        "javascript",
        "typescript",
        "typescriptreact",
        "vue",
        "json",
    },
    settings = {
        codeActionOnSave = {
            enable = true,
            mode = "all",
        },
    },
})

lsp.configure("lua_ls", {
    Lua = {
        diagnostics = { globals = { "vim" }, disable = { "lowercase-global" } },
        workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
        },
        telemetry = { enable = false },
    },
})

lsp.on_attach(function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = "LSP: " .. desc
        end

        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
    end

    nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
    nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

    nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
    nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
    nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
    nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
    nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
    nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

    -- See `:help K` for why this keymap
    nmap("K", vim.lsp.buf.hover, "Hover Documentation")
    -- nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
        vim.lsp.buf.format()
    end, { desc = "Format current buffer with LSP" })
end)

vim.cmd([[autocmd BufWritePre *.vue,*.tsx,*.ts,*.jsx,*.js EslintFixAll]])
-- vim.cmd([[autocmd BufWritePre <buffer> Format]])

lsp.setup()

-- [[ harpoon.lua ]]
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

map("n", "<leader>a", mark.add_file, { desc = "Harpoon Add File" })
map("n", "<leader>h", ui.toggle_quick_menu, { desc = "Harpoon Toggle Menu" })

map("n", "<leader>1", function()
    ui.nav_file(1)
end, { desc = "Harpoon 1" })
map("n", "<leader>2", function()
    ui.nav_file(2)
end, { desc = "Harpoon 2" })
map("n", "<leader>3", function()
    ui.nav_file(3)
end, { desc = "Harpoon 3" })
map("n", "<leader>4", function()
    ui.nav_file(4)
end, { desc = "Harpoon 4" })
map("n", "<leader><left>", function()
    ui.nav_next()
end, { desc = "Harpoon Next" })
map("n", "<leader><right>", function()
    ui.nav_prev()
end, { desc = "Harpoon Previous" })

-- [[ fugitive]]
map("n", "<leader>gs", vim.cmd.Git, { desc = "[G]it [S]tatus" })
map("n", "<leader>gw", vim.cmd.GBrowse, { desc = "[G]it Bro[W]se" })
map("n", "<leader>gm", vim.cmd.GMove, { desc = "[G]it [M]ove" })

require("asif.remap")
require("asif.options")

