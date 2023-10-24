local home = os.getenv("HOME")
package.path = home
.. "/.config/xplr/plugins/?/init.lua;"
.. home
.. "/.config/xplr/plugins/?.lua;"
.. package.path

version = "0.21.3"
-- XClip pluing setup for copy and pasting filepaths
-- yy - for copying whole file content
-- yp - for copying the file/folder path
-- yP - for copying the parent file/folder path

require("wl-clipboard").setup{
  copy_command = "wl-copy -t text/uri-list",
  -- copy_paths_command = "wl-paste",
  paste_command = "wl-paste",
  keep_selection = false,
}

require("alacritty").setup{
  mode = "default",
  key = "ctrl-n",
  send_focus = true,
  send_selection = true,
  send_vroot = true,
  alacritty_bin = "alacritty",
  extra_alacritty_args = "",
  xplr_bin = "xplr",
  extra_xplr_args = "",
}
require("fzf").setup{
  mode = "default",
  key = "ctrl-f",
  bin = "fzf",
  args = "--preview 'bat -f {}'",
  recursive = false,  -- If true, search all files under $PWD
  enter_dir = false,  -- Enter if the result is directory
}

-- Preview text in separate xplr pane
local function stat(node)
  return xplr.util.to_yaml(xplr.util.node(node.absolute_path))
end

local function read(path, height)
  local p = io.open(path)

  if p == nil then
    return nil
  end

  local i = 0
  local res = ""
  for line in p:lines() do
    if line:match("[^ -~\n\t]") then
      p:close()
      return
    end

    res = res .. line .. "\n"
    if i == height then
      break
    end
    i = i + 1
  end
  p:close()

  return res
end

xplr.fn.custom.preview_pane = {}
xplr.fn.custom.preview_pane.render = function(ctx)
  local title = nil
  local body = ""
  local n = ctx.app.focused_node
  if n and n.canonical then
    n = n.canonical
  end

  if n then
    title = { format = n.absolute_path, style = xplr.util.lscolor(n.absolute_path) }
    if n.is_file then
      body = read(n.absolute_path, ctx.layout_size.height) or stat(n)
    else
      body = stat(n)
    end
  end

  return { CustomParagraph = { ui = { title = title }, body = body } }
end

local preview_pane = { Dynamic = "custom.preview_pane.render" }
local split_preview = {
  Horizontal = {
    config = {
      constraints = {
        { Percentage = 60 },
        { Percentage = 40 },
      },
    },
    splits = {
      "Table",
      preview_pane,
    },
  },
}

xplr.config.layouts.builtin.default =
    xplr.util.layout_replace(xplr.config.layouts.builtin.default, "Table", split_preview)
