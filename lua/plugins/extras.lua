-- Copilot/CodeCompanion are on by default; opt out on machines without a
-- subscription (e.g. work) by setting NVIM_COPILOT_DISABLE=1
local copilot_enabled = vim.env.NVIM_COPILOT_DISABLE == nil or vim.env.NVIM_COPILOT_DISABLE == ""

return {
  {
    "zbirenbaum/copilot.lua",
    enabled = copilot_enabled,
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
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
  {
    "olimorris/codecompanion.nvim",
    enabled = copilot_enabled,
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
