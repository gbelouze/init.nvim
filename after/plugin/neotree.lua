-- Somehow I have to put this in after/ short of which netrw is not disabled...
require("neo-tree").setup({
    close_if_last_window = true,
    default_component_configs = {
        indent = {
            padding = 0,
        },
        icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
        },
        git_status = {
            symbols = {
                unstaged = "✗",
                staged = "✓",
                unmerged = "",
                renamed = "➜",
                untracked = "",
                deleted = "",
                ignored = "◌",
            },
        },
    },
    filesystem = {
        follow_current_file = true,
        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = true,
        filtered_items = {
            visible = false,
            hide_dotfiles = true,
            hide_gitignored = true,
            always_show = {
                ".gitignore",
            },
            never_show = {
                ".DS_Store",
                "Icon\r",
            },
        },
    },
    event_handlers = {
        {
            event = "neo_tree_buffer_enter",
            handler = function(_)
                vim.opt_local.signcolumn = "auto"
            end,
        },
    },
})
