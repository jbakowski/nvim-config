# Complete Keybindings & Functionality Reference

## Leader Key
`<leader>` = `Space` (NvChad default)

---

## Build & Development

| Keybinding | Action | Description |
|------------|--------|-------------|
| `<leader>bb` | Build menu | Open Overseer build menu (select F4/H7 build) |
| `<leader>bt` | Toggle build panel | Show/hide Overseer task panel |
| `<leader>bl` | Restart last build | Re-run the last build command |
| `<leader>bs` | Select BSP | Choose BSP variant (F4 only: pa8/pa7/nucleo) |

**Build Workflow:**
1. `<leader>bb` → Select build type
2. Enter parameters (or use defaults)
3. Build errors populate quickfix automatically
4. Use `]q` / `[q` to navigate errors

---

## File Navigation & Search

| Keybinding | Action | Description |
|------------|--------|-------------|
| `<leader>ff` | Find files | Telescope file finder (BSP filtered in F4) |
| `<leader>fw` | Live grep | Search text in files (BSP filtered in F4) |
| `<leader>fb` | Find buffers | List open buffers |
| `<leader>fh` | Find help | Search help tags |
| `<leader>fo` | Old files | Recently opened files |
| `<leader>fz` | Find in buffer | Fuzzy search current buffer |
| `<leader>ft` | Find TODOs | Search all TODO/FIXME/HACK comments |

**In Telescope:**
- `<C-j>` / `<C-k>` - Navigate results
- `<CR>` - Open file
- `<C-x>` - Open in horizontal split
- `<C-v>` - Open in vertical split
- `<Esc>` - Close

---

## Git Operations

### Git Hunk Navigation (Gitsigns)
| Keybinding | Action | Description |
|------------|--------|-------------|
| `]c` | Next hunk | Jump to next change |
| `[c` | Previous hunk | Jump to previous change |
| `<leader>hp` | Preview hunk | Show hunk diff in floating window |
| `<leader>hs` | Stage hunk | Stage current hunk (works in visual mode) |
| `<leader>hr` | Reset hunk | Discard current hunk |
| `<leader>hu` | Undo stage hunk | Unstage previously staged hunk |
| `<leader>hS` | Stage buffer | Stage entire file |
| `<leader>hR` | Reset buffer | Discard all changes in file |
| `<leader>hb` | Blame line | Show git blame for current line |
| `<leader>tb` | Toggle blame | Toggle inline blame display |
| `<leader>hd` | Diff this | Show diff in split |
| `<leader>hD` | Diff this ~ | Show diff against HEAD~ |

### Git Commands (Fugitive)
| Keybinding | Action | Description |
|------------|--------|-------------|
| `<leader>gs` | Git status | Open git status window |
| `<leader>gc` | Git commit | Open commit message editor |
| `<leader>gp` | Git push | Push to remote |

**In Git Status Window:**
- `s` - Stage file
- `u` - Unstage file
- `=` - Toggle inline diff
- `cc` - Create commit
- `-` - Stage/unstage file/hunk

### Diffview
| Keybinding | Action | Description |
|------------|--------|-------------|
| `<leader>gd` | Open diffview | Visual diff of all changes |
| `<leader>gh` | File history | History of current file |
| `<leader>gH` | Project history | History of entire project |
| `<leader>gq` | Close diffview | Close diff window |

---

## Code Navigation

### Treesitter Text Objects
| Keybinding | Action | Description |
|------------|--------|-------------|
| `vaf` | Select around function | Select entire function with signature |
| `vif` | Select inside function | Select function body only |
| `daf` | Delete around function | Delete entire function |
| `dif` | Delete inside function | Delete function body |
| `yaf` | Yank around function | Copy entire function |
| `yif` | Yank inside function | Copy function body |
| `vac` | Select around class | Select entire class/struct |
| `vic` | Select inside class | Select class body |

### Function/Class Navigation
| Keybinding | Action | Description |
|------------|--------|-------------|
| `]m` | Next function start | Jump to next function |
| `[m` | Previous function start | Jump to previous function |
| `]M` | Next function end | Jump to end of next function |
| `[M` | Previous function end | Jump to end of previous function |
| `]]` | Next class start | Jump to next class/struct |
| `[[` | Previous class start | Jump to previous class/struct |

### TODO Navigation
| Keybinding | Action | Description |
|------------|--------|-------------|
| `]t` | Next TODO | Jump to next TODO comment |
| `[t` | Previous TODO | Jump to previous TODO comment |

