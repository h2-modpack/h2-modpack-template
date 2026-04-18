-- =============================================================================
-- UI
-- =============================================================================
-- This file is imported from main.lua inside init().
-- Define DrawTab and optional DrawQuickContent here.

local internal = TemplateModule_Internal

function internal.DrawQuickContent(ui, uiState)
    lib.widgets.dropdown(ui, uiState, "Mode", {
        label = "Mode",
        values = { "Vanilla", "Chaos", "Custom" },
        controlWidth = 140,
    })
end

function internal.DrawTab(ui, uiState)
    lib.widgets.checkbox(ui, uiState, "FeatureEnabled", {
        label = "Enable Feature",
        tooltip = "Turns the feature on for this module.",
    })

    lib.widgets.dropdown(ui, uiState, "Mode", {
        label = "Mode",
        values = { "Vanilla", "Chaos", "Custom" },
        controlWidth = 180,
    })

    lib.widgets.inputText(ui, uiState, "FilterText", {
        label = "Filter",
        controlWidth = 180,
    })

    ui.Separator()
    ui.Text("Start here: replace this with your real module UI.")
end

return internal
