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

- all modules use `local dataDefaults = import("config.lua")` and `public.store = lib.createStore(config, public.definition, dataDefaults)`
- modules declare `definition.storage`
- modules declare `definition.ui` when they want Lib-managed rendering
- special modules use `public.store.uiState` in custom tabs/quick content
- modules that change run data declare `affectsRunData = true`
- lifecycle shape is inferred from `patchPlan` and/or `apply/revert`
- module-local reusable widgets/layouts may be declared in `definition.customTypes`
- quick UI nodes may opt into runtime filtering through `definition.selectQuickUi(...)`
- bootstrap uses `loader.load(init, init)`

Template files:
- `src/main_regular.lua` for regular modules
- `src/main_special.lua` for the special-module template variant in this template repo

When you create a real module repo:
- use `src/main_regular.lua` if you are building a regular module. rename to `main.lua`
- use `src/main_special.lua` if you are building a special module. rename to `main.lua` 

Use the template source files as the primary reference for code shape, then refer to the canonical docs for the full contract:

- [ModpackLib README.md](https://github.com/h2-modpack/ModpackLib/blob/main/README.md)
- [ModpackFramework README.md](https://github.com/h2-modpack/ModpackFramework/blob/main/README.md)

Important:
- `definition.options` and `definition.stateSchema` are legacy and unsupported
- quick candidate ids default from `binds`, but explicit `quickId` is recommended when runtime quick filtering is used

## Local Setup

1. Clone this repo
2. Run `Setup/init_repo.bat` or `Setup/init_repo.sh`
3. Run `Setup/deploy_local.bat` or `Setup/deploy_local.sh`
