local cloneref = (cloneref or clonereference or function(instance: any)
    return instance
end)
local clonefunction = (clonefunction or copyfunction or function(func) 
    return func 
end)

local HttpService: HttpService = cloneref(game:GetService("HttpService"))
local isfolder, isfile, listfiles = isfolder, isfile, listfiles

if typeof(clonefunction) == "function" then
    -- Fix is_____ functions for shitsploits, those functions should never error, only return a boolean.

    local
        isfolder_copy,
        isfile_copy,
        listfiles_copy = clonefunction(isfolder), clonefunction(isfile), clonefunction(listfiles)

    local isfolder_success, isfolder_error = pcall(function()
        return isfolder_copy("test" .. tostring(math.random(1000000, 9999999)))
    end)

    if isfolder_success == false or typeof(isfolder_error) ~= "boolean" then
        isfolder = function(folder)
            local success, data = pcall(isfolder_copy, folder)
            return (if success then data else false)
        end

        isfile = function(file)
            local success, data = pcall(isfile_copy, file)
            return (if success then data else false)
        end

        listfiles = function(folder)
            local success, data = pcall(listfiles_copy, folder)
            return (if success then data else {})
        end
    end
end

local ThemeManager = {}
do
    local ThemeFields = { "FontColor", "MainColor", "AccentColor", "BackgroundColor", "OutlineColor" }
    ThemeManager.Folder = "ObsidianLibSettings"
    -- if not isfolder(ThemeManager.Folder) then makefolder(ThemeManager.Folder) end

    ThemeManager.Library = nil
    ThemeManager.AppliedToTab = false
    ThemeManager.BuiltInThemes = {
        ["Revenant"] = {
            1,
            { FontColor = "ffffff", MainColor = "000000", AccentColor = "a6a6a6", BackgroundColor = "090909", OutlineColor = "090909", FontFace = "Gotham" },
        },
        ["Default Obsidian"] = {
            2,
            { FontColor = "ffffff", MainColor = "191919", AccentColor = "7d55ff", BackgroundColor = "0f0f0f", OutlineColor = "282828", FontFace = "Code" },
        },
        ["Old Revenant."] = {
            3,
            { FontColor = "ffffff", MainColor = "191919", AccentColor = "a2a2a2", BackgroundColor = "000000", OutlineColor = "282828", FontFace = "Gotham" },
        },
        ["Aurora"] = {
            4,
            { FontColor = "e0f7fa", MainColor = "2b303b", AccentColor = "81a1c1", BackgroundColor = "1c222b", OutlineColor = "3e4755", FontFace = "Gotham" },
        },
        ["BBot"] = {
            5,
            { FontColor = "ffffff", MainColor = "1e1e1e", AccentColor = "7e48a3", BackgroundColor = "232323", OutlineColor = "141414", FontFace = "Gotham" },
        },
        ["Berry Smoothie"] = {
            6,
            { FontColor = "ffffff", MainColor = "722f37", AccentColor = "d36ba6", BackgroundColor = "40102b", OutlineColor = "703060", FontFace = "Gotham" },
        },
        ["Buttercup"] = {
            7,
            { FontColor = "ffffff", MainColor = "967011", AccentColor = "ffeb3b", BackgroundColor = "3a301a", OutlineColor = "7a6d28", FontFace = "Gotham" },
        },
        ["Candy Cane"] = {
            8,
            { FontColor = "000000", MainColor = "ff9191", AccentColor = "ec3737", BackgroundColor = "fccbcb", OutlineColor = "b49797", FontFace = "Gotham" },
        },
        ["Candy Pop"] = {
            9,
            { FontColor = "ffffff", MainColor = "5e2e65", AccentColor = "00e6e6", BackgroundColor = "1c002a", OutlineColor = "4a0044", FontFace = "Gotham" },
        },
        ["Canyon Clay"] = {
            10,
            { FontColor = "ffffff", MainColor = "7f5539", AccentColor = "d78e6c", BackgroundColor = "3a2117", OutlineColor = "6c4a3b", FontFace = "Gotham" },
        },
        ["Catppuccin"] = {
            11,
            { FontColor = "d9e0ee", MainColor = "302d41", AccentColor = "f5c2e7", BackgroundColor = "1e1e2e", OutlineColor = "575268", FontFace = "Gotham" },
        },
        ["Celestial"] = {
            12,
            { FontColor = "eaeaf2", MainColor = "1f1c3c", AccentColor = "7986cb", BackgroundColor = "0b0928", OutlineColor = "362e61", FontFace = "Gotham" },
        },
        ["Copper Canyon"] = {
            13,
            { FontColor = "ffffff", MainColor = "7c2d12", AccentColor = "ff7043", BackgroundColor = "38190a", OutlineColor = "5c321d", FontFace = "Gotham" },
        },
        ["Crimson Tide"] = {
            14,
            { FontColor = "ffffff", MainColor = "5a0000", AccentColor = "ff1744", BackgroundColor = "330000", OutlineColor = "990000", FontFace = "Gotham" },
        },
        ["Cyberpunk"] = {
            15,
            { FontColor = "f9f9f9", MainColor = "262335", AccentColor = "00ff9f", BackgroundColor = "1a1a2e", OutlineColor = "413c5e", FontFace = "Gotham" },
        },
        ["Deep Space"] = {
            16,
            { FontColor = "cfd8dc", MainColor = "0d1b2a", AccentColor = "4e8bbf", BackgroundColor = "081421", OutlineColor = "284259", FontFace = "Gotham" },
        },
        ["Desert Storm"] = {
            17,
            { FontColor = "ffffff", MainColor = "c6ab80", AccentColor = "af8e6a", BackgroundColor = "372d26", OutlineColor = "6b5541", FontFace = "Gotham" },
        },
        ["Dracula"] = {
            18,
            { FontColor = "f8f8f2", MainColor = "44475a", AccentColor = "ff79c6", BackgroundColor = "282a36", OutlineColor = "6272a4", FontFace = "Gotham" },
        },
        ["Dust Bowl"] = {
            19,
            { FontColor = "ffffff", MainColor = "5c4537", AccentColor = "b2957e", BackgroundColor = "3b3024", OutlineColor = "7a6d58", FontFace = "Gotham" },
        },
        ["Dusty Rose"] = {
            20,
            { FontColor = "ffffff", MainColor = "ba6b6c", AccentColor = "f4a7b9", BackgroundColor = "3d1f23", OutlineColor = "70454b", FontFace = "Gotham" },
        },
        ["Electric Lime"] = {
            21,
            { FontColor = "d4d4d4", MainColor = "454f09", AccentColor = "aeea00", BackgroundColor = "222222", OutlineColor = "4f4f4f", FontFace = "Gotham" },
        },
        ["Emerald Dream"] = {
            22,
            { FontColor = "e0ffe0", MainColor = "014421", AccentColor = "33cc99", BackgroundColor = "001a10", OutlineColor = "02442b", FontFace = "Gotham" },
        },
        ["Fatality"] = {
            23,
            { FontColor = "ffffff", MainColor = "1e1842", AccentColor = "c50754", BackgroundColor = "191335", OutlineColor = "3c355d", FontFace = "Gotham" },
        },
        ["Flame Ember"] = {
            24,
            { FontColor = "ffffff", MainColor = "692423", AccentColor = "ff7043", BackgroundColor = "2e0005", OutlineColor = "8b3a3a", FontFace = "Gotham" },
        },
        ["Forest Mist"] = {
            25,
            { FontColor = "dcedc8", MainColor = "2e4d2b", AccentColor = "a8d5ba", BackgroundColor = "1b2f20", OutlineColor = "3c5a3d", FontFace = "Gotham" },
        },
        ["Glacial"] = {
            26,
            { FontColor = "e0f7fa", MainColor = "2c3e50", AccentColor = "4dd0e1", BackgroundColor = "1a2d3a", OutlineColor = "2c5f58", FontFace = "Gotham" },
        },
        ["Goldenrod"] = {
            27,
            { FontColor = "ffffff", MainColor = "8c7a3f", AccentColor = "ffd54f", BackgroundColor = "4c3d20", OutlineColor = "6e5e3a", FontFace = "Gotham" },
        },
        ["Graphite"] = {
            28,
            { FontColor = "d1d1d1", MainColor = "2b2b2b", AccentColor = "777777", BackgroundColor = "1a1a1a", OutlineColor = "444444", FontFace = "Gotham" },
        },
        ["Gruvbox"] = {
            29,
            { FontColor = "ebdbb2", MainColor = "3c3836", AccentColor = "fb4934", BackgroundColor = "282828", OutlineColor = "504945", FontFace = "Gotham" },
        },
        ["Iceberg"] = {
            30,
            { FontColor = "ffffff", MainColor = "1e3d59", AccentColor = "00b7ff", BackgroundColor = "12273d", OutlineColor = "30577a", FontFace = "Gotham" },
        },
        ["Inferno"] = {
            31,
            { FontColor = "ffffff", MainColor = "4b000f", AccentColor = "ff3300", BackgroundColor = "2e0005", OutlineColor = "7a0011", FontFace = "Gotham" },
        },
        ["Jade Forest"] = {
            32,
            { FontColor = "f0fff0", MainColor = "0a2c2a", AccentColor = "3bbf9b", BackgroundColor = "081d1b", OutlineColor = "205752", FontFace = "Gotham" },
        },
        ["Jester"] = {
            33,
            { FontColor = "ffffff", MainColor = "242424", AccentColor = "db4467", BackgroundColor = "1c1c1c", OutlineColor = "373737", FontFace = "Gotham" },
        },
        ["Lavender Mist"] = {
            34,
            { FontColor = "faf0ff", MainColor = "7e5a9b", AccentColor = "cba5e6", BackgroundColor = "44275a", OutlineColor = "71538c", FontFace = "Gotham" },
        },
        ["Lunar Eclipse"] = {
            35,
            { FontColor = "dcdcdc", MainColor = "2c2933", AccentColor = "908ec3", BackgroundColor = "1b1823", OutlineColor = "3e3a4e", FontFace = "Gotham" },
        },
        ["Marshmallow"] = {
            36,
            { FontColor = "000000", MainColor = "eccbea", AccentColor = "f8bbd0", BackgroundColor = "e4dfdf", OutlineColor = "96a8d7", FontFace = "Gotham" },
        },
        ["Material"] = {
            37,
            { FontColor = "eeffff", MainColor = "212121", AccentColor = "82aaff", BackgroundColor = "151515", OutlineColor = "424242", FontFace = "Gotham" },
        },
        ["Midnight Blue"] = {
            38,
            { FontColor = "e0eaf2", MainColor = "1a2634", AccentColor = "5c8fc0", BackgroundColor = "0f1221", OutlineColor = "2c3e50", FontFace = "Gotham" },
        },
        ["Midnight Orchid"] = {
            39,
            { FontColor = "f8f8ff", MainColor = "2a1e3b", AccentColor = "b86bbe", BackgroundColor = "1a0c27", OutlineColor = "4f2b55", FontFace = "Gotham" },
        },
        ["Mint"] = {
            40,
            { FontColor = "ffffff", MainColor = "242424", AccentColor = "3db488", BackgroundColor = "1c1c1c", OutlineColor = "373737", FontFace = "Gotham" },
        },
        ["Mint Chocolate"] = {
            41,
            { FontColor = "ffffff", MainColor = "2e4639", AccentColor = "a1c349", BackgroundColor = "1c2f24", OutlineColor = "3c5a4e", FontFace = "Gotham" },
        },
        ["Mocha Mist"] = {
            42,
            { FontColor = "f5e1da", MainColor = "6b4c3b", AccentColor = "bc987e", BackgroundColor = "3c2b24", OutlineColor = "795b48", FontFace = "Gotham" },
        },
        ["Monokai"] = {
            43,
            { FontColor = "f8f8f2", MainColor = "272822", AccentColor = "f92672", BackgroundColor = "1e1f1c", OutlineColor = "49483e", FontFace = "Gotham" },
        },
        ["Mystic Violet"] = {
            44,
            { FontColor = "f0e6ff", MainColor = "3e1f47", AccentColor = "ba68c8", BackgroundColor = "2a102f", OutlineColor = "5c3d63", FontFace = "Gotham" },
        },
        ["Neon Jungle"] = {
            45,
            { FontColor = "ccff99", MainColor = "1a1f27", AccentColor = "00ff88", BackgroundColor = "0d0d0d", OutlineColor = "2a2a2a", FontFace = "Gotham" },
        },
        ["Nord"] = {
            46,
            { FontColor = "eceff4", MainColor = "3b4252", AccentColor = "88c0d0", BackgroundColor = "2e3440", OutlineColor = "4c566a", FontFace = "Gotham" },
        },
        ["Ocean Breeze"] = {
            47,
            { FontColor = "e0f7fa", MainColor = "005377", AccentColor = "00bcd4", BackgroundColor = "002d3a", OutlineColor = "014f62", FontFace = "Gotham" },
        },
        ["Ocean Pearl"] = {
            48,
            { FontColor = "ffffff", MainColor = "036865", AccentColor = "42eecf", BackgroundColor = "002f3a", OutlineColor = "014f52", FontFace = "Gotham" },
        },
        ["Oceanic Next"] = {
            49,
            { FontColor = "d8dee9", MainColor = "1b2b34", AccentColor = "6699cc", BackgroundColor = "16232a", OutlineColor = "343d46", FontFace = "Gotham" },
        },
        ["One Dark"] = {
            50,
            { FontColor = "abb2bf", MainColor = "282c34", AccentColor = "c678dd", BackgroundColor = "21252b", OutlineColor = "5c6370", FontFace = "Gotham" },
        },
        ["Opal Glow"] = {
            51,
            { FontColor = "f0fff0", MainColor = "567572", AccentColor = "b2f5ea", BackgroundColor = "213837", OutlineColor = "2b4f3c", FontFace = "Gotham" },
        },
        ["Peach Fuzz"] = {
            52,
            { FontColor = "ffffff", MainColor = "b6846b", AccentColor = "ff8e72", BackgroundColor = "3a2525", OutlineColor = "7f5a56", FontFace = "Gotham" },
        },
        ["Peacock Feather"] = {
            53,
            { FontColor = "ffffff", MainColor = "004953", AccentColor = "00bcd4", BackgroundColor = "002f3d", OutlineColor = "006370", FontFace = "Gotham" },
        },
        ["Peanut Butter"] = {
            54,
            { FontColor = "ffffff", MainColor = "e1a95f", AccentColor = "ffca80", BackgroundColor = "2b221a", OutlineColor = "7a6326", FontFace = "Gotham" },
        },
        ["Quartz"] = {
            55,
            { FontColor = "ffffff", MainColor = "232330", AccentColor = "426e87", BackgroundColor = "1d1b26", OutlineColor = "27232f", FontFace = "Gotham" },
        },
        ["Retro Wave"] = {
            56,
            { FontColor = "f0f8ff", MainColor = "2d033b", AccentColor = "ff77ff", BackgroundColor = "1a0126", OutlineColor = "5b114b", FontFace = "Gotham" },
        },
        ["Rose Quartz"] = {
            57,
            { FontColor = "ffffff", MainColor = "c48793", AccentColor = "f7cad0", BackgroundColor = "2f1b24", OutlineColor = "6f4b57", FontFace = "Gotham" },
        },
        ["Sandstone"] = {
            58,
            { FontColor = "2e1e1e", MainColor = "c2b280", AccentColor = "d7b889", BackgroundColor = "f5e6ca", OutlineColor = "a79876", FontFace = "Gotham" },
        },
        ["Slate Grey"] = {
            59,
            { FontColor = "ffffff", MainColor = "607d8b", AccentColor = "b0bec5", BackgroundColor = "263238", OutlineColor = "546e7a", FontFace = "Gotham" },
        },
        ["Solar Flare"] = {
            60,
            { FontColor = "ffffff", MainColor = "4e1609", AccentColor = "ff7043", BackgroundColor = "2b0702", OutlineColor = "6f1e07", FontFace = "Gotham" },
        },
        ["Solarized"] = {
            61,
            { FontColor = "839496", MainColor = "073642", AccentColor = "cb4b16", BackgroundColor = "002b36", OutlineColor = "586e75", FontFace = "Gotham" },
        },
        ["Steel Blue"] = {
            62,
            { FontColor = "f1f5f9", MainColor = "1f3a58", AccentColor = "607d8b", BackgroundColor = "152439", OutlineColor = "2c526d", FontFace = "Gotham" },
        },
        ["Stormy Night"] = {
            63,
            { FontColor = "e0e0e0", MainColor = "2f3e4e", AccentColor = "627d98", BackgroundColor = "1b232f", OutlineColor = "34455b", FontFace = "Gotham" },
        },
        ["Sunrise Glow"] = {
            64,
            { FontColor = "ffffff", MainColor = "ad6700", AccentColor = "ffeb99", BackgroundColor = "3d281e", OutlineColor = "8c5200", FontFace = "Gotham" },
        },
        ["Sunset Horizon"] = {
            65,
            { FontColor = "ffffff", MainColor = "9f4f48", AccentColor = "fbc687", BackgroundColor = "2a0f0f", OutlineColor = "7b3f39", FontFace = "Gotham" },
        },
        ["Tokyo Night"] = {
            66,
            { FontColor = "ffffff", MainColor = "191925", AccentColor = "6759b3", BackgroundColor = "16161f", OutlineColor = "323232", FontFace = "Gotham" },
        },
        ["Tropical Punch"] = {
            67,
            { FontColor = "ffffff", MainColor = "e96c98", AccentColor = "ffc200", BackgroundColor = "4d2b47", OutlineColor = "e83296", FontFace = "Gotham" },
        },
        ["Twilight"] = {
            68,
            { FontColor = "e0e6f8", MainColor = "121212", AccentColor = "9fa8da", BackgroundColor = "0a0a0a", OutlineColor = "333444", FontFace = "Gotham" },
        },
        ["Ubuntu"] = {
            69,
            { FontColor = "ffffff", MainColor = "3e3e3e", AccentColor = "e2581e", BackgroundColor = "323232", OutlineColor = "191919", FontFace = "Gotham" },
        },
        ["Vintage Paper"] = {
            70,
            { FontColor = "2f2f2f", MainColor = "d8cfc4", AccentColor = "b89c73", BackgroundColor = "f3e9d2", OutlineColor = "a68f7c", FontFace = "Gotham" },
        },
        ["Vodka Lime"] = {
            71,
            { FontColor = "70a634", MainColor = "6f8740", AccentColor = "396b07", BackgroundColor = "2a2a2a", OutlineColor = "4f4f4f", FontFace = "Gotham" },
        },
    }

    function ThemeManager:SetLibrary(library)
        self.Library = library
    end

    --// Folders \\--
    function ThemeManager:GetPaths()
        local paths = {}

        local parts = self.Folder:split("/")
        for idx = 1, #parts do
            paths[#paths + 1] = table.concat(parts, "/", 1, idx)
        end

        paths[#paths + 1] = self.Folder .. "/themes"

        return paths
    end

    function ThemeManager:BuildFolderTree()
        local paths = self:GetPaths()

        for i = 1, #paths do
            local str = paths[i]
            if isfolder(str) then
                continue
            end
            makefolder(str)
        end
    end

    function ThemeManager:CheckFolderTree()
        if isfolder(self.Folder) then
            return
        end
        self:BuildFolderTree()

        task.wait(0.1)
    end

    function ThemeManager:SetFolder(folder)
        self.Folder = folder
        self:BuildFolderTree()
    end

    --// Apply, Update theme \\--
    function ThemeManager:ApplyTheme(theme)
        local customThemeData = self:GetCustomTheme(theme)
        local data = customThemeData or self.BuiltInThemes[theme]

        if not data then
            return
        end

        local scheme = data[2]
        for idx, val in pairs(customThemeData or scheme) do
            if idx == "VideoLink" then
                continue
            elseif idx == "FontFace" then
                self.Library:SetFont(Enum.Font[val])

                if self.Library.Options[idx] then
                    self.Library.Options[idx]:SetValue(val)
                end
            else
                self.Library.Scheme[idx] = Color3.fromHex(val)

                if self.Library.Options[idx] then
                    self.Library.Options[idx]:SetValueRGB(Color3.fromHex(val))
                end
            end
        end

        self:ThemeUpdate()
    end

    function ThemeManager:ThemeUpdate()
        for i, field in ThemeFields do
            if self.Library.Options and self.Library.Options[field] then
                self.Library.Scheme[field] = self.Library.Options[field].Value
            end
        end

        self.Library:UpdateColorsUsingRegistry()
    end

    --// Get, Load, Save, Delete, Refresh \\--
    function ThemeManager:GetCustomTheme(file)
        local path = self.Folder .. "/themes/" .. file .. ".json"
        if not isfile(path) then
            return nil
        end

        local data = readfile(path)
        local success, decoded = pcall(HttpService.JSONDecode, HttpService, data)

        if not success then
            return nil
        end

        return decoded
    end

    function ThemeManager:LoadDefault()
        local theme = "Default"
        local content = isfile(self.Folder .. "/themes/default.txt") and readfile(self.Folder .. "/themes/default.txt")

        local isDefault = true
        if content then
            if self.BuiltInThemes[content] then
                theme = content
            elseif self:GetCustomTheme(content) then
                theme = content
                isDefault = false
            end
        elseif self.BuiltInThemes[self.DefaultTheme] then
            theme = self.DefaultTheme
        end

        if isDefault then
            self.Library.Options.ThemeManager_ThemeList:SetValue(theme)
        else
            self:ApplyTheme(theme)
        end
    end

    function ThemeManager:SaveDefault(theme)
        writefile(self.Folder .. "/themes/default.txt", theme)
    end

    function ThemeManager:SetDefaultTheme(theme)
        assert(self.Library, "Must set ThemeManager.Library first!")
        assert(not self.AppliedToTab, "Cannot set default theme after applying ThemeManager to a tab!")

        local FinalTheme = {}
        local LibraryScheme = {}
        for _, field in ThemeFields do
            if typeof(theme[field]) == "Color3" then
                FinalTheme[field] = "#" .. theme[field]:ToHex()
                LibraryScheme[field] = theme[field]

            elseif typeof(theme[field]) == "string" then
                FinalTheme[field] = if theme[field]:sub(1, 1) == "#" then theme[field] else ("#" .. theme[field])
                LibraryScheme[field] = Color3.fromHex(theme[field])

            else
                FinalTheme[field] = ThemeManager.BuiltInThemes["Default"][2][field]
                LibraryScheme[field] = Color3.fromHex(ThemeManager.BuiltInThemes["Default"][2][field])
            end
        end

        if typeof(theme["FontFace"]) == "EnumItem" then
            FinalTheme["FontFace"] = theme["FontFace"].Name
            LibraryScheme["Font"] = Font.fromEnum(theme["FontFace"])

        elseif typeof(theme["FontFace"]) == "string" then
            FinalTheme["FontFace"] = theme["FontFace"]
            LibraryScheme["Font"] = Font.fromEnum(Enum.Font[theme["FontFace"]])

        else
            FinalTheme["FontFace"] = "Code"
            LibraryScheme["Font"] = Font.fromEnum(Enum.Font.Code)
        end

        for _, field in { "RedColor", "DarkColor", "WhiteColor" } do
            LibraryScheme[field] = self.Library.Scheme[field]
        end

        self.Library.Scheme = LibraryScheme
        self.BuiltInThemes["Default"] = { 1, FinalTheme }

        self.Library:UpdateColorsUsingRegistry()
    end

    function ThemeManager:SaveCustomTheme(file)
        if file:gsub(" ", "") == "" then
            self.Library:Notify("Invalid file name for theme (empty)", 3)
            return
        end

        local theme = {}
        for _, field in ThemeFields do
            theme[field] = self.Library.Options[field].Value:ToHex()
        end
        theme["FontFace"] = self.Library.Options["FontFace"].Value

        writefile(self.Folder .. "/themes/" .. file .. ".json", HttpService:JSONEncode(theme))
    end

    function ThemeManager:Delete(name)
        if not name then
            return false, "no config file is selected"
        end

        local file = self.Folder .. "/themes/" .. name .. ".json"
        if not isfile(file) then
            return false, "invalid file"
        end

        local success = pcall(delfile, file)
        if not success then
            return false, "delete file error"
        end

        return true
    end

    function ThemeManager:ReloadCustomThemes()
        local list = listfiles(self.Folder .. "/themes")

        local out = {}
        for i = 1, #list do
            local file = list[i]
            if file:sub(-5) == ".json" then
                -- i hate this but it has to be done ...

                local pos = file:find(".json", 1, true)
                local start = pos

                local char = file:sub(pos, pos)
                while char ~= "/" and char ~= "\\" and char ~= "" do
                    pos = pos - 1
                    char = file:sub(pos, pos)
                end

                if char == "/" or char == "\\" then
                    table.insert(out, file:sub(pos + 1, start - 1))
                end
            end
        end

        return out
    end

    --// GUI \\--
    function ThemeManager:CreateThemeManager(groupbox)
        groupbox
            :AddLabel("Background color")
            :AddColorPicker("BackgroundColor", { Default = self.Library.Scheme.BackgroundColor })
        groupbox:AddLabel("Main color"):AddColorPicker("MainColor", { Default = self.Library.Scheme.MainColor })
        groupbox:AddLabel("Accent color"):AddColorPicker("AccentColor", { Default = self.Library.Scheme.AccentColor })
        groupbox
            :AddLabel("Outline color")
            :AddColorPicker("OutlineColor", { Default = self.Library.Scheme.OutlineColor })
        groupbox:AddLabel("Font color"):AddColorPicker("FontColor", { Default = self.Library.Scheme.FontColor })
        groupbox:AddDropdown("FontFace", {
            Text = "Font Face",
            Default = "Code",
            Values = { "BuilderSans", "Code", "Fantasy", "Gotham", "Jura", "Roboto", "RobotoMono", "SourceSans" },
        })

        local ThemesArray = {}
        for Name, Theme in pairs(self.BuiltInThemes) do
            table.insert(ThemesArray, Name)
        end

        table.sort(ThemesArray, function(a, b)
            return self.BuiltInThemes[a][1] < self.BuiltInThemes[b][1]
        end)

        groupbox:AddDivider()

        groupbox:AddDropdown("ThemeManager_ThemeList", { Text = "Theme list", Values = ThemesArray, Default = 1 })
        groupbox:AddButton("Set as default", function()
            self:SaveDefault(self.Library.Options.ThemeManager_ThemeList.Value)
            self.Library:Notify(
                string.format("Set default theme to %q", self.Library.Options.ThemeManager_ThemeList.Value)
            )
        end)

        self.Library.Options.ThemeManager_ThemeList:OnChanged(function()
            self:ApplyTheme(self.Library.Options.ThemeManager_ThemeList.Value)
        end)

        groupbox:AddDivider()

        groupbox:AddInput("ThemeManager_CustomThemeName", { Text = "Custom theme name" })
        groupbox:AddButton("Create theme", function()
            local name = self.Library.Options.ThemeManager_CustomThemeName.Value

            if name:gsub(" ", "") == "" then
                self.Library:Notify("Invalid theme name (empty)", 2)
                return
            end

            self:SaveCustomTheme(name)

            self.Library:Notify(string.format("Created theme %q", name))
            self.Library.Options.ThemeManager_CustomThemeList:SetValues(self:ReloadCustomThemes())
            self.Library.Options.ThemeManager_CustomThemeList:SetValue(nil)
        end)

        groupbox:AddDivider()

        groupbox:AddDropdown(
            "ThemeManager_CustomThemeList",
            { Text = "Custom themes", Values = self:ReloadCustomThemes(), AllowNull = true, Default = 1 }
        )
        groupbox:AddButton("Load theme", function()
            local name = self.Library.Options.ThemeManager_CustomThemeList.Value

            self:ApplyTheme(name)
            self.Library:Notify(string.format("Loaded theme %q", name))
        end)
        groupbox:AddButton("Overwrite theme", function()
            local name = self.Library.Options.ThemeManager_CustomThemeList.Value

            self:SaveCustomTheme(name)
            self.Library:Notify(string.format("Overwrote config %q", name))
        end)
        groupbox:AddButton("Delete theme", function()
            local name = self.Library.Options.ThemeManager_CustomThemeList.Value

            local success, err = self:Delete(name)
            if not success then
                self.Library:Notify("Failed to delete theme: " .. err)
                return
            end

            self.Library:Notify(string.format("Deleted theme %q", name))
            self.Library.Options.ThemeManager_CustomThemeList:SetValues(self:ReloadCustomThemes())
            self.Library.Options.ThemeManager_CustomThemeList:SetValue(nil)
        end)
        groupbox:AddButton("Refresh list", function()
            self.Library.Options.ThemeManager_CustomThemeList:SetValues(self:ReloadCustomThemes())
            self.Library.Options.ThemeManager_CustomThemeList:SetValue(nil)
        end)
        groupbox:AddButton("Set as default", function()
            if
                self.Library.Options.ThemeManager_CustomThemeList.Value ~= nil
                and self.Library.Options.ThemeManager_CustomThemeList.Value ~= ""
            then
                self:SaveDefault(self.Library.Options.ThemeManager_CustomThemeList.Value)
                self.Library:Notify(
                    string.format("Set default theme to %q", self.Library.Options.ThemeManager_CustomThemeList.Value)
                )
            end
        end)
        groupbox:AddButton("Reset default", function()
            local success = pcall(delfile, self.Folder .. "/themes/default.txt")
            if not success then
                self.Library:Notify("Failed to reset default: delete file error")
                return
            end

            self.Library:Notify("Set default theme to nothing")
            self.Library.Options.ThemeManager_CustomThemeList:SetValues(self:ReloadCustomThemes())
            self.Library.Options.ThemeManager_CustomThemeList:SetValue(nil)
        end)

        self:LoadDefault()
        self.AppliedToTab = true

        local function UpdateTheme()
            self:ThemeUpdate()
        end

        self.Library.Options.BackgroundColor:OnChanged(UpdateTheme)
        self.Library.Options.MainColor:OnChanged(UpdateTheme)
        self.Library.Options.AccentColor:OnChanged(UpdateTheme)
        self.Library.Options.OutlineColor:OnChanged(UpdateTheme)
        self.Library.Options.FontColor:OnChanged(UpdateTheme)
        self.Library.Options.FontFace:OnChanged(function(Value)
            self.Library:SetFont(Enum.Font[Value])
            self.Library:UpdateColorsUsingRegistry()
        end)
    end

    function ThemeManager:CreateGroupBox(tab)
        assert(self.Library, "Must set ThemeManager.Library first!")
        return tab:AddLeftGroupbox("Themes", "paintbrush")
    end

    function ThemeManager:ApplyToTab(tab)
        assert(self.Library, "Must set ThemeManager.Library first!")
        local groupbox = self:CreateGroupBox(tab)
        self:CreateThemeManager(groupbox)
    end

    function ThemeManager:ApplyToGroupbox(groupbox)
        assert(self.Library, "Must set ThemeManager.Library first!")
        self:CreateThemeManager(groupbox)
    end

    ThemeManager:BuildFolderTree()
end

getgenv().ObsidianThemeManager = ThemeManager
return ThemeManager
