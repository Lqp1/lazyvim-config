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
        adapters = {
          http = {
            perplexity = function()
              return require("codecompanion.adapters").extend("openai_compatible", {
                name = "perplexity",
                env = {
                  url = "https://api.perplexity.ai", -- optional: default value is ollama url http://127.0.0.1:11434
                  api_key = "cmd:cat ~/.perplexity",
                  chat_url = "/chat/completions",
                },
                schema = {
                  model = {
                    default = "sonar-reasoning-pro", -- define llm model to be used
                  },
                },
              })
            end,
          },
        },
        interactions = {
          chat = { adapter = "copilot" },
          inline = { adapter = "copilot" },
        },
      })
    end,
  },
}
