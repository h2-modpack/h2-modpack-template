-- =============================================================================
-- DATA / STORAGE
-- =============================================================================
-- This file is imported from main.lua inside init(), after once_loaded.game has fired.
-- Use it for:
-- - storage definitions
-- - hash groups
-- - static option lists
-- - lookup tables derived from game data after game script import
-- luacheck: globals TemplateModule_Internal public

local internal = TemplateModule_Internal

internal.MODE_VALUES = { "Vanilla", "Chaos", "Custom" }

public.definition.storage = {
    { type = "bool", alias = "FeatureEnabled", configKey = "FeatureEnabled" },
    { type = "string", alias = "Mode", configKey = "Mode", maxLen = 32 },
    { type = "string", alias = "FilterText", lifetime = "transient", default = "", maxLen = 64 },
}

public.definition.hashGroups = {
    {
        key = "main",
        "FeatureEnabled",
        "Mode",
    },
}

return internal
