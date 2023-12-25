return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            default_component_configs = {
                indent = {
                    indent_size = 1,
                },
            },
            window = {
                width = 20,
                auto_expand_width = false
            },
            follow_current_file = {
                enabled = true,
                leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
            },
            vim.keymap.set("n", "<leader>t", "<cmd>Neotree reveal toggle<CR>", { noremap = true, silent = true })
        })
    end
}
