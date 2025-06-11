return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- set this to "*" if you want to always pull the latest change, false to update on release
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "hrsh7th/nvim-cmp"
  },
  opts = {
    -- auto_suggestions_provider = "deepseek",
    -- provider = 'deepseek',
    auto_suggestions_provider = "openai",
    provider = 'openai',
    providers = {
      openai = {
        -- model = "gpt-4.1-mini-2025-04-14",
        model = "o4-mini",
      },
      deepseek = {
        __inherited_from = 'openai',
        api_key_name = 'DEEPSEEK_API_KEY',
        endpoint = 'https://api.deepseek.com',
        model = 'deepseek-coder',
        extra_request_body = {
          max_tokens = 8192
        }
      },
      qwen = {
        __inherited_from = "openai",
        model = "qwen2.5-coder-32b-instruct",
        endpoint = "http://127.0.0.1:1234/v1",
      },
    },
    behaviour = {
      -- auto_suggestions = true,
      auto_set_keymaps = false,
    },
    mappings = {
      suggestion = {
        accept = "<C-e>",
        next = "<C-n>",
      },
    },
    hints = {
      enabled = false
    },
    windows = {
      ask = {
        focus_on_apply = "theirs", -- which diff to focus after applying
      },
      edit = {
        border = "rounded",
        start_insert = true, -- Start insert mode when opening the edit window
      },
    },
    -- system_prompt as function ensures LLM always has latest MCP server state
    -- This is evaluated for every message, even in existing chats
    system_prompt = function()
      local hub = require("mcphub").get_hub_instance()
      if hub then
        return hub:get_active_servers_prompt()
      end
    end,
    -- Using function prevents requiring mcphub before it's loaded
    custom_tools = function()
      return {
        require("mcphub.extensions.avante").mcp_tool(),
      }
    end,
    disabled_tools = {
      "list_files",
      "search_files",
      "read_file",
      "create_file",
      "rename_file",
      "delete_file",
      "create_dir",
      "rename_dir",
      "delete_dir",
      "bash",
    },
  },
}
