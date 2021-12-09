" PLUGIN SECTION

call plug#begin("~/.vim/plugged")
	Plug 'glepnir/dashboard-nvim' " Custom dashboard
  Plug 'dracula/vim' " Theme
	Plug 'tomasr/molokai' " Theme
	Plug 'morhetz/gruvbox' " Theme
  Plug 'scrooloose/nerdtree' " File explorer
  	Plug 'ryanoasis/vim-devicons' " Icons for nerdtree
		Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " File specific colors for devicons
		Plug 'Xuyuanp/nerdtree-git-plugin' " Git status icons for nerdtree
	Plug 'scrooloose/nerdcommenter' " Comment out lots of lines
	Plug 'nvim-telescope/telescope.nvim' " Fuzzy file management
		Plug 'nvim-lua/plenary.nvim'
		Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
	Plug 'voldikss/vim-floaterm' " Floating terminal
	Plug 'neovim/nvim-lspconfig' " Language server protocol
		Plug 'williamboman/nvim-lsp-installer' " language server installer
		Plug 'hrsh7th/cmp-nvim-lsp'
		Plug 'hrsh7th/cmp-buffer'
		Plug 'hrsh7th/cmp-path'
		Plug 'hrsh7th/cmp-cmdline'
		Plug 'hrsh7th/nvim-cmp'
		Plug 'hrsh7th/cmp-vsnip'
		Plug 'hrsh7th/vim-vsnip'
		Plug 'rafamadriz/friendly-snippets'
	Plug 'mhartington/formatter.nvim' " Code formatter, similar to prettier
	Plug 'nvim-lualine/lualine.nvim' " Powerline
		Plug 'kyazdani42/nvim-web-devicons'
	Plug 'phaazon/hop.nvim' " Jump between points in document
	Plug 'wfxr/minimap.vim' " Side base code map
	Plug 'Shatur/neovim-session-manager' " Session management
	Plug 'windwp/nvim-autopairs' " Close pairs
	Plug 'tpope/vim-surround' " Wrap selected text with tags, brackets or quotes
	Plug 'maxmellon/vim-jsx-pretty' " Syntax and indenting for react
	Plug 'lewis6991/gitsigns.nvim' " Information about git changes in guttet
	Plug 'heavenshell/vim-jsdoc', {
		\ 'for': ['javascript', 'javascript.jsx','typescript'],
		\ 'do': 'make install'
	\}
call plug#end()

" CONFIG SECTION

"
" Color scheme
"
colorscheme dracula
nnoremap <leader>c :Telescope colorscheme<Enter>

"
" Neovide
"
:autocmd BufWinEnter * setlocal modifiable

"
" Colour, Fonts and Layout
"
set guifont=operatormononerdfont\ nerd\ font\ light\ 18
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175	" Blinking cursor
set termguicolors		  						" Use true colors
set encoding=utf-8                " Use UTF-8 everywhere.
syntax enable
highlight Comment cterm=italic gui=italic
" enable setting title
set title
" configure title to look like: Vim /path/to/file
set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70

"
" Editing
"
set tabstop=2                    	" Global tab width.
set shiftwidth=2                 	" And again, related.
set autoindent
set clipboard+=unnamedplus				" Clipboard for neovim
set number                        " Show line numbers.
set hidden
set hidden                        " Handle multiple buffers better.
set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set updatetime=300								" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set shortmess+=c 									" Don't pass messages to |ins-completion-menu|.
set shortmess=a
:set cmdheight=1
set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.
set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.
set title                         " Set the terminal's title
set visualbell                    " No beeping.
set directory=/tmp  							" Keep swap files in one location

"
" Nerdtree settings
"
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <leader>d :NERDTreeToggle<Enter>

"
" Plugin settings
"
filetype plugin on								" Allow filetype specific settings to override defaults (required by Nerdcommenter)

"
" Telescope settings
"
nnoremap <leader>f <cmd>Telescope find_files <cr>
nnoremap <leader>r <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope oldfiles cwd_only=true<cr>

