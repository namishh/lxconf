-- mod-version:3 -- lite-xl 2.1
-- Author : Juliardi
-- Email : ardi93@gmail.com
-- Github : github.com/juliardi

local command = require "core.command"
local view = require "plugins.treeview"
local fsutils = require "plugins.treeview-extender.fsutils"
local actions = require "plugins.treeview-extender.actions"

local menu = view.contextmenu

command.add(
  function()
    return view.hovered_item ~= nil
      and fsutils.is_dir(view.hovered_item.abs_filename) ~= true
  end, {
    ["treeview:duplicate-file"] = actions.duplicate_file,
    ["treeview:copy-to"] = actions.copy_to
  })

command.add(
  function()
    return view.hovered_item ~= nil
      and view.hovered_item.abs_filename ~= fsutils.project_dir()
  end, {
    ["treeview:move-to"] = actions.move_to
  })

menu:register(
  function()
    return view.hovered_item
      and (fsutils.is_dir(view.hovered_item.abs_filename) ~= true
      or view.hovered_item.abs_filename ~= fsutils.project_dir())
  end,
  {
    menu.DIVIDER,
  }
)

-- Menu 'Duplicate File..' only shown when an object is selected
-- and the object is a file
menu:register(
  function()
    return view.hovered_item
      and fsutils.is_dir(view.hovered_item.abs_filename) ~= true
  end,
  {
    { text = "Duplicate File..", command = "treeview:duplicate-file" },
    { text = "Copy To..", command = "treeview:copy-to" },
  }
)

-- Menu 'Move To..' only shown when an object is selected
-- and the object is not the project directory
menu:register(
  function()
    return view.hovered_item
      and view.hovered_item.abs_filename ~= fsutils.project_dir()
  end,
  {
    { text = "Move To..", command = "treeview:move-to" },
  }
)

return view
