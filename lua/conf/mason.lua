-- https://github.com/williamboman/mason.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim
-- https://github.com/nvim-lua/lsp-status.nvim
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = { "lua-language-server", "clangd", "cpptools", "pylsp", "marksman" },
    automatic_installation = true
})

-- lua-dev
-- IMPORTANT: make sure to setup lua-dev BEFORE lspconfig
require("lua-dev").setup({
    -- add any options here, or leave empty to use the default settings
    library = {
        enabled = true, -- when not enabled, lua-dev will not change any settings to the LSP server
        -- these settings will be used for your Neovim config directory
        runtime = true, -- runtime path
        types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
        -- plugins = true, -- installed opt or start plugins in packpath
        -- you can also specify the list of plugins to make available as a workspace library
        plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
    },
    setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
    -- for your Neovim config directory, the config.library settings will be used as is
    -- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
    -- for any other directory, config.library.enabled will be set to false
    override = function(root_dir, options) end,
})

-- Register the progress handler
local lsp_status = require('lsp-status')
lsp_status.register_progress()

local lsp_signature = require("lsp_signature")
--navic
local navic = require("nvim-navic")

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities = vim.tbl_extend('keep', capabilities or {}, lsp_status.capabilities)


local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', 'g[', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', 'g]', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', 'gd', "<cmd>Telescope diagnostics<CR>", opts)

local on_attach = function(client, bufnr)
    vim.api.nvim_exec_autocmds('User', { pattern = 'LspAttached' })
    lsp_status.on_attach(client)
    lsp_signature.on_attach(client, bufnr)
    navic.attach(client, bufnr)

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gr', "<cmd>Telescope lsp_references theme=dropdown<CR>", bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<A-S-f>', vim.lsp.buf.formatting, bufopts)
end

-- 默认情况下，这些窗口没有任何样式，
-- 但我们可以通过修改每个方法的关联“处理程序”来更改它
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = 'rounded' }
)
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = 'rounded' }
)


-- local runtime_path = vim.split(package.path, ";")
-- table.insert(runtime_path, "lua/?.lua")
-- table.insert(runtime_path, "lua/?/init.lua")

require 'lspconfig'.sumneko_lua.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    log_level = 2,
    root_dir = function()
        return vim.fn.getcwd()
    end,
    settings = {
        Lua = {
            completion = {
                callSnippet = "Replace"
            },
            runtime = {
                version = "LuaJIT",
                -- path = runtime_path
            },
            diagnostics = {
                globals = { "vim" }
            },
            -- workspace = {
            --     library = vim.api.nvim_get_runtime_file("", true)
            -- },
            telemetry = {
                enable = false
            }
        }
    }
}

-- https://clangd.llvm.org/features.html
require 'lspconfig'.clangd.setup({
    handlers = lsp_status.extensions.clangd.setup(),
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    single_file_support = true,
    init_options = {
        clangdFileStatus = true
    },
})

require 'lspconfig'.jdtls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "jdtls", "-configuration", "/home/jyf/.cache/jdtls/config", "-data", "/home/jyf/.cache/jdtls/workspace" },
    filetypes = { "java" },
    init_options = {
        jvm_args = {},
        workspace = "/home/jyf/.cache/jdtls/workspace"
    },
    root_dir = require "lspconfig".util.root_pattern(".git",
        'build.xml', -- Ant
        'pom.xml', -- Maven
        'settings.gradle', -- Gradle
        'settings.gradle.kts', -- Gradle
        'build.gradle',
        'build.gradle.kts'
    )
}

require('lspconfig')['pylsp'].setup({
    handlers = lsp_status.extensions.pyls_ms.setup(),
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = function()
        return vim.fn.getcwd()
    end,
    settings = {
        python = {
            workspaceSymbols = {
                enabled = true
            }
        },
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = { 'W391' },
                    maxLineLength = 100
                }
            }
        }
    }
})

require 'lspconfig'.marksman.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

capabilities.textDocument.completion.completionItem.snippetSupport = true
require 'lspconfig'.jsonls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
