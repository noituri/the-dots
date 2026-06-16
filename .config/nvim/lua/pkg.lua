local plugins_dir = vim.fn.stdpath("config") .. "/lua/plugins"

local plugin_repos = {}
local plugin_configs = {}

local dir = vim.uv.fs_scandir(plugins_dir)
if not dir then
  return
end

local function handle_plugin(plugin)
  local repo = plugin[1] or plugin
  local config = plugin.config
  local deps = plugin.dependencies
  local name_alias = plugin.as
  local version = plugin.version

  if not vim.startswith(repo, "https://") then
    repo = "https://github.com/" .. repo
  end

  if deps then
    for _, dep in ipairs(deps) do
      handle_plugin(dep)
    end
  end

  table.insert(plugin_repos, { src = repo, name = name_alias, version = version })

  if config then
    table.insert(plugin_configs, config)
  else
    local plugin_name = repo:match("[^/]+$"):gsub("%.git$", ""):gsub("%.nvim$", ""):gsub("^nvim%-", "")
    table.insert(plugin_configs, function()
      local ok, module = pcall(require, plugin_name)
      if ok and type(module.setup) == "function" then
        module.setup()
      end
    end)
  end
end

while true do
  local name, ty = vim.uv.fs_scandir_next(dir)
  if not name then
    break
  end

  if ty ~= "file" or not name:match("%.lua$") then
    goto continue
  end

  local file_path = plugins_dir .. "/" .. name
  local file = loadfile(file_path)

  if file then
    local ok, plugins = pcall(file)
    if not ok then
      goto continue
    end

    if type(plugins) == "table" then
      local only_one_plugin = false
      if type(plugins[1]) == "string" then
        if plugins.config or plugins.opts or plugins.dependencies or #plugins == 1 then
          only_one_plugin = true
        end
      end

      if only_one_plugin then
        handle_plugin(plugins)
      else
        for _, plugin in ipairs(plugins) do
          handle_plugin(plugin)
        end
      end
    end
  end

  ::continue::
end

if #plugin_repos > 0 then
  vim.pack.add(plugin_repos)
end

for _, config in ipairs(plugin_configs) do
  config()
end
