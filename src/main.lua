-- =============================================================================
-- ADAMANT MODULE TEMPLATE
-- =============================================================================
-- Copy this file as src/main.lua in a new module repo.
-- Fill in the TODO sections below.
-- luacheck: globals rom import_as_fallback TemplateModule_Internal modutil lib _PLUGIN game

local mods = rom.mods
mods["SGG_Modding-ENVY"].auto()

---@diagnostic disable: lowercase-global
rom = rom
_PLUGIN = _PLUGIN
game = rom.game
modutil = mods["SGG_Modding-ModUtil"]
local chalk = mods["SGG_Modding-Chalk"]
local reload = mods["SGG_Modding-ReLoad"]
---@module "adamant-ModpackLib"
---@type AdamantModpackLib
lib = mods["adamant-ModpackLib"]

local dataDefaults = import("config.lua")
local config = chalk.auto("config.lua")

local PACK_ID = error("TODO: set PACK_ID to your pack id")
local MODULE_ID = "TODO_ModuleId"

---@class TemplateModuleInternal
---@field PACK_ID string|nil
---@field MODULE_ID string|nil
---@field store ManagedStore|nil
---@field standaloneUi StandaloneRuntime|nil
---@field BuildStorage fun(): StorageSchema
---@field BuildHashGroupPlan fun(): table|nil
---@field BuildPatchPlan fun(plan: table, store: ManagedStore)|nil
---@field RegisterHooks fun()|nil
---@field DrawTab fun(imgui: table, session: AuthorSession)|nil
---@field DrawQuickContent fun(imgui: table, session: AuthorSession)|nil
TemplateModule_Internal = TemplateModule_Internal or {}
---@type TemplateModuleInternal
local internal = TemplateModule_Internal
internal.PACK_ID = PACK_ID
internal.MODULE_ID = MODULE_ID

internal.standaloneUi = nil

local function registerGui()
    rom.gui.add_imgui(function()
        if internal.standaloneUi and internal.standaloneUi.renderWindow then
            internal.standaloneUi.renderWindow()
        end
    end)

    rom.gui.add_to_menu_bar(function()
        if internal.standaloneUi and internal.standaloneUi.addMenuBar then
            internal.standaloneUi.addMenuBar()
        end
    end)
end

local function init()
    import_as_fallback(rom.game)

    -- Import module pieces only after the game-readiness gate has fired.
    -- data.lua attaches storage/static data, logic.lua attaches mutation/hooks, ui.lua attaches drawing.
    import("data.lua")
    import("logic.lua")
    import("ui.lua")

    local definition = lib.prepareDefinition(internal, dataDefaults, {
        modpack = PACK_ID,
        id = MODULE_ID,
        name = "TODO Module Name",
        shortName = "TODO",
        tooltip = "TODO tooltip",
        affectsRunData = false,
        storage = internal.BuildStorage(),
        hashGroupPlan = internal.BuildHashGroupPlan and internal.BuildHashGroupPlan() or nil,
        patchPlan = internal.BuildPatchPlan,
    })

    local store, session = lib.createStore(config, definition)
    internal.store = store

    lib.createModuleHost({
        definition = definition,
        store = store,
        session = session,
        hookOwner = internal,
        registerHooks = internal.RegisterHooks,
        drawTab = internal.DrawTab,
        drawQuickContent = internal.DrawQuickContent,
    })
    internal.standaloneUi = lib.standaloneHost()
end

local loader = reload.auto_single()

modutil.once_loaded.game(function()
    loader.load(registerGui, init)
end)
