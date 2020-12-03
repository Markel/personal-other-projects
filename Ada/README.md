# Ada
This projects consists on works that I did when I was studying Basic Programming in university.

A VsCode workspace file is provided which will divide everything in folders (although it already is). It also implements most of the commands you'll need for programming in Ada as tasks in VSCode (make sure to have GNAT included in the path). The tasks are Windows intended*.

The * mentioned before is that this .code-workspace file uses the [ada-en-vscode repository](https://github.com/Markel/ada-en-vscode) 1.0.0 version (without snippets), which works in other OSs. Actually, that repository is included as a submodule (if you check the history you may find the version without the submodule), although I don't recommend doing `git submodule init` (it downloads the submodule) as it will break some keymaps (which would be duplicated).