"
" Panel navigation - move between panels with ALT + homerow
"
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"
" Integrated terminal settings
"
nnoremap <leader>t :FloatermToggle<Enter>
tnoremap <Esc> <C-\><C-n><cmd>:FloatermToggle<cr>

"
" nvim-lsp-installer - automatically load install LSP servers
" Can install LSP's with: :LspInstall
"
lua << EOF
local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
EOF

"
" Nvim CMP configuration (LONG)
"
set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

EOF

lua <<EOF
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require('cmp')
cmp.setup {

  -- ... Your other configuration ...

  mapping = {

    -- ... Your other mappings ...

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),

    -- ... Your other mappings ...

  }

  -- ... Your other configuration ...

}
EOF

"
" Formatter configuration
"
lua require('formatter').setup(...)
" use \p to pretty the current file
nnoremap <silent> <leader>p :Format<CR>

" Use prettier for the cleanup
lua <<EOF
require('formatter').setup({
  filetype = {
    javascript = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
          stdin = true
        }
      end
    },
  }
})
EOF

" Automatically pretty the file on save
lua <<EOF
vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.rs,*.lua FormatWrite
augroup END
]], true)
EOF

"
" LuaLine - Powerline
"
lua << END
require'lualine'.setup()
END


"
" Hop configuration
"
lua <<EOF
require'hop'.setup()
EOF
map <silent> <leader>q :HopWord<CR>

"
" Minimap configuration
"
"let g:minimap_width = 10
"let g:minimap_auto_start = 1
"let g:minimap_auto_start_win_enter = 1
"let g:minimap_git_colors = 1

"
" Neovim essions manager
"
lua <<EOF
require('telescope').load_extension('sessions')
local Path = require('plenary.path')
require('session_manager').setup({
  sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
  path_replacer = '__', -- The character to which the path separator will be replaced for session files.
  colon_replacer = '++', -- The character to which the colon symbol will be replaced for session files.
  autoload_mode = require('session_manager.config').AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
  autosave_last_session = true, -- Automatically save last session on exit.
  autosave_ignore_not_normal = false, -- Plugin will not save a session when no writable and listed buffers are opened.
})
EOF
" Don't save the seesion if we're on the dashboard
func! SessionSearch()
	if expand('%:t') != ""
		:SaveSession
	endif
	:Telescope sessions
endfunc
map <leader>ss <cmd>call SessionSearch()<CR>
map <silent> <leader>sc :SaveSession<CR>
"
" Nvim autopairs
"
lua <<EOF
require('nvim-autopairs').setup{}
-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
EOF

"
" Gitsigns
"

lua <<EOF
require'gitsigns'.setup()
EOF

" CREATION

" 'glephir/dashboard-nvim' {{{
let g:dashboard_default_executive ='telescope'
let g:dashboard_custom_shortcut={
\ 'last_session'       : '\ ss   ',
\ 'find_history'       : '\ b    ',
\ 'find_file'          : '\ f    ',
\ 'new_file'           : ':e     ',
\ 'change_colorscheme' : '\ c    ',
\ 'find_word'          : '\ r    ',
\ 'book_marks'         : '\ q    ',
\ }
let s:header = [
		\	'    	░██████╗░███████╗███╗░░██╗███████╗░██████╗██╗░██████╗',
		\	'     ██╔════╝░██╔════╝████╗░██║██╔════╝██╔════╝██║██╔════╝',
		\	'     ██║░░██╗░█████╗░░██╔██╗██║█████╗░░╚█████╗░██║╚█████╗░',
		\	'     ██║░░╚██╗██╔══╝░░██║╚████║██╔══╝░░░╚═══██╗██║░╚═══██╗',
		\	'     ╚██████╔╝███████╗██║░╚███║███████╗██████╔╝██║██████╔╝',
		\	'     ░╚═════╝░╚══════╝╚═╝░░╚══╝╚══════╝╚═════╝░╚═╝╚═════╝░',
    \ '',
    \ '                 [ Creation is the highest art ]                 ',
    \ ]
let s:footer = []
let g:dashboard_custom_header = s:header
let g:dashboard_custom_footer = s:footer
" }}}
