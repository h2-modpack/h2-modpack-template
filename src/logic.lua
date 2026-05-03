-- =============================================================================
-- LOGIC / GAME MODIFICATION
-- =============================================================================
-- This file is imported from main.lua inside init(), after once_loaded.game has fired.
-- Use it for:
-- - patch-plan helpers
-- - lib.hooks registration
-- - runtime functions that read `internal.store` and modify game behavior
--
-- If logic grows, keep this file as the public logic loader/router and split
-- behavior files under src/logic/ or src/behaviors/. Those files should attach
-- internal helpers; this file should own RegisterHooks and lifecycle entrypoints.
-- luacheck: globals TemplateModule_Internal lib

local internal = TemplateModule_Internal

-- Enable this shape only when the module actually mutates run data.
-- Also set `affectsRunData = true` in src/main.lua.
--
-- function internal.BuildPatchPlan(plan, activeStore)
--     if activeStore.read("FeatureEnabled") then
--         plan:set(SomeGameTable, "SomeKey", true)
--     end
-- end

function internal.RegisterHooks()
    -- Register hooks here if needed.
    -- createModuleHost() owns refresh/deactivation for omitted hooks.
-- Example:
-- lib.hooks.Wrap(internal, "FunctionName", function(baseFunc, ...)
--     if not lib.isModuleEnabled(internal.store, internal.PACK_ID) then
--         return baseFunc(...)
--     end
--     return baseFunc(...)
    -- end)
end

return internal
