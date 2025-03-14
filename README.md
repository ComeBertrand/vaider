# vaider

A Vim plugin for seamless integration with [Aider](https://github.com/Aider-AI/aider), an AI pair programming tool.

## Features

- Start Aider directly from Vim
- Easily add the current file to Aider's context
- Reset Aider conversations without leaving Vim
- Supports reviewing changes before committing (no auto-commits by default)

## Requirements

- Vim 8.1+ with terminal support
- Aider CLI tool installed and accessible in your PATH

## Installation

### Using vim-plug

Add the following to your `.vimrc`:

```vim
Plug 'ComeBertrand/vaider'
```

Then run `:PlugInstall`.

### Using Vundle

Add the following to your `.vimrc`:

```vim
Plugin 'ComeBertrand/vaider'
```

Then run `:PluginInstall`.

### Using Pathogen

```bash
git clone https://github.com/ComeBertrand/vaider.git ~/.vim/bundle/vaider
```

## Configuration

The plugin provides several configuration options:

```vim
" Disable auto-commits (default: 0)
let g:aider_autocommit = 0

" Custom Aider command (default: 'aider')
let g:aider_command = 'aider'

" Additional arguments for Aider
let g:aider_args = '--model gpt-4'
```

## Usage

### Commands

- `:AiderStart` - Start Aider in a new terminal window
- `:AiderAddFile` - Add the current file to Aider's context
- `:AiderReset` - Reset the current Aider conversation

## Workflow Example

1. Open your project files in Vim
2. Start Aider using `:AiderStart`
3. Navigate to a file you want to modify
4. Add it to Aider's context using `:AiderAddFile`
5. Interact with Aider in the terminal window
6. Review changes before committing

## License

MIT
