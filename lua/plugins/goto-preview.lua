return 
{
  "rmagatti/goto-preview",
  event = "BufEnter",
  config = function()
    require("goto-preview").setup {
      width = 120; -- Width of the floating window
      height = 15; -- Height of the floating window
      default_mappings = true; -- Bind default mappings
      border = { "↖", "─" ,"┐", "│", "┘", "─", "└", "│" }; -- Border characters for the floating window
      resizing_mappings = false; -- Binds arrow keys for resizing the floating window
      post_open_hook = nil; -- A function to be called after opening the preview window
      focus_on_open = true; -- Focus the floating window when opened
      dismiss_on_move = false; -- Dismiss the floating window when moving the cursor
    }
  end,
}