**TODO Keywords Recognized:**
- `TODO:` - Tasks to be done
- `FIXME:` - Things that need fixing
- `HACK:` - Temporary workarounds
- `NOTE:` - Important notes
- `PERF:` - Performance optimizations needed
- `WARN:` - Warning/deprecated code

---

## LSP (Language Server Protocol)

### Navigation
| Keybinding | Action | Description |
|------------|--------|-------------|
| `gd` | Go to definition | Jump to symbol definition |
| `gD` | Go to declaration | Jump to symbol declaration |
| `gi` | Go to implementation | Jump to implementation |
| `gr` | Go to references | Show all references |
| `K` | Hover documentation | Show docs for symbol under cursor |

### Actions
| Keybinding | Action | Description |
|------------|--------|-------------|
| `<leader>ca` | Code action | Show available code actions |
| `<leader>rn` | Rename | Rename symbol across project |
| `<leader>lf` | Format | Format current buffer |
| `]d` | Next diagnostic | Jump to next error/warning |
| `[d` | Previous diagnostic | Jump to previous error/warning |

---

## Diagnostics & Errors (Trouble)

| Keybinding | Action | Description |
|------------|--------|-------------|
| `<leader>xx` | Toggle diagnostics | Show all diagnostics in project |
| `<leader>xw` | Buffer diagnostics | Show diagnostics for current buffer |
| `<leader>xq` | Toggle quickfix | Show quickfix list (build errors) |
| `<leader>xl` | Location list | Show location list |

---

## Quickfix Navigation

| Keybinding | Action | Description |
|------------|--------|-------------|
| `]q` | Next quickfix | Jump to next error |
| `[q` | Previous quickfix | Jump to previous error |
| `<leader>qo` | Open quickfix | Open quickfix window |
| `<leader>qc` | Close quickfix | Close quickfix window |

---

## Debugging (DAP)

### Breakpoints
| Keybinding | Action | Description |
|------------|--------|-------------|
| `<leader>db` | Toggle breakpoint | Add/remove breakpoint at line |

### Debug Control
| Keybinding | Action | Description |
|------------|--------|-------------|
| `<leader>dc` | Continue/Start | Start debugging or continue execution |
| `<leader>di` | Step into | Step into function |
| `<leader>do` | Step over | Step over function |
| `<leader>dO` | Step out | Step out of function |
| `<leader>dr` | Toggle REPL | Open debug REPL |
| `<leader>dt` | Terminate | Stop debugging session |
| `<leader>du` | Toggle UI | Show/hide debug UI |
| `<leader>dl` | Show log | Show debug log |

**Debug Workflow:**
1. `<leader>db` - Set breakpoints
2. `<leader>dc` - Start debugging
3. Use step commands to navigate
4. `<leader>du` - Toggle debug UI for variables/watches

---

