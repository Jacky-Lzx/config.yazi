require("full-border"):setup({
  -- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
  type = ui.Border.ROUNDED,
})

require("starship"):setup({
  -- Hide flags (such as filter, find and search). This is recommended for starship themes which
  -- are intended to go across the entire width of the terminal.
  hide_flags = false, -- Default: false
  -- Whether to place flags after the starship prompt. False means the flags will be placed before the prompt.
  flags_after_prompt = true, -- Default: true
  -- Custom starship configuration file to use
  config_file = "~/.config/yazi/starship/starship_yazi.toml",
})

-- You can configure your bookmarks by lua language
local bookmarks = {}

local path_sep = package.config:sub(1, 1)
local home_path = ya.target_family() == "windows" and os.getenv("USERPROFILE") or os.getenv("HOME")
if ya.target_family() == "windows" then
  table.insert(bookmarks, {
    tag = "Scoop Local",

    path = (os.getenv("SCOOP") or home_path .. "\\scoop") .. "\\",
    key = "p",
  })
  table.insert(bookmarks, {
    tag = "Scoop Global",
    path = (os.getenv("SCOOP_GLOBAL") or "C:\\ProgramData\\scoop") .. "\\",
    key = "P",
  })
end
table.insert(bookmarks, {
  tag = "Desktop",
  path = home_path .. path_sep .. "Desktop" .. path_sep,
  key = "d",
})

require("bookmark"):setup({
  -- Optional, the path ending with path separator represents folder.
  bookmarks = bookmarks,
  -- Optional, the cli of fzf.
  cli = "fzf --preview ''",
  -- Optional, the path of bookmarks
  path = (ya.target_family() == "windows" and os.getenv("APPDATA") .. "\\yazi\\config\\bookmark")
    or (os.getenv("HOME") .. "/.config/yazi/bookmark"),
})

require("easyjump"):setup({
  icon_fg = "#94e2d5", -- color for hint labels
  first_key_fg = "#f5c2e7", -- color for first char of double-key hints
})
