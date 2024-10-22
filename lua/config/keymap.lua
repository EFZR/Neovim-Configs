vim.g.mapleader = " "

-- save document
vim.keymap.set("n", "<C-s>", vim.cmd.w, { desc = "Save Buffer", silent = true })
vim.keymap.set("i", "<C-s>", vim.cmd.w, { desc = "Save Buffer", silent = true })
vim.keymap.set("v", "<C-s>", vim.cmd.w, { desc = "Save Buffer", silent = true })

-- save all documents
vim.keymap.set("n", "<leader>fs", vim.cmd.wall, { desc = "Save All Buffers", silent = true })
vim.keymap.set("v", "<leader>fs", vim.cmd.wall, { desc = "Save All Buffers", silent = true })
-- vim.keymap.set("n", "<C-S-s>", vim.cmd.wall, { silent = true })
-- vim.keymap.set("i", "<cs-s>", vim.cmd.wall, { silent = true })
-- vim.keymap.set("v", "<cs-R>", vim.cmd.wall, { silent = true })
-- vim.keymap.set('n', '<leader>mq', ':wa<CR>', { desc = "Save All Buffers", })

-- Delete text
vim.keymap.set('i', '<C-Del>', "<Esc>lce")
vim.keymap.set('n', '<C-Del>', "ce")

-- Quit nvim
vim.keymap.set({ 'n', 't', 'v' }, '<leader>q', ':qa<CR>:qa<CR>:qa<CR>')
vim.keymap.set({ 'n', 't', 'v' }, '<leader>Q', ':q!<CR>:q!<CR>:q!<CR>')
vim.keymap.set('n', "<S-q>", '<cmd>:q<CR>', { desc = "Close Without Saving" })

-- Reise splits
vim.keymap.set({ 'n', 't' }, '<S-Left>', ':vertical res +1^M<CR>', { silent = true })
vim.keymap.set({ 'n', 't' }, '<S-Right>', ':vertical res -1^M<CR>', { silent = true })
vim.keymap.set({ 'n', 't' }, '<S-Up>', ':resize -1<CR>', { silent = true })
vim.keymap.set({ 'n', 't' }, '<S-Down>', ':resize +1<CR>', { silent = true })

-- Move between splits
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', { desc = 'Goto Left Buffer', silent = true })
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', { desc = 'Goto Right Buffer', silent = true })
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', { desc = 'Goto Below Buffer', silent = true })
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', { desc = 'Goto Above Buffer', silent = true })
 
-- Better line / block movement
-- vim.keymap.set('n', "<A-j>", ":m '>+1<CR>gv-gv", { silent = true })
-- vim.keymap.set('n', "<A-k>", ":m '<-2<CR>gv-gv", { silent = true })

-- Better indenting in Visual mode
vim.keymap.set('v', '>', ">gv")
vim.keymap.set('v', '<', "<gv")
vim.keymap.set('i', '<S-tab>', '<esc><<i')

-- TODO: Understand what this does.
vim.keymap.set('n', '<leader>ps', "<cmd>:w<CR>:so<CR>:Lazy sync<CR>")
vim.keymap.set('i', '<C-c>', '<Esc>')

-- Select, Paste and Copy files
vim.keymap.set('n', '<C-a>', "gg<S-v>G<CR>", { desc = "Select All File" })
vim.keymap.set('n', '<leader>fC', '<cmd>%y+<CR>', { desc = 'Copy All File To OS' })
vim.keymap.set('n', '<leader>fv', '"+p', { desc = "Paste from OS" })
vim.keymap.set('v', '<leader>fv', '"+p', { desc = "Paste from OS" })
vim.keymap.set('v', '<leader>fc', '"+y', { desc = "Copy to OS" })

-- Show Messages
vim.keymap.set('n', '<leader>ms', "<cmd>:w<CR>:so<CR>", { desc = "Shout Out" })
vim.keymap.set('n', '<leader>mm', "<cmd>:messages<CR>", { desc = "Show messages" })
vim.keymap.set('n', '<leader>mc', "<cmd>:messages clear<CR>", { desc = "Show messages" })

-- create new lines in Normal mode
vim.keymap.set('n', '<leader>o', "o<Esc>^Da<Esc>k", { desc = 'Newline Below', silent = true })
vim.keymap.set('n', '<leader>O', "O<Esc>^Da<Esc>j", { desc = 'Newline Above', silent = true })

vim.keymap.set('n', '<S-Home>', 'gg')
vim.keymap.set('n', '<S-End>', 'G')

local function toggle_highlight()
    local line_num = vim.fn.line('.')
    local highlight_group = 'LineHighlight'

    -- Get all matches
    local matches = vim.fn.getmatches()
    local match_id = nil

    -- Check if there's already a match for the current line
    for _, match in ipairs(matches) do
        if match.group == highlight_group and match.pattern == '\\%' .. line_num .. 'l' then
            match_id = match.id
            break
        end
    end

    if match_id then
        -- Remove the existing match
        vim.fn.matchdelete(match_id)
        print('Line highlight removed')
    else
        -- Add a new highlight
        vim.cmd('highlight LineHighlight ctermbg=gray guibg=gray')
        vim.fn.matchadd('LineHighlight', '\\%' .. line_num .. 'l')
        print('Line highlighted')
    end
end

-- Set the key mapping
vim.keymap.set('n', '<leader>ha', toggle_highlight, { desc = 'Toggle Highlight Line' })
vim.keymap.set('n', '<leader>hr', "<cmd>call clearmatches()<CR>", { desc = 'Toggle Highlight Line' })
