return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        width = 30,
        preserve_window_proportions = true,
      },
      actions = {
        open_file = {
          resize_window = false,
        },
      },
      on_attach = function(bufnr)
        local api = require "nvim-tree.api"
        api.config.mappings.default_on_attach(bufnr)

        -- recursively expand directory under cursor
        vim.keymap.set("n", "L", function()
          local node = api.tree.get_node_under_cursor()
          api.tree.expand_all(node)
        end, { desc = "nvim-tree: expand under cursor", buffer = bufnr, noremap = true, silent = true, nowait = true })
        -- collapse directory under cursor
        vim.keymap.set("n", "H", function()
          api.node.collapse()
        end, { desc = "nvim-tree: collapse under cursor", buffer = bufnr, noremap = true, silent = true, nowait = true })

        -- auto-preview file on cursor move (80ms debounce)
        local timer = assert(vim.uv.new_timer())
        vim.api.nvim_create_autocmd("CursorMoved", {
          buffer = bufnr,
          callback = function()
            timer:stop()
            timer:start(80, 0, vim.schedule_wrap(function()
              if not vim.api.nvim_buf_is_valid(bufnr) then return end
              local node = api.tree.get_node_under_cursor()
              if node and node.type == "file" then
                api.node.open.preview()
              end
            end))
          end,
        })

        -- clean up timer when tree buffer is wiped out
        vim.api.nvim_create_autocmd("BufWipeout", {
          buffer = bufnr,
          callback = function()
            timer:stop()
            if not timer:is_closing() then timer:close() end
          end,
        })
      end,
    },
  },
}
