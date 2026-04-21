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
- all modules create local store/session with `local store, session = lib.createStore(config, public.definition, dataDefaults)`
- all modules expose `public.host = lib.createModuleHost(...)`
- modules may copy `store` to `internal.store` for hook/logic code that runs outside the draw path
- module UI is written directly in `internal.DrawTab(ui, session)`
- optional quick UI is written directly in `internal.DrawQuickContent(ui, session)`
- modules that change run data declare `affectsRunData = true`
- lifecycle shape is inferred from `patchPlan` and/or `apply/revert`
- bootstrap uses `reload.auto_single()` + `modutil.once_loaded.game(...)`
- game-data imports should happen inside `init()`, after the game-readiness gate has fired
- annotate `lib` as `AdamantModpackLib` and type the module `internal` table so LuaLS can infer `AuthorSession` through `internal.DrawTab = function(...)`

Template files:
- `src/main.lua` for the module entrypoint
- `src/data.lua` for storage, hash groups, static option lists, and lookup data
- `src/logic.lua` for patch plans, hooks, and runtime game modifications
- `src/ui.lua` for `DrawTab` and optional `DrawQuickContent`

When you create a real module repo:
- use `src/main.lua` as the entrypoint
- keep `config.lua`, `data.lua`, `logic.lua`, and `ui.lua` split unless the module is trivial

Recommended ownership:
- `main.lua` gathers module pieces, creates local store/session, creates `public.host`, and wires standalone rendering
- `data.lua` declares what exists
- `ui.lua` edits session-backed settings
- `logic.lua` applies settings to the game through `internal.store`

Scaling rule:
- keep `main.lua`, `data.lua`, `ui.lua`, and `logic.lua` as the top-level contract
- let `ui.lua` import `ui/*.lua` section files when UI grows
- let `logic.lua` import `logic/*.lua` or `behaviors/*.lua` files when game logic grows
- keep store/session/host creation in `main.lua`
- keep storage schema and hash groups in `data.lua`

Use the template source files as the primary reference for code shape, then refer to the canonical docs for the full contract:

- [ModpackLib GETTING_STARTED.md](https://github.com/h2-modpack/adamant-ModpackLib/blob/main/GETTING_STARTED.md)
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
