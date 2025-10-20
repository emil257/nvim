return {
	"jay-babu/mason-null-ls.nvim",
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
			require("mason-null-ls").setup({
				ensure_installed = { "stylua", "xmlformatter" },
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			ensure_installed = { "lua_ls", "ts_ls", "html", "clangd", "csharp_ls", "glsl_analyzer" },
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			local configs = require("lspconfig.configs")
			local util = require("lspconfig.util")
			local uv = vim.loop

			-- Paths
			local mason_dir = vim.fn.stdpath("data") .. "/mason/packages/shader-language-server"
			local publish_dir_intel  = mason_dir .. "/Server/bin/Release/net7.0/osx-x64/publish/shader-ls"
			local publish_dir_arm    = mason_dir .. "/Server/bin/Release/net7.0/osx-arm64/publish/shader-ls"

			-- Detect architecture
			local arch = vim.loop.os_uname().machine
			local shader_ls_bin = (arch == "arm64") and publish_dir_arm or publish_dir_intel

			-- Step 1: Clone if missing
			if uv.fs_stat(mason_dir) == nil then
				print("[ShaderLS] Cloning shader-language-server...")
				vim.system({
					"git", "clone", "--depth=1",
					"https://github.com/shader-ls/shader-language-server.git",
					mason_dir,
				}):wait()
			end

			-- Step 2: Build/publish if binary missing
			if uv.fs_stat(shader_ls_bin) == nil then
				print("[ShaderLS] Publishing self-contained executable for " .. arch .. "...")
				local target_rid = (arch == "arm64") and "osx-arm64" or "osx-x64"
				local cmd = {
					"dotnet", "publish",
					"-c", "Release",
					"-r", target_rid,
					"--self-contained", true
				}
				-- Run dotnet publish in repo root
				-- vim.fn.system({ "dotnet", "publish", "-c", "Release", "-r", "osx-arm64", "--self-contained", "true" }, mason_dir .. "/Server")
				vim.system(cmd, { cwd = mason_dir .. "/Server" }):wait()
			end

			-- Step 3: Register custom LSP
			if not configs.shader_lang then
				configs.shader_lang = {
					default_config = {
						cmd = { shader_ls_bin, "--stdio" },
						filetypes = { "glsl", "hlsl", "wgsl", "shader", "gdshader" },
						root_dir = util.root_pattern(".git", "."),
						single_file_support = true,
					},
					docs = {
						description = [[
			https://github.com/shader-ls/shader-language-server
			Language server for GLSL, HLSL, WGSL, and shader files.
						]],
					},
				}
			end

			lspconfig.ts_ls.setup({ capabilities = capabilities })
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.clangd.setup({ capabilities = capabilities })
			lspconfig.csharp_ls.setup({ capabilities = capabilities })
			lspconfig.glsl_analyzer.setup({
				capabilities = capabilities,
				filetypes = { "vert", "frag", "geom", "comp"},
			})
			lspconfig.shader_lang.setup({
				capabilities = capabilities,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
