-- =============================================================================
-- DATA / STORAGE
-- =============================================================================
-- This file is imported from main.lua inside init(), after once_loaded.game has fired.
-- Use it for:
-- - storage definitions
-- - hash group plans
-- - static option lists
-- - lookup tables derived from game data after game script import
-- luacheck: globals TemplateModule_Internal

local internal = TemplateModule_Internal

internal.MODE_VALUES = { "Vanilla", "Chaos", "Custom" }

function internal.BuildStorage()
    return {
        { type = "bool", alias = "FeatureEnabled", configKey = "FeatureEnabled" },
        { type = "string", alias = "Mode", configKey = "Mode", maxLen = 32 },
        { type = "string", alias = "FilterText", lifetime = "transient", default = "", maxLen = 64 },
    }
end

function internal.BuildHashGroupPlan()
    return {
        {
            key = "main",
            "FeatureEnabled",
            "Mode",
        },
    }
end

return internal
