-- Somehow I have to put this in after/ short of which netrw is not disabled...
require("neo-tree").setup({
    close_if_last_window = true,
    sources = {
        "filesystem",
        "buffers",
        "git_status",
        "document_symbols",
    },
    source_selector = {
        sources = {
            { source = "filesystem" },
            { source = "buffers" },
            { source = "git_status" },
            { source = "document_symbols" },
        },
        winbar = true,
        content_layout = "center",
        tab_labels = {
            filesystem = " File",
            buffers = "➜ Buffs",
            git_status = " Git",
            document_symbols = " Symbols",
        },
    },
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
    window = {
        width = 30,
        mappings = {
            ["o"] = "open",
            ["v"] = "open_vsplit",
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
