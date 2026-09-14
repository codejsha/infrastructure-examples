######################################################################

brew install herdr

herdr --version

herdr status
herdr status server
herdr status client

######################################################################

herdr server
herdr server stop

herdr session list
herdr workspace list
herdr worktree list
herdr tab list
herdr pane list
herdr agent list

######################################################################

### config file
herdr --default-config
herdr --default-config > ~/.config/herdr/config.toml

### check config
herdr config check

### reload config
herdr server reload-config

######################################################################

### integrations

herdr integration status

herdr integration install claude
herdr integration install codex
herdr integration install copilot

herdr integration uninstall claude
herdr integration uninstall codex
herdr integration uninstall copilot

