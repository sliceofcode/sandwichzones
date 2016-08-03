--
-- .d8888.  .d8b.  d8b   db d8888b. db   d8b   db d888888b  .o88b. db   db      d88888D  .d88b.  d8b   db d88888b .d8888.
-- 88'  YP d8' `8b 888o  88 88  `8D 88   I8I   88   `88'   d8P  Y8 88   88      YP  d8' .8P  Y8. 888o  88 88'     88'  YP
-- `8bo.   88ooo88 88V8o 88 88   88 88   I8I   88    88    8P      88ooo88         d8'  88    88 88V8o 88 88ooooo `8bo.
--   `Y8b. 88~~~88 88 V8o88 88   88 Y8   I8I   88    88    8b      88~~~88        d8'   88    88 88 V8o88 88~~~~~   `Y8b.
-- db   8D 88   88 88  V888 88  .8D `8b d8'8b d8'   .88.   Y8b  d8 88   88       d8' db `8b  d8' 88  V888 88.     db   8D
-- `8888Y' YP   YP VP   V8P Y8888D'  `8b8' `8d8'  Y888888P  `Y88P' YP   YP      d88888P  `Y88P'  VP   V8P Y88888P `8888Y'
--
-- This file is part of Sandwich Zones.
-- (c) 2016 System16

SZ.Log("init settings")

local SettingsUISettings = {
	IgnoreZ = {
		NiceName = SZ.Lang.UIZoneIgnoreZ,
		Type = "bool"
	}
}

function SZ.CL.Settings.Show()
	local frame = vgui.Create("DFrame")
	frame:SetSize(300, 400)
	frame:SetTitle(SZ.Lang.UITitleSettings)
	frame:Center()
	frame:MakePopup()

	local checks = vgui.Create("DListLayout", frame)
	checks:Dock(FILL)

	for identifier, opt in pairs(SettingsUISettings) do
		-- Make checkbox when settings type is a boolean
		if opt.Type == "bool" then
			local checkbox = vgui.Create("DCheckBoxLabel", checks)

			-- Apply text.
			checkbox:SetText(opt.NiceName)

			-- Check if the setting is already enabled.
			checkbox:SetChecked(SZ.CL.Settings[identifier])

			-- On change, reflect changes immediately.
			function checkbox:OnChange(val)
				SZ.CL.Settings[identifier] = val
			end

			checks:Add(checkbox)
		end
	end
end