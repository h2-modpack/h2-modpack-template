# TODO_ModName

> TODO: Short description of what this mod does.

Part of the [TODO_PackTitle modpack](TODO_ShellUrl).

## Features

- TODO: List features

## Installation

Install via [r2modman](https://thunderstore.io/c/hades-ii/) or manually place in your `ReturnOfModding/plugins` folder.

## Configuration

This module is designed to work:
- standalone, using Lib's standalone UI helpers
- or under a coordinator, where Framework discovers it automatically

## Development

This template targets the current adamant Lib/Framework contract:

- all modules use `local dataDefaults = import("config.lua")`
- all modules create store with `public.store = lib.store.create(config, public.definition, dataDefaults)`
- module UI is written directly in `DrawTab(ui, uiState)`
- optional quick UI is written directly in `DrawQuickContent(ui, uiState)`
- modules that change run data declare `affectsRunData = true`
- lifecycle shape is inferred from `patchPlan` and/or `apply/revert`
- bootstrap uses `reload.auto_single()` + `modutil.once_loaded.game(...)`
- game-data imports should happen inside `init()`, after the game-readiness gate has fired

Template files:
- `src/main.lua` for the module entrypoint
- `src/data.lua` for live game-data reads / patch-plan helpers / hook setup
- `src/ui.lua` for `DrawTab` and optional `DrawQuickContent`

When you create a real module repo:
- use `src/main.lua` as the entrypoint
- keep `config.lua`, `data.lua`, and `ui.lua` split unless the module is trivial

Use the template source files as the primary reference for code shape, then refer to the canonical docs for the full contract:

- [ModpackLib README.md](https://github.com/h2-modpack/adamant-ModpackLib/blob/main/README.md)
- [ModpackFramework README.md](https://github.com/h2-modpack/adamant-ModpackFramework/blob/main/README.md)

Important:
- `definition.options` and `definition.stateSchema` are legacy and unsupported
- `definition.ui`, `definition.customTypes`, and `definition.selectQuickUi` are legacy and ignored
- coordinated modules should declare `modpack`, `id`, `name`, and `storage`
- the current framework contract is one tab per module

## Local Setup

1. Clone this repo
2. Run `Setup/init_repo.bat` or `Setup/init_repo.sh`
3. Run `Setup/deploy_local.bat` or `Setup/deploy_local.sh`
