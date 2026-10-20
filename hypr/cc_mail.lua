-- cc-mail: hand an Omamail message to Claude Code (~/src/cc-mail).

o.bind("SUPER + ALT + M", "Hand email to Claude Code", "omarchy-launch-tui --app-id=org.omarchy.ccmail cc-mail")

-- The picker and the Claude session that replaces it both want room; a fresh
-- tile on a busy workspace leaves the list a column of dates.
o.window("org.omarchy.ccmail", { float = true, center = true, size = { 1200, 780 } })
