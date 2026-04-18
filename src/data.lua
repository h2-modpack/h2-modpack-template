-- =============================================================================
-- DATA / GAME STATE WIRING
-- =============================================================================
-- This file is imported from main.lua inside init(), after once_loaded.game has fired.
-- Use it for:
-- - reading game data that only exists after game script import
-- - building static lookup tables from live game tables
-- - defining patch-plan helpers or hook helpers on `internal`

local internal = TemplateModule_Internal

-- Example:
--
-- function internal.BuildPatchPlan(plan, store)
--     if store.read("FeatureEnabled") then
--         plan:set(SomeGameTable, "SomeKey", true)
--     end
-- end
--
-- function internal.RegisterHooks()
--     -- Register ModUtil wraps here if needed.
-- end

return internal
