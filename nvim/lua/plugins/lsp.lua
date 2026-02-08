return {
	-- Main LSP Configuration
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"mason-org/mason-lspconfig.nvim",

		-- Useful status updates for LSP.
		{ "j-hui/fidget.nvim", opts = {} },

		-- Allows extra capabilities provided by blink.cmp
		"saghen/blink.cmp",
	},
	config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
            callback = function(event)
                local map = function(keys, func, desc, mode)
                    mode = mode or 'n'
                    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                end

                map('K', function() vim.lsp.buf.hover { border = 'rounded' } end, 'Hover')

                map('grn', vim.lsp.buf.rename, 'Rename')

                map('gra', vim.lsp.buf.code_action, 'Goto Code Action', { 'n', 'x' })

                map('grD', vim.lsp.buf.declaration, 'Goto Declaration')

                map('grd', require('telescope.builtin').lsp_definitions, 'Goto Definition')

                map('grr', require('telescope.builtin').lsp_references, 'Goto References')

                map('gri', require('telescope.builtin').lsp_implementations, 'Goto Implementation')

                map('grt', require('telescope.builtin').lsp_type_definitions, 'Goto Type Definition')

                map('grc', require('telescope.builtin').lsp_incoming_calls, 'Goto Incoming Calls')

                map('goc', require('telescope.builtin').lsp_outgoing_calls, 'Goto Outgoing Calls')

                map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')

                map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')

                map('gd', require('telescope.builtin').diagnostics, 'Diagnostics')

                vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

                -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
                ---@param client vim.lsp.Client
                ---@param method vim.lsp.protocol.Method
                ---@param bufnr? integer some lsp support methods only in specific files
                ---@return boolean
                local function client_supports_method(client, method, bufnr)
                    if vim.fn.has 'nvim-0.11' == 1 then
                        return client:supports_method(method, bufnr)
                    else
                        return client.supports_method(method, { bufnr = bufnr })
                    end
                end

                local client = vim.lsp.get_client_by_id(event.data.client_id)
                -- Highlight words
                if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
                    local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
                    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.clear_references,
                    })

                    vim.api.nvim_create_autocmd('LspDetach', {
                        group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
                        callback = function(event2)
                            vim.lsp.buf.clear_references()
                            vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
                        end,
                    })
                end

                -- The following code creates a keymap to toggle inlay hints in your
                -- code, if the language server you are using supports them
                --
                -- This may be unwanted, since they displace some of your code
                if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
                    vim.lsp.inlay_hint.enable(true)
                    map('<leader>lth', function()
                        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
                    end, '[L]SP [t]oggle Inlay [H]ints')
                end

                if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_codeLens, event.buf) then
                    vim.lsp.codelens.refresh()
                    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
                        callback = function()
                            vim.schedule(function()
                                vim.lsp.codelens.refresh()
                            end)
                        end
                    })
                end

            end,
        })

		vim.diagnostic.config({
			severity_sort = true,
			update_in_insert = true,
			float = { border = "rounded", source = "if_many" },
			underline = true,
		})

	local capabilities = require("blink.cmp").get_lsp_capabilities()
	local servers_settings = {
		harper_ls = {
			settings = {
				["harper-ls"] = {
					dialect = "British",
				},
			},
		},
		rust_analyzer = {},
        ltex = {settings = {ltex = {language = "en-GB"}}}
	}

	for server, settings in pairs(servers_settings) do
		settings.capabilities = vim.tbl_deep_extend("force", {}, capabilities, settings.capabilities or {})
		vim.lsp.config(server, settings)
		vim.lsp.enable(server)
	end

	require("mason-lspconfig").setup()
	end,
}
