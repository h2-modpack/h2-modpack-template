-- =============================================================================
-- ADAMANT MODULE TEMPLATE
-- =============================================================================
-- Copy this file as src/main.lua in a new mod folder.
-- Fill in the sections marked FILL below.
--
-- Works standalone with its own ImGui toggle.
-- When the coordinator is installed, the Framework handles UI — standalone UI is skipped.

local mods = rom.mods
mods['SGG_Modding-ENVY'].auto()

---@diagnostic disable: lowercase-global
rom = rom
_PLUGIN = _PLUGIN
game = rom.game
modutil = mods['SGG_Modding-ModUtil']
chalk = mods['SGG_Modding-Chalk']
reload = mods['SGG_Modding-ReLoad']
local lib = mods['adamant-Modpack_Lib']

config = chalk.auto('config.lua')
public.config = config

local backup, revert = lib.createBackupSystem()

-- =============================================================================
-- FILL: Pack identity — replace these before use
-- =============================================================================

local PACK_ID     = error("FILL: set PACK_ID to your pack id, e.g. \"h2-modpack\"")
local COORDINATOR = error("FILL: set COORDINATOR to your coordinator mod id, e.g. \"adamant-Modpack_Core\"")

-- =============================================================================
-- FILL: Module definition
-- =============================================================================

public.definition = {
    modpack      = PACK_ID, -- Opts this module into pack discovery
    id           = "",      -- Unique key
    name         = "",      -- Display name
    category     = "",      -- Tab label in the UI, e.g. "Bug Fixes" | "Run Modifiers" | "QoL"
    group        = "",      -- UI group header
    tooltip      = "",      -- Hover text
    default      = true,    -- Default enabled state
    dataMutation = true,    -- true if apply() modifies game tables, false for hook-only mods

    -- Optional: inline options rendered below the checkbox in the Framework UI.
    -- Framework handles staging, hashing, and UI — module just reads config values in hooks.
    -- Bits auto-calculated from #values if omitted.
    --
    -- Supported types:
    --   "checkbox" — toggle, stores true/false
    --   "dropdown" — combo box, stores selected string value
    --   "radio"    — radio buttons, stores selected string value
    --
    -- options = {
    --     { type = "checkbox", configKey = "Strict", label = "Strict Mode", default = false },
    --     { type = "dropdown", configKey = "Mode",   label = "Mode",
    --       values = {"Vanilla", "Always", "Never"}, default = "Vanilla" },
    --     { type = "radio",    configKey = "Speed",  label = "Speed",
    --       values = {"Slow", "Normal", "Fast"}, default = "Normal" },
    -- },
}

-- =============================================================================
-- FILL: apply() — mutate game data (use backup before changes)
-- =============================================================================

local function apply()
    -- backup(TraitData.SomeTrait, "SomeProperty")
    -- TraitData.SomeTrait.SomeProperty = newValue
end

-- =============================================================================
-- FILL: registerHooks() — wrap game functions
-- =============================================================================

local function registerHooks()
    -- modutil.mod.Path.Wrap("SomeGameFunction", function(baseFunc, ...)
    --     if not lib.isEnabled(config) then return baseFunc(...) end
    --     return baseFunc(...)
    -- end)
end

-- =============================================================================
-- Wiring (do not modify)
-- =============================================================================

public.definition.apply = apply
public.definition.revert = revert

local loader = reload.auto_single()

modutil.once_loaded.game(function()
    loader.load(function()
        import_as_fallback(rom.game)
        registerHooks()
        if lib.isEnabled(config) then apply() end
        if public.definition.dataMutation and not mods[COORDINATOR] then
            SetupRunData()
        end
    end)
end)

-- Standalone UI — menu-bar toggle when coordinator is not installed
local uiCallback = lib.standaloneUI(public.definition, config, apply, revert)
---@diagnostic disable-next-line: redundant-parameter
rom.gui.add_to_menu_bar(uiCallback)
