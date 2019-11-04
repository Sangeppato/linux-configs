# Vim Cheats

## Edit/Write/Save

* `vim -p <file1> <file2> ...` edit multiple files in tabs

* `:edit <name_file>`

* `:tabnew / :tabedit <name_file>`

* `:saveas <name_file>`

* `:tabclose` close current tab

* `:tabonly / :tabo` close all other tabs

* `:qa , :wqa , :xa` close (and save) all tabs

* `I` insert at begginning of the line

* `A` append at the end of the line

## Undo/Repeat

* `.` repeat last command

* `<C-r> ` redo

* `u` undo

## Yank/Delete

* `yy / Y` yank current line

* `y$` yank until the end of the line

* `d$ / D` delete(cut) until the end of the line

## Search

* `/patter` search for pattern

* `?patter` search for pattern backwards

* `n` repeat search in the same direction

* `N` repeat search in the sopposite direction

## Fold

* `zc , zo , za` close, open, toggle current fold

* `zC , zO , zA` close, open, toggle current and parent folds

* `zr , zR` open one more folding level, open ALL folds

* `zm , zM` close one more folding level, close ALL folds

## Session

* `:mksession <session-name>.vim` save current session with <session-name> (add `!` to override)

* `vim -S <session-name>.vim / :source <session-name>.vim` edit <session-name>

* `:mks` save a session called session

## Other functions

* `=i{` indent current block

* `>i{ / <i{` increase/decrease the indentation

* `:r[ead] !{cmd}` execute {cmd} and insert its standard output below the cursor

## Personal shortcuts

* `\` windows shortcut

* `<leader>e` toggle NerdTree

* `<leader>o / <leader>p` cycle tabs

* `<leader>\` toggle indent guides

* `<leader>l` use relative line numbers

## NERDTree

* `CC` set this as root direcory

* `u` go up to parent folder

## Coc

* `F2 / rn` change all occurences

* `F12 / gd` go to definition
