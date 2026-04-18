-- =============================================================================
-- ADAMANT MODULE TEMPLATE
-- =============================================================================
-- Copy this file as src/main.lua in a new module repo.
-- Fill in the TODO sections below.
-- luacheck: globals rom public import_as_fallback SetupRunData TemplateModule_Internal modutil lib store _PLUGIN game

local mods = rom.mods
mods["SGG_Modding-ENVY"].auto()

---@diagnostic disable: lowercase-global
rom = rom
_PLUGIN = _PLUGIN
game = rom.game
modutil = mods["SGG_Modding-ModUtil"]
local chalk = mods["SGG_Modding-Chalk"]
local reload = mods["SGG_Modding-ReLoad"]
lib = mods["adamant-ModpackLib"]

local dataDefaults = import("config.lua")
local config = chalk.auto("config.lua")

local PACK_ID = error("TODO: set PACK_ID to your pack id")

TemplateModule_Internal = TemplateModule_Internal or {}
local internal = TemplateModule_Internal

public.definition = {
    modpack = PACK_ID,
    id = "TODO_ModuleId",
    name = "TODO Module Name",
    shortName = "TODO",
    tooltip = "TODO tooltip",
    default = dataDefaults.Enabled,
    affectsRunData = false,
    storage = {
        { type = "bool", alias = "FeatureEnabled", configKey = "FeatureEnabled", default = false },
        { type = "string", alias = "Mode", configKey = "Mode", default = "Vanilla", maxLen = 32 },
        { type = "string", alias = "FilterText", lifetime = "transient", default = "", maxLen = 64 },
    },
}

-- Optional run-data lifecycle:
--
-- public.definition.affectsRunData = true
-- public.definition.patchPlan = function(plan, store)
--     if internal.BuildPatchPlan then
--         internal.BuildPatchPlan(plan, store)
--     end
-- end
--
-- Or use apply/revert for procedural lifecycle.

public.store = nil
store = nil
internal.standaloneUi = nil

local function registerHooks()
    if internal.RegisterHooks then
        internal.RegisterHooks()
    end

    public.DrawTab = internal.DrawTab
    public.DrawQuickContent = internal.DrawQuickContent
end

local function init()
    import_as_fallback(rom.game)

    -- Import game-data readers/builders only after the game-readiness gate has fired.
    import("data.lua")
    import("ui.lua")

    public.store = lib.store.create(config, public.definition, dataDefaults)
    store = public.store

    registerHooks()

    if lib.coordinator.isEnabled(store, public.definition.modpack) then
        lib.mutation.apply(public.definition, store)
    end

    if public.definition.affectsRunData and not lib.coordinator.isCoordinated(public.definition.modpack) then
        SetupRunData()
    end

    internal.standaloneUi = lib.host.standaloneUI(
        public.definition,
        store,
        store.uiState,
        {
            getDrawTab = function()
                return public.DrawTab
            end,
        }
    )
end

local loader = reload.auto_single()

modutil.once_loaded.game(function()
    loader.load(init, init)
end)

---@diagnostic disable-next-line: redundant-parameter
rom.gui.add_imgui(function()
    if internal.standaloneUi and internal.standaloneUi.renderWindow then
        internal.standaloneUi.renderWindow()
    end
end)

---@diagnostic disable-next-line: redundant-parameter
rom.gui.add_to_menu_bar(function()
    if internal.standaloneUi and internal.standaloneUi.addMenuBar then
        internal.standaloneUi.addMenuBar()
    end
end)
