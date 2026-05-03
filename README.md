# TODO_ModName

> TODO: Short description of what this mod does.

Part of the [TODO_PackTitle modpack](TODO_ShellUrl).

## What It Does

TODO: Explain what this module lets players control.

## Gameplay Impact

TODO: Explain how this module changes a run when enabled.

## How To Use

Install using r2modman. In game, open the TODO_PackTitle menu and configure this module from the shared settings window.

## Development

This template targets the current adamant Lib/Framework contract:

- `main.lua` owns `config`, `dataDefaults`, local `store/session`, and host creation
- module pieces are imported from `init()` after `modutil.once_loaded.game(...)`
- definitions are prepared with `lib.prepareDefinition(internal, dataDefaults, { ... })`
- storage is required and should be returned by `internal.BuildStorage()`
- hash layout hints use `hashGroupPlan`, usually returned by `internal.BuildHashGroupPlan()`
- stores are created with `local store, session = lib.createStore(config, definition)`
- hosts are created with `lib.createModuleHost(...)`; Lib publishes the live host internally
- standalone mode uses `lib.standaloneHost()` with no arguments
- module UI is written in `internal.DrawTab(ui, session)`
- optional quick UI is written in `internal.DrawQuickContent(ui, session)`
- modules that change run data declare `affectsRunData = true`
- mutation lifecycle is declared through `patchPlan` and/or manual `apply/revert`
- runtime hooks should use `lib.hooks.Wrap`, `lib.hooks.Override`, or `lib.hooks.Context.Wrap`
- modules that register hooks pass `hookOwner = internal` and `registerHooks = internal.RegisterHooks` into `lib.createModuleHost(...)`
- module logic that runs outside the draw path may read `internal.store`

Template files:

- `src/main.lua` for the module entrypoint
- `src/data.lua` for storage, hash group plans, static option lists, and lookup data
- `src/logic.lua` for patch plans, hooks, and runtime game modifications
- `src/ui.lua` for `DrawTab` and optional `DrawQuickContent`

Scaling rule:

- keep `main.lua`, `data.lua`, `ui.lua`, and `logic.lua` as the top-level contract
- let `ui.lua` import `ui/*.lua` section files when UI grows
- let `logic.lua` import `logic/*.lua` or `behaviors/*.lua` files when game logic grows
- keep store/session/host creation in `main.lua`
- keep storage schema and hash group plans in `data.lua`

Canonical docs:

- [ModpackLib GETTING_STARTED.md](https://github.com/h2-modpack/adamant-ModpackLib/blob/main/docs/GETTING_STARTED.md)
- [ModpackLib MODULE_AUTHORING.md](https://github.com/h2-modpack/adamant-ModpackLib/blob/main/docs/MODULE_AUTHORING.md)
- [ModpackLib HOT_RELOAD_ARCHITECTURE.md](https://github.com/h2-modpack/adamant-ModpackLib/blob/main/docs/HOT_RELOAD_ARCHITECTURE.md)
- [ModpackLib KNOWN_LIMITATIONS.md](https://github.com/h2-modpack/adamant-ModpackLib/blob/main/docs/KNOWN_LIMITATIONS.md)

Important:

- `public.host` is no longer part of the module contract
- `definition.hashGroups` has been replaced by `hashGroupPlan`
- `lib.standaloneHost(...)` takes no arguments
- `definition.options`, `definition.stateSchema`, `definition.ui`, `definition.customTypes`, and `definition.selectQuickUi` are legacy and unsupported
- coordinated modules should declare `modpack`, `id`, `name`, and `storage`
- the current framework contract is one tab per module

## Local Setup

1. Clone this repo
2. Run `Setup/init_repo.bat` or `Setup/init_repo.sh`
3. Run `Setup/deploy_local.bat` or `Setup/deploy_local.sh`
