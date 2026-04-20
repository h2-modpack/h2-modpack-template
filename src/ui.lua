-- =============================================================================
-- UI
-- =============================================================================
-- This file is imported from main.lua inside init().
-- Define DrawTab and optional DrawQuickContent here.
--
-- If the UI grows, keep this file as the public UI loader/router and split sections
-- into files under src/ui/. Those files should define internal draw helpers only.
--
-- Example:
-- import("ui/settings.lua")
-- import("ui/advanced.lua")
--
-- function internal.DrawTab(ui, session)
--     internal.DrawSettings(ui, session)
--     internal.DrawAdvanced(ui, session)
-- end
-- luacheck: globals TemplateModule_Internal lib

local internal = TemplateModule_Internal

function internal.DrawQuickContent(ui, session)
    lib.widgets.dropdown(ui, session, "Mode", {
        label = "Mode",
        values = internal.MODE_VALUES,
        controlWidth = 140,
    })
end

function internal.DrawTab(ui, session)
    lib.widgets.checkbox(ui, session, "FeatureEnabled", {
        label = "Enable Feature",
        tooltip = "Turns the feature on for this module.",
    })

    lib.widgets.dropdown(ui, session, "Mode", {
        label = "Mode",
        values = internal.MODE_VALUES,
        controlWidth = 180,
    })

    lib.widgets.inputText(ui, session, "FilterText", {
        label = "Filter",
        controlWidth = 180,
    })

    ui.Separator()
    ui.Text("Start here: replace this with your real module UI.")
end

return internal
