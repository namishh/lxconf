
local core = require "core"
local common = require "core.common"
local style = require "core.style"
local view = require "plugins.treeview"
local fsutils = require "plugins.treeview-extender.fsutils"

local actions = {}

function actions.duplicate_file()
  local old_filename = view.hovered_item.abs_filename
  core.command_view:enter("Filename", {
    text = view.hovered_item.filename,
    suggest = common.path_suggest,
    submit = function(filename)
      local new_filename = fsutils.project_dir() .. PATHSEP .. filename

      if (fsutils.is_object_exist(new_filename)) then
        core.error("[treeview-extender] Unable to copy file : %s to %s. Duplicate name exists.", old_filename, new_filename)
        return
      end

      fsutils.copy_file(old_filename, new_filename)

      core.root_view:open_doc(core.open_doc(new_filename))
      core.log("[treeview-extender] %s duplicated to %s", old_filename, new_filename)
    end
  })
end

function actions.copy_to()
  local source_filename = view.hovered_item.abs_filename
  core.command_view:enter("Copy to", {
    text = view.hovered_item.abs_filename,
    suggest = common.path_suggest,
    submit = function(dest_filename)
      if (fsutils.is_object_exist(dest_filename)) then
        -- Ask before rewriting
          local opt = {
            { font = style.font, text = "Yes", default_yes = true },
            { font = style.font, text = "No" , default_no = true }
          }
          core.nag_view:show(
            string.format("Rewrite existing file?"),
            string.format(
              "File %s already exist. Rewrite file?",
              dest_filename
            ),
            opt,
            function(item)
              if item.text == "Yes" then
                os.remove(dest_filename)
                fsutils.copy_file(source_filename, dest_filename)
              else
                return
              end
            end
          )
      else
        fsutils.copy_file(source_filename, dest_filename)
      end

      core.root_view:open_doc(core.open_doc(dest_filename))
      core.log("[treeview-extender] %s copied to %s", source_filename, dest_filename)
    end
  })
end

function actions.move_to()
  local old_abs_filename = view.hovered_item.abs_filename
  core.command_view:enter("Move to", {
    text = view.hovered_item.abs_filename,
    suggest = common.path_suggest,
    submit = function(new_abs_filename)
      if (fsutils.is_object_exist(new_abs_filename)) then
        -- Ask before rewriting
        local opt = {
          { font = style.font, text = "Yes", default_yes = true },
          { font = style.font, text = "No" , default_no = true }
        }
        core.nag_view:show(
          string.format("Rewrite existing file?"),
          string.format(
            "File %s already exist. Rewrite file?",
            new_abs_filename
          ),
          opt,
          function(item)
            if item.text == "Yes" then
              os.remove(new_abs_filename)
              fsutils.move_object(old_abs_filename, new_abs_filename)

              core.log("[treeview-extender] %s moved to %s", old_abs_filename, new_abs_filename)
            end
          end
        )
      else
        fsutils.move_object(old_abs_filename, new_abs_filename)
        core.log("[treeview-extender] %s moved to %s", old_abs_filename, new_abs_filename)
      end
    end
  })
end

return actions
