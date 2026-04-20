-- =============================================================================
-- LOGIC / GAME MODIFICATION
-- =============================================================================
-- This file is imported from main.lua inside init(), after once_loaded.game has fired.
-- Use it for:
-- - patch-plan helpers
-- - ModUtil hook registration
-- - runtime functions that read `internal.store` and modify game behavior
--
-- If logic grows, keep this file as the public logic loader/router and split
-- behavior files under src/logic/ or src/behaviors/. Those files should attach
-- internal helpers; this file should own RegisterHooks and lifecycle entrypoints.
--
-- Example:
-- import("logic/hooks.lua")
-- import("logic/patches.lua")
--
-- function internal.RegisterHooks()
--     internal.RegisterGameplayHooks()
-- end
-- luacheck: globals TemplateModule_Internal public modutil lib

local internal = TemplateModule_Internal

-- Enable this shape only when the module actually mutates run data:
--
-- public.definition.affectsRunData = true
-- public.definition.patchPlan = function(plan, activeStore)
--     if activeStore.read("FeatureEnabled") then
--         plan:set(SomeGameTable, "SomeKey", true)
--     end
-- end

function internal.RegisterHooks()
    -- Register ModUtil wraps here if needed.
    -- Example:
    -- modutil.mod.Path.Wrap("FunctionName", function(baseFunc, ...)
    --     if not lib.isModuleEnabled(internal.store, public.definition.modpack) then
    --         return baseFunc(...)
    --     end
    --     return baseFunc(...)
    -- end)
end

return internal
