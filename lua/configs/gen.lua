local gen = require("gen")

local models = {
  "codellama:7b",
  "llama:8b",
  "mistral:7b"
}

local current_model = models[1] -- Set the default model to the first in the list

local opts = {
  -- model = "codellama:7b", -- The default model to use.
  model = current_model, -- Use the dynamic model
  host = "localhost", -- The host running the Ollama service.
  port = "11434", -- The port on which the Ollama service is listening.
  quit_map = "q", -- set keymap for close the response window
  retry_map = "<c-r>", -- set keymap to re-send the current prompt
  init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
  -- Function to initialize Ollama
  command = function(options)
      local body = {model = options.model, stream = true}
      return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
  end,
  -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
  -- This can also be a command string.
  -- The executed command must return a JSON object with { response, context }
  -- (context property is optional).
  -- list_models = '<omitted lua function>', -- Retrieves a list of model names
  display_mode = "split", -- The display mode. Can be "float" or "split" or "horizontal-split".
  show_prompt = true, -- Shows the prompt submitted to Ollama.
  show_model = true, -- Displays which model you are using at the beginning of your chat session.
  no_auto_close = false, -- Never closes the window automatically.
  debug = false, -- Prints errors and the command which is run.
  prompts = prompts
}

-- Function to change the current model from the list
local function set_model_by_index(index)
  if index > 0 and index <= #models then
    current_model = models[index]
    opts.model = current_model
    print("Model changed to " .. current_model)
  else
    print("Invalid model index. Please choose a number between 1 and " .. #models)
  end
end

-- Function to list available models using Telescope and highlight the current model
function telescope_list_models()
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  local display_models = {}
  for i, model in ipairs(models) do
    if model == current_model then
      table.insert(display_models, model .. " (current)")
    else
      table.insert(display_models, model)
    end
  end

  pickers.new({}, {
    prompt_title = "Select Model (current: " .. current_model .. ")",
    finder = finders.new_table {
      results = display_models
    },
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      local function set_model()
        local selection = action_state.get_selected_entry()
        local selected_index = selection.index
        if display_models[selected_index] == current_model .. " (current)" then
          set_model_by_index(selected_index)
        else
          set_model_by_index(selected_index)
        end
        actions.close(prompt_bufnr)
      end

      map('i', '<CR>', set_model)
      map('n', '<CR>', set_model)

      return true
    end
  }):find()
end

gen.prompts['Elaborate_Text'] = {
  prompt = "Elaborate the following text:\n$text",
  replace = true
}

gen.prompts['Fix_Code'] = {
  prompt = "Fix the following code. Only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
  replace = true,
  extract = "```$filetype\n(.-)```"
}

return opts
