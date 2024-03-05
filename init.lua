local core = require "core"
local keymap = require "core.keymap"
local config = require "core.config"

core.reload_module("colors.onedark")

local fontconfig = require "plugins.fontconfig"

fontconfig.use {
  font = { name = "Product Sans", size = 14 * SCALE },
  code_font = { name = "Iosevka Nerd Font", size = 14 * SCALE }
}

keymap.add_direct {
  ['ctrl+shift+r'] = 'core:restart'
}

config.tab_type = 'hard'
config.indent_size = 2
config.scroll_past_end = false
config.plugins.toolbarview = false
config.plugins.lsp.stop_unneeded_servers = false
local lspconfig = require "plugins.lsp.config"

local servers = { "html", "pyright", "tsserver", "cssls", "rnix", "emmetls" }

for _, k in ipairs(servers) do
  lspconfig[k].setup()
end


lspconfig.sumneko_lua.setup {
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace"
      },
      diagnostics = {
        globals = { "vim", "awesome", "client", "screen", "mouse", "tag" },
      },
    },
  }
}

local lspkind = require 'plugins.lspkind'

-- These are the available values to config
-- Default symbols require a nerd font
lspkind.setup {
  symbols = {
    Text = '',
    Method = '',
    Function = '󰊕',
    Constructor = '',
    Field = '',
    Variable = '',
    Class = '',
    Interface = '',
    Module = '',
    Property = '',
    Unit = '',
    Value = '',
    Enum = '',
    Keyword = '',
    Snippet = '',
    Color = '',
    File = '',
    Reference = '',
    Folder = '',
    EnumMember = '',
    Constant = '',
    Struct = '',
    Event = '',
    Operator = '',
    TypeParameter = '',
    Unknown = ''
  },
  format = 'symbolText',          -- available default formats are text, symbol, symbolText and textSymbol
  fontName = 'Iosevka Nerd Font', -- doesn't have to be exact
  size = 14 * SCALE,              -- Size of font for icons
  -- if the above font_name doesnt work (which will happen on windows)
  font_raw = nil                  -- renderer.font.load(USERDIR .. '/path/to/font.ttf', size * SCALE) -- as example
}
