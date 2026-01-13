return {
  {
    "zbirenbaum/copilot.lua",
    keys = {
      { "<leader>ac", "<cmd>Copilot suggestion toggle_auto_trigger<cr>", desc = "Toggle Copilot Auto Trigger" },
    },
    opts = {
      filetypes = {
        ["*"] = false,
        python = true,
        ruby = true,
        cpp = true,
        go = true,
        yaml = true,
        helm = true,
        sh = true,
        nix = true,
        gitcommit = true,
      },
    },
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("codecompanion").setup({
        interactions = {
          chat = { adapter = "copilot" },
          inline = { adapter = "copilot" },
        },
      })
    end,
  },
}
