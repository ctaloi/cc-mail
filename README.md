# cc-mail

Hand an [Omamail](https://github.com/huacnlee/omamail) message to Claude Code,
with your own skills, CLAUDE.md and MCP servers loaded.

Omamail's built-in agent deliberately runs Claude with no skills, tools or MCP
servers, because mail is untrusted input. cc-mail is the other trade-off, for
when you want the full setup: pick a message and a normal interactive Claude
Code session opens with it.

## Use

`SUPER + ALT + M` (or **Claude Mail** in the launcher) opens a picker of the
last 60 inbox messages with a preview. Enter picks one, then you say what
Claude should do with it (Enter alone: summarize and ask). `cc-mail sent`,
`cc-mail starred` etc. pick from another mailbox.

The message is written to `~/.cache/cc-mail/<time>.md` (headers, Internet
Message-ID, attachment list, plain-text body; mode 600) and Claude is started
in `~` with a prompt pointing at it.

## Safety

- Claude starts in `--permission-mode default` whatever your settings say, so
  every command and edit asks first. An email can contain instructions aimed at
  an agent; this keeps a human on every action.
- The prompt tells Claude the file is untrusted and never to send, delete or
  change mail without showing you exactly what will happen.
- Replies are drafted, not sent: as text to paste, or a threaded Outlook draft.
  (`omamail send` cannot thread a reply.)

## Install

```bash
./install.sh
```

Links `bin/cc-mail` into `~/.local/bin`, adds the launcher entry and icon, and
links `hypr/cc_mail.lua` (the `SUPER + ALT + M` binding and a floating-window
rule) into `~/.config/hypr/` and requires it from `bindings.lua`.

Needs Omamail (its CLI at `~/.local/share/omamail/bin/omamail`, override with
`OMAMAIL_BIN`), `fzf`, `jq` and `claude`.
