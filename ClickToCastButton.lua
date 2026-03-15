-- ClickToCastButton
-- Adds a button to the spellbook to open click-to-cast bindings

local addonName, addon = ...
local buttonCreated = false

local function CreateClickToCastButton()
    if buttonCreated then return end
    
    -- Find the appropriate spellbook frame
    local spellbookFrame = PlayerSpellsFrame or SpellBookFrame
    if not spellbookFrame then return end
    
    buttonCreated = true
    
    -- Create the button
    local button = CreateFrame("Button", "ClickToCastButtonFrame", spellbookFrame, "UIPanelButtonTemplate")
    button:SetSize(140, 22)
    button:SetText("Click-to-Cast")
    button:SetPoint("TOP", spellbookFrame, "TOP", 0, -30)
    button:SetFrameStrata("HIGH")

    -- Set up click handler
    button:SetScript("OnClick", function()
        if ClickBindingFrame then
            if ClickBindingFrame:IsShown() then
                ClickBindingFrame:Hide()
            else
                ClickBindingFrame:Show()
            end
        else
            -- Fallback: try to load the click binding frame addon if not loaded
            if C_AddOns and C_AddOns.LoadAddOn then
                C_AddOns.LoadAddOn("Blizzard_ClickBindingUI")
            elseif LoadAddOn then
                LoadAddOn("Blizzard_ClickBindingUI")
            end
            if ClickBindingFrame then
                ClickBindingFrame:Show()
            end
        end
    end)

    -- Add tooltip
    button:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("Click-to-Cast Bindings")
        GameTooltip:AddLine("Open the click-to-cast binding interface.", 1, 1, 1, true)
        GameTooltip:Show()
    end)

    button:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    return button
end

-- Wait for the spellbook to load before creating our button
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function(self, event, loadedAddon)
    if event == "ADDON_LOADED" then
        if loadedAddon == "Blizzard_PlayerSpells" or loadedAddon == "Blizzard_SpellBookUI" then
            CreateClickToCastButton()
        end
    elseif event == "PLAYER_LOGIN" then
        -- Try to create button after login in case spellbook was already loaded
        CreateClickToCastButton()
    end
end)

-- If the spellbook is already loaded, create the button now
if PlayerSpellsFrame or SpellBookFrame then
    CreateClickToCastButton()
end
