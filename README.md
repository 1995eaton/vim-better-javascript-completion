Installation
============

Just throw this folder in your `.vim`/`bundle` directory. This should automatically replace Vim's existing JavaScript completion plugin

Features
========

 * Much more up-to-date completion including support for many HTML5 methods/globals
 * HTML5 canvas -> getContext completion
 * NodeIterator, Treewalker, localStorage/sessionStorage methods
 * All of the existing methods were updated including the `.style` completions (webkit supported), and `console.` object

Options
=======

 * I removed a couple of things from the original plugin and turned them into options:

```viml
let g:vimjs#casesensistive = 1
" Enabled by default. flip the value to make completion matches case insensitive

let g:vimjs#smartcomplete = 0
" Disabled by default. Enabling this will let vim complete matches at any location
" e.g. typing 'ocument' will suggest 'document' if enabled.

let g:vimjs#chromeapis = 0
" Disabled by default. Toggling this will enable completion for a number of Chrome's JavaScript extension APIs
```

Example
=======

![example image](https://raw.githubusercontent.com/1995eaton/vim-better-javascript-syntax/master/example.png)