## Buffer Management

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Tab` | Next buffer | Switch to next buffer |
| `Shift-Tab` | Previous buffer | Switch to previous buffer |
| `<leader>x` | Close buffer | Close current buffer |
| `<leader>fb` | Find buffers | Telescope buffer picker |

---

## Window Management

| Keybinding | Action | Description |
|------------|--------|-------------|
| `<C-h>` | Left window | Move to left split |
| `<C-j>` | Down window | Move to down split |
| `<C-k>` | Up window | Move to up split |
| `<C-l>` | Right window | Move to right split |
| `<C-w>s` | Horizontal split | Split horizontally |
| `<C-w>v` | Vertical split | Split vertically |
| `<C-w>q` | Close window | Close current split |
| `<C-w>=` | Balance windows | Make all splits equal size |

---

## Terminal

| Keybinding | Action | Description |
|------------|--------|-------------|
| `<C-\>` | Toggle terminal | Open/close floating terminal |

**In Terminal Mode:**
- `<C-\>` - Close terminal
- `jk` - Exit terminal mode (if configured)

---

## Session Management

| Keybinding | Action | Description |
|------------|--------|-------------|
| `<leader>qs` | Restore session | Load session for current directory |
| `<leader>ql` | Restore last | Load last session |
| `<leader>qd` | Don't save | Stop auto-saving session |

**Session Workflow:**
1. Work in your project
2. Exit NeoVim (session auto-saves)
3. `cd /other/project && nvim`
4. `<leader>qs` - Restore that project's session

---

## General Editing

| Keybinding | Action | Description |
|------------|--------|-------------|
| `;` | Command mode | Enter command mode (same as `:`) |
| `jk` | Escape | Exit insert mode |
| `<C-s>` | Save file | Save current buffer (all modes) |
| `<leader>w` | Save | Save file (normal mode) |
| `<leader>q` | Quit | Quit NeoVim |

---

## NvChad Built-in Features

### Theme & UI
| Keybinding | Action | Description |
|------------|--------|-------------|
| `<leader>th` | Change theme | Open theme picker |
| `<leader>uu` | Update NvChad | Update NvChad base |

### File Explorer (nvim-tree)
| Keybinding | Action | Description |
|------------|--------|-------------|
| `<C-n>` | Toggle file tree | Open/close file explorer |

**In File Tree:**
- `<CR>` - Open file/folder
- `a` - Create new file
- `d` - Delete file
- `r` - Rename file
- `y` - Copy file
- `p` - Paste file
- `R` - Refresh tree

### Cheatsheet
| Keybinding | Action | Description |
|------------|--------|-------------|
| `<leader>ch` | Cheatsheet | Show keybinding cheatsheet |
| `<leader>wK` | Which-key | Show all keybindings (wait after leader) |

---

## BSP (Board Support Package) - F4 Only

The BSP system filters Telescope searches to show only files for the selected board variant.

**BSP Options:**
- `nggsm-2wa-pa8`
- `nggsm-2wa-pa7`
- `nucleo`

**How it works:**
1. `<leader>bs` - Select your BSP
2. Telescope (`<leader>ff`, `<leader>fw`) now excludes other BSPs
3. Statusline shows current BSP
4. Selection persists in `.nvim.lua`

---

## Project Detection

**Automatic Detection:**
- F4 projects: Directory contains "stm32f4" (case-insensitive)
- H7 projects: Directory contains "stm32h7" (case-insensitive)

**Indicators:**
- Statusline shows "F4" or "H7" badge
- Build menu shows appropriate templates
- BSP filtering only active in F4 projects

---

## Completion (nvim-cmp)

**In Insert Mode:**
| Keybinding | Action |
|------------|--------|
| `<C-Space>` | Trigger completion |
| `<C-j>` | Next suggestion |
| `<C-k>` | Previous suggestion |
| `<CR>` | Confirm selection |
| `<C-e>` | Close completion menu |

---

## Common Workflows

### Making a Change and Committing
```
1. Edit files
2. ]c - Jump to first change
3. <leader>hp - Preview change
4. <leader>hs - Stage this hunk
5. ]c - Next change, repeat
6. <leader>gs - Git status
7. cc - Create commit
8. <leader>gp - Push
```

### Building F4 Project
```
1. <leader>bs - Select BSP (once)
2. <leader>bb - Build menu
3. Select "STM32 F4 Build"
4. Enter parameters or use defaults
5. ]q - Jump to errors if any
```

### Finding and Fixing Code
```
1. <leader>fw - Search for "xQueueSend"
2. <CR> - Jump to result
3. Make changes
4. <leader>lf - Format
5. <C-s> - Save
```

### Debugging Session
```
1. <leader>db - Set breakpoints
2. <leader>dc - Start debug
3. <leader>du - Show debug UI
4. <leader>di - Step through code
5. <leader>dt - Terminate when done
```

---

## Tips & Tricks

1. **Which-key**: Press `<leader>` and wait - shows all available bindings
2. **Preview in Telescope**: Press `Tab` to preview without opening
3. **Visual Hunk Staging**: Select lines in visual mode, then `<leader>hs`
4. **Quick Build**: Use "STM32 F4 Build (Quick)" to skip parameter prompts
5. **Buffer Cycling**: Just use Tab/Shift-Tab for most navigation
6. **Text Objects**: Master `vaf`, `dif`, `yaf` for efficient code manipulation

---

## Plugin Documentation

For detailed plugin docs:
- `:help telescope.nvim`
- `:help gitsigns`
- `:help nvim-dap`
- `:help overseer.nvim`
- `:help trouble.nvim`

## Custom Commands

- `:SelectBSP` - Alternative to `<leader>bs`
- `:TodoTelescope` - Alternative to `<leader>ft`
- `:Mason` - Manage LSP servers
- `:Lazy` - Manage plugins
- `:checkhealth` - Diagnose issues
