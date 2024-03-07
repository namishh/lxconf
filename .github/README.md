
### my lite-xl config

![litelx](https://i.imgur.com/4KMuvpv.png)

+ create `colors/x.lua`

```lua
local style = require "core.style"
local common = require "core.common"

style.color0 = { common.color "#272b33" }
style.color1 = { common.color "#c75f68" }
style.color2 = { common.color "#60ae7f" }
style.color3 = { common.color "#cb795f" }
style.color4 = { common.color "#7095db" }
style.color5 = { common.color "#b475c6" }
style.color6 = { common.color "#63b0b9" }
style.color7 = { common.color "#abb2bf" }
style.color8 = { common.color "#2d3139" }
style.color9 = { common.color "#e0626c" }
style.color10 = { common.color "#6bbd8c" }
style.color11 = { common.color "#e0626c" }
style.color12 = { common.color "#7ca0e3" }
style.color13 = { common.color "#bf75d4" }
style.color14 = { common.color "#63b0b9" }
style.color15 = { common.color "#abb2bf" }

style.background = { common.color "#181b21" }
style.background2 = { common.color "#111418" }
style.background3 = { common.color "#111418" }
style.text = { common.color "#abb2bf" }
style.caret = { common.color "#dcdee6" }
style.accent = { common.color "#dcdee6" }
style.dim = { common.color "#56585b" }
style.divider = { common.color "#111418" }
style.selection = { common.color "#20242C" }
style.line_number = { common.color "#56585b" }
style.line_number2 = { common.color "#dcdee6" }
style.line_highlight = { common.color "#20242C" }
style.guide_highlight = { common.color "#56585b" }
style.scrollbar = { common.color "#56585b" }
style.scrollbar2 = { common.color "#dcdee6" }

style.syntax = {
	normal = {common.color "#dcdee6"},
	symbol = {common.color "#dcdee6"},
	comment = {common.color "#56585b"},
	operator = style.color6,
	keyword2 = style.color12,
	literal = style.color5,
	keyword = style.color9,
	number = style.color5,
	string = style.color10,
	['function'] = style.color9,
	attribute = style.color5,
	boolean = style.color9,
	character = style.color10,
	conditional = style.color6,
	['conditional.ternary'] = style.color6,
	constant = style.color10,
	['constant.builtin'] = style.color1,
	define = style.color5,
	error = style.color9,
	exception = style.color7,
	include = style.color10,
	field = style.color12,
	float = style.color11,
	['function.call'] = style.color4,
	['function.builtin'] = style.color6,
	['function.macro'] = style.color6,
	--include = style.
	['keyword.function'] = style.color5,
	['keyword.return'] = style.color14,
	['keyword.operator'] = style.color6,
	label = style.color14,
	method = style.color9,
	['method.call'] = style.color4,
	namespace = style.color10,
	parameter = style.color5,
	preproc = style.color5,
	property = style.color12,
	['punctuation.delimiter'] = style.color14,
	['punctuation.bracket'] = {common.color("#dcdee6")},
	['punctuation.special'] = style.color3,
	['repeat'] = style.color5,
	storageclass = style.color10,
	['text.diff.add'] = style.color2,
	['text.diff.delete'] = style.color1,
	type = style.color6,
	['type.builtin'] = style.color5,
	['type.definition'] = style.color14,
	['type.qualifier'] = style.color5,
	['variable.builtin'] = style.color5
}

style.log.INFO  = { icon = 'i', color = style.text }
style.log.WARN  = { icon = '!', color = style.warn }
style.log.ERROR = { icon = '!', color = style.error }

style.caret_width = common.round(1.2 * SCALE)
style.gitdiff_addition = style.color2
style.gitdiff_modification = style.color4
style.gitdiff_deletion = style.color1
style.gitdiff_width = 2
style.gitdiff_padding = 4

style.gitstatus_addition = style.gitdiff_addition
style.gitstatus_modification = style.gitdiff_modification
style.gitstatus_deletion = style.gitdiff_deletion
```
