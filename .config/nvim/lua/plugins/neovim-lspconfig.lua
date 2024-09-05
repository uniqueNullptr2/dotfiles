local M = {
    "neovim/nvim-lspconfig"
}

M.config = function()
    local lspconfig = require('lspconfig')
    lspconfig.pyright.setup {}
    lspconfig.gopls.setup({})
    lspconfig.clangd.setup({})
    lspconfig.tsserver.setup{}
    local root_dir = lspconfig.util.root_pattern('.git');
    local root = root_dir(vim.loop.cwd())
    if root == nil then root = '.' end

    local cmd = {root .. "/node_modules/@angular/language-server/bin/ngserver", "--stdio", "--tsProbeLocations", "" , "--ngProbeLocations", ""},
    lspconfig.angularls.setup{
        cmd = {root .. "/node_modules/@angular/language-server/bin/ngserver", "--stdio", "--tsProbeLocations", root .. "/node_modules" ,"--ngProbeLocations", root ..  "/node_modules"},
        root_dir = root_dir,

        on_new_config = function(new_config,new_root_dir)
            new_config.cmd = {root .. "/node_modules/@angular/language-server/bin/ngserver", "--stdio", "--tsProbeLocations", root .. "/node_modules" , "--ngProbeLocations", root .. "/node_modules"}
        end,
    }
    -- lspconfig.tsserver.setup {}
    lspconfig.rust_analyzer.setup {
        -- Server-specific settings. See `:help lspconfig-setup`
        settings = {
            ['rust-analyzer'] = {checkOnSave=true},
        },
    }


    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {desc="lsp diag open float"})
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {desc="lsp dia goto prev"})
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {desc="lsp dia goto next"})
    vim.keymap.set('n', '<lader>q', vim.diagnostic.setloclist, {desc="lsp dia setloclist"})

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = vim.api.nvim_create_augroup('formatOnWrite', {}),
                callback = function()
                    vim.lsp.buf.format({async=false})
                end
            })
            -- Enable completion triggered by <c-x><c-o>
            vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

            -- Buffer local mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc="LSP Declaration" })
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc="LSP Definition" })
            vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, { buffer = ev.buf, desc="LSP Hover" })
            vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, { buffer = ev.buf, desc="LSP Implementation" })
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = ev.buf, desc="LSP signature help" })
            vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { buffer = ev.buf, desc="LSP add workspace folder" })
            vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { buffer = ev.buf, desc="LSP remove workspace folder" })
            vim.keymap.set('n', '<leader>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, { buffer = ev.buf, desc="LSP List workspace folders" })
            vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, { buffer = ev.buf, desc="LSP type definition" })
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = ev.buf, desc="LSP Rename" })
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = ev.buf, desc="LSP code action" })
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = ev.buf, desc="LSP Reference" })
            vim.keymap.set('n', '<leader>F', function()
                vim.lsp.buf.format { async = true }
            end, { buffer = ev.buf, desc="LSP format" })
        end,
    })
end

return M
