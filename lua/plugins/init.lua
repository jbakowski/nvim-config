return {
  {
  --   "stevearc/conform.nvim",
  --   event = 'BufWritePre', -- uncomment for format on save
  --   opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- NvChad now uses nvim-treesitter's `main` branch (needs Neovim 0.12+ and tree-sitter-cli).
  -- Highlighting is started by NvChad; `:TSInstallAll` installs the list below.
  -- Keep `opts` a plain table: NvChad's :TSInstallAll reads ensure_installed from it.
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    opts = {
      ensure_installed = {
        -- NvChad defaults
        "lua",
        "luadoc",
        "printf",
        "vim",
        "vimdoc",
        -- yours
        "c",
        "python",
        "html",
        "css",
        "markdown",
        "markdown_inline",
      },
    },
  },

  -- Git diff viewer (replaces diffview.nvim, unmaintained since 2024)
  --   :CodeDiff              changed files, staged files and merge conflicts
  --   :CodeDiff history %    history of the current file (:CodeDiff history for the repo)
  --   :CodeDiff file HEAD    current file against a revision
  --   q closes the view, g? lists its keys
  {
    "esmuellert/codediff.nvim",
    version = "^4", -- tagged 4.x releases only: its prebuilt diff library is published per release
    cmd = "CodeDiff",
    opts = {
      diff = {
        layout = "side-by-side", -- like diffview's diff2_horizontal
        -- 3-way conflicts in three columns: theirs | result | ours (each pane is labelled).
        -- Keep ours on the right: codediff's accept keys (<leader>co / <leader>ct) take the
        -- right / left pane, so moving ours to the left makes <leader>co accept theirs.
        conflict_result_position = "center",
      },
      explorer = {
        view_mode = "tree",
        flatten_dirs = true,
      },
    },
  },

  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    cmd = "Lspsaga", -- F2/F3 use :Lspsaga, so the command must exist before the first LSP attaches
    config = function()
      require("lspsaga").setup({
        ui = {
          border = "rounded",
          code_action = "💡",
        },
        lightbulb = {
          enable = true,
          sign = true,
          virtual_text = true,
        },
        symbol_in_winbar = {
          enable = true,
          separator = "  ",
          show_file = true,
        },
      })
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },
}
