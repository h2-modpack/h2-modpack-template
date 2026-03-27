# TODO_ModName

> TODO: Short description of what this mod does.

## Features

- TODO: List features

## Installation

Install via [r2modman](https://thunderstore.io/c/hades-ii/) or manually place in your `ReturnOfModding/plugins` folder.

## Configuration

This mod can be configured in-game. 
- **With H2 Modpack Core**: Press the designated hotkey (default: `F10`) to open the unified Modpack UI and toggle this mod or adjust its settings.
- **Standalone**: If you do not have the Core installed, this mod will provide its own standalone configuration menu in-game.

## Development

This module is part of the [H2 Modular Modpack](https://github.com/h2-modpack/h2-modular-modpack). Please read the main project documentation for information on architecture and conventions.

- **[Architecture](https://github.com/h2-modpack/h2-modular-modpack/blob/main/ARCHITECTURE.md)**: Framework, Lib, staging pattern, hash pipeline, module contract.
- **[Framework CONTRIBUTING.md](https://github.com/h2-modpack/adamant-ModpackFramework/blob/main/CONTRIBUTING.md)**: Discovery system, UI rendering, theme contract.
- **[Lib CONTRIBUTING.md](https://github.com/h2-modpack/adamant-ModpackLib/blob/main/CONTRIBUTING.md)**: Public API reference and shared utilities.

### Local Setup

1. Clone this repo
2. Run `Setup/init_repo.bat` (Windows) or `Setup/init_repo.sh` (Linux) to configure git hooks and branch protection
3. Run `Setup/deploy_local.bat` (Windows, as admin) or `Setup/deploy_local.sh` (Linux) to copy assets, generate manifest, and symlink into your r2modman profile
