local v0 = game:GetService("Players")
local v1 = game:GetService("RunService")
local v2 = game:GetService("UserInputService")
local v3 = game:GetService("TweenService")
local v4 = game:GetService("HttpService")
local v5 = game:GetService("SoundService")
local v6 = game:GetService("ContentProvider")
local v7 = game:GetService("TextService")
local v8 = game:GetService("CoreGui")

local v9 = v0.LocalPlayer
local v10 = v9 and v9:GetMouse() or nil

local function v11()
    if gethui then
        return gethui()
    end
    local v12, v13 = pcall(function() return v8 end)
    if v12 and v13 then return v13 end
    return v9 and v9:FindFirstChildOfClass("PlayerGui") or game:GetService("StarterGui")
end

local v14 = "SkidX"

local function v15(v16)
    if not isfolder then return end
    pcall(function()
        if not isfolder(v16) then
            makefolder(v16)
        end
    end)
end

v15(v14)
v15(v14 .. "/Data")
v15(v14 .. "/Images")
v15(v14 .. "/Sounds")
v15(v14 .. "/VideoFrames")

local function v17(v16)
    if not isfile or not readfile then return nil end
    local v12, v13 = pcall(function()
        if isfile(v16) then
            return readfile(v16)
        end
        return nil
    end)
    return v12 and v13 or nil
end

local function v18(v16, v19)
    if not writefile then return false end
    local v12 = pcall(function()
        writefile(v16, v19)
    end)
    return v12
end

local function v20(v16)
    if not getcustomasset then return "" end
    local v12, v13 = pcall(function()
        return getcustomasset(v16)
    end)
    return v12 and v13 or ""
end

local v21 = {}
do
    local v22 = v14 .. "/Data/lucide_icons.json"
    local v23 = v17(v22)
    if v23 then
        local v12, v24 = pcall(function()
            return v4:JSONDecode(v23)
        end)
        if v12 and type(v24) == "table" then
            v21 = v24.icons or v24
        end
    end

    if not next(v21) then
        local v25 = {
            "https://raw.githubusercontent.com/frappedevs/lucideblox/master/src/modules/util/icons.json",
            "https://raw.githubusercontent.com/7kayoh/lucideblox/master/src/modules/util/icons.json"
        }
        for v26, v27 in ipairs(v25) do
            local v12, v28 = pcall(function()
                return game:HttpGet(v27)
            end)
            if v12 and v28 and #v28 > 0 then
                local v29, v24 = pcall(function()
                    return v4:JSONDecode(v28)
                end)
                if v29 and type(v24) == "table" then
                    v21 = v24.icons or v24
                    v18(v22, v28)
                    break
                end
            end
        end
    end

    _G.LucideIcons = v21
    shared.LucideIcons = v21
end

local function v30(v31)
    if v21 and v21[v31] then
        local v32 = v21[v31]
        if type(v32) == "string" then
            return v32
        elseif type(v32) == "table" and v32.assetId then
            return v32.assetId
        end
    end
    return "rbxassetid://7072706796"
end

local v33 = ""
local v34 = ""
local v35 = ""
local v36 = ""

task.spawn(function()
    local v37 = v14 .. "/Images/SkidXLogo_Top.png"
    if not (isfile and isfile(v37)) then
        pcall(function()
            v18(v37, game:HttpGet("https://files.catbox.moe/yed08k.png"))
        end)
    end
    v33 = v20(v37)

    local v38 = v14 .. "/Images/SkidXLogo_Bottom.png"
    if not (isfile and isfile(v38)) then
        pcall(function()
            v18(v38, game:HttpGet("https://files.catbox.moe/yed08k.png"))
        end)
    end
    v34 = v20(v38)

    local v39 = v14 .. "/Images/SkidXDiscord_Whitescale.png"
    if not (isfile and isfile(v39)) then
        pcall(function()
            v18(v39, game:HttpGet("https://files.catbox.moe/yed08k.png"))
        end)
    end
    v35 = v20(v39)

    local v40 = v14 .. "/Images/SkidXBlush.png"
    if not (isfile and isfile(v40)) then
        pcall(function()
            v18(v40, game:HttpGet("https://raw.githubusercontent.com/chromex1/chromex/main/ahem.png"))
        end)
    end
    v36 = v20(v40)

    local v41 = v14 .. "/Sounds/SkidXStartup.mp3"
    if not (isfile and isfile(v41)) then
        pcall(function()
            v18(v41, game:HttpGet("https://raw.githubusercontent.com/chromex1/chromex/main/startup.mp3"))
        end)
    end
end)

local v42 = Instance.new("Folder")
v42.Name = "SkidXSounds"
v42.Parent = v5

local v43 = Instance.new("Sound", v42)
v43.Name = "Click"
v43.SoundId = "rbxassetid://6038081405"
v43.Volume = 0.4

local v44 = Instance.new("Sound", v42)
v44.Name = "Toggle"
v44.SoundId = "rbxassetid://6895086266"
v44.Volume = 0.5

local v45 = Instance.new("Sound", v42)
v45.Name = "TabSwitch"
v45.SoundId = "rbxassetid://6895079853"
v45.Volume = 0.5

local v46 = Instance.new("Sound", v42)
v46.Name = "Startup"
v46.SoundId = "rbxassetid://9114223177"
v46.Volume = 0.7

local function v47(v48)
    pcall(function()
        if v48 and v48.Play then
            v48:Play()
        end
    end)
end

local v49 = {
    ["Default"] = {
        Background = Color3.fromRGB(15, 13, 20),
        Secondary = Color3.fromRGB(22, 19, 28),
        Tertiary = Color3.fromRGB(30, 26, 38),
        Accent = Color3.fromRGB(153, 0, 255),
        AccentHover = Color3.fromRGB(178, 51, 255),
        Stroke = Color3.fromRGB(50, 42, 62),
        Text = Color3.fromRGB(235, 232, 240),
        SubText = Color3.fromRGB(148, 142, 165),
        Danger = Color3.fromRGB(235, 87, 87),
    },
    ["Midnight"] = {
        Background = Color3.fromRGB(13, 15, 25),
        Secondary = Color3.fromRGB(19, 22, 35),
        Tertiary = Color3.fromRGB(26, 30, 45),
        Accent = Color3.fromRGB(0, 120, 255),
        AccentHover = Color3.fromRGB(51, 160, 255),
        Stroke = Color3.fromRGB(42, 50, 72),
        Text = Color3.fromRGB(235, 238, 245),
        SubText = Color3.fromRGB(142, 150, 175),
        Danger = Color3.fromRGB(255, 87, 87),
    },
    ["Crimson"] = {
        Background = Color3.fromRGB(25, 13, 15),
        Secondary = Color3.fromRGB(35, 19, 22),
        Tertiary = Color3.fromRGB(45, 26, 30),
        Accent = Color3.fromRGB(255, 0, 50),
        AccentHover = Color3.fromRGB(255, 51, 90),
        Stroke = Color3.fromRGB(72, 42, 47),
        Text = Color3.fromRGB(245, 235, 237),
        SubText = Color3.fromRGB(175, 142, 145),
        Danger = Color3.fromRGB(255, 50, 50),
    },
    ["Toxic"] = {
        Background = Color3.fromRGB(13, 20, 13),
        Secondary = Color3.fromRGB(19, 28, 19),
        Tertiary = Color3.fromRGB(26, 38, 26),
        Accent = Color3.fromRGB(0, 255, 100),
        AccentHover = Color3.fromRGB(51, 255, 140),
        Stroke = Color3.fromRGB(42, 62, 42),
        Text = Color3.fromRGB(235, 245, 235),
        SubText = Color3.fromRGB(142, 165, 142),
        Danger = Color3.fromRGB(235, 87, 87),
    },
    ["Sunset"] = {
        Background = Color3.fromRGB(20, 13, 15),
        Secondary = Color3.fromRGB(28, 19, 22),
        Tertiary = Color3.fromRGB(38, 26, 30),
        Accent = Color3.fromRGB(255, 100, 0),
        AccentHover = Color3.fromRGB(255, 140, 40),
        Stroke = Color3.fromRGB(62, 42, 47),
        Text = Color3.fromRGB(245, 235, 237),
        SubText = Color3.fromRGB(175, 142, 145),
        Danger = Color3.fromRGB(235, 87, 87),
    },
    ["Blossom"] = {
        Background = Color3.fromRGB(20, 13, 20),
        Secondary = Color3.fromRGB(28, 19, 28),
        Tertiary = Color3.fromRGB(38, 26, 38),
        Accent = Color3.fromRGB(255, 0, 128),
        AccentHover = Color3.fromRGB(255, 51, 170),
        Stroke = Color3.fromRGB(62, 42, 62),
        Text = Color3.fromRGB(245, 235, 245),
        SubText = Color3.fromRGB(175, 142, 175),
        Danger = Color3.fromRGB(235, 87, 87),
    },
    ["Carbon"] = {
        Background = Color3.fromRGB(15, 15, 15),
        Secondary = Color3.fromRGB(22, 22, 22),
        Tertiary = Color3.fromRGB(30, 30, 30),
        Accent = Color3.fromRGB(235, 235, 235),
        AccentHover = Color3.fromRGB(255, 255, 255),
        Stroke = Color3.fromRGB(50, 50, 50),
        Text = Color3.fromRGB(235, 235, 235),
        SubText = Color3.fromRGB(148, 148, 148),
        Danger = Color3.fromRGB(235, 87, 87),
    },
    ["Matrix"] = {
        Background = Color3.fromRGB(5, 10, 5),
        Secondary = Color3.fromRGB(10, 18, 10),
        Tertiary = Color3.fromRGB(15, 25, 15),
        Accent = Color3.fromRGB(0, 255, 0),
        AccentHover = Color3.fromRGB(50, 255, 50),
        Stroke = Color3.fromRGB(0, 50, 0),
        Text = Color3.fromRGB(200, 255, 200),
        SubText = Color3.fromRGB(100, 150, 100),
        Danger = Color3.fromRGB(235, 87, 87),
    },
    ["Coral"] = {
        Background = Color3.fromRGB(25, 15, 20),
        Secondary = Color3.fromRGB(35, 22, 28),
        Tertiary = Color3.fromRGB(45, 30, 35),
        Accent = Color3.fromRGB(255, 127, 80),
        AccentHover = Color3.fromRGB(255, 160, 110),
        Stroke = Color3.fromRGB(70, 45, 55),
        Text = Color3.fromRGB(255, 240, 235),
        SubText = Color3.fromRGB(180, 145, 140),
        Danger = Color3.fromRGB(235, 87, 87),
    },
    ["RGB"] = {
        Background = Color3.fromRGB(15, 15, 15),
        Secondary = Color3.fromRGB(22, 22, 22),
        Tertiary = Color3.fromRGB(30, 30, 30),
        Accent = Color3.fromRGB(0, 255, 255),
        AccentHover = Color3.fromRGB(50, 255, 255),
        Stroke = Color3.fromRGB(50, 50, 50),
        Text = Color3.fromRGB(235, 235, 235),
        SubText = Color3.fromRGB(148, 148, 148),
        Danger = Color3.fromRGB(235, 87, 87),
    },
    ["Galaxy"] = {
        Background = Color3.fromRGB(10, 5, 25),
        Secondary = Color3.fromRGB(15, 10, 30),
        Tertiary = Color3.fromRGB(25, 15, 45),
        Accent = Color3.fromRGB(150, 50, 255),
        AccentHover = Color3.fromRGB(180, 100, 255),
        Stroke = Color3.fromRGB(50, 30, 80),
        Text = Color3.fromRGB(230, 220, 255),
        SubText = Color3.fromRGB(160, 140, 200),
        Danger = Color3.fromRGB(235, 87, 87),
        AccentColors = { Color3.fromRGB(150, 50, 255), Color3.fromRGB(50, 100, 255), Color3.fromRGB(255, 50, 150) }
    },
    ["Aurora"] = {
        Background = Color3.fromRGB(5, 15, 20),
        Secondary = Color3.fromRGB(10, 22, 28),
        Tertiary = Color3.fromRGB(15, 30, 38),
        Accent = Color3.fromRGB(0, 200, 255),
        AccentHover = Color3.fromRGB(50, 220, 255),
        Stroke = Color3.fromRGB(30, 50, 60),
        Text = Color3.fromRGB(230, 245, 250),
        SubText = Color3.fromRGB(140, 165, 175),
        Danger = Color3.fromRGB(235, 87, 87),
        AccentColors = { Color3.fromRGB(0, 200, 255), Color3.fromRGB(50, 255, 150), Color3.fromRGB(0, 255, 200) }
    },
    ["Lava"] = {
        Background = Color3.fromRGB(25, 10, 5),
        Secondary = Color3.fromRGB(35, 15, 10),
        Tertiary = Color3.fromRGB(45, 20, 15),
        Accent = Color3.fromRGB(255, 50, 0),
        AccentHover = Color3.fromRGB(255, 100, 50),
        Stroke = Color3.fromRGB(72, 42, 37),
        Text = Color3.fromRGB(255, 235, 230),
        SubText = Color3.fromRGB(175, 142, 135),
        Danger = Color3.fromRGB(255, 50, 50),
        AccentColors = { Color3.fromRGB(255, 50, 0), Color3.fromRGB(255, 120, 0), Color3.fromRGB(255, 200, 0) }
    },
    ["Bubblegum"] = {
        Background = Color3.fromRGB(25, 10, 25),
        Secondary = Color3.fromRGB(35, 15, 35),
        Tertiary = Color3.fromRGB(45, 20, 45),
        Accent = Color3.fromRGB(255, 50, 150),
        AccentHover = Color3.fromRGB(255, 100, 180),
        Stroke = Color3.fromRGB(72, 42, 72),
        Text = Color3.fromRGB(255, 235, 250),
        SubText = Color3.fromRGB(175, 142, 175),
        Danger = Color3.fromRGB(235, 87, 87),
        AccentColors = { Color3.fromRGB(255, 50, 150), Color3.fromRGB(200, 100, 255), Color3.fromRGB(100, 150, 255) }
    },
    ["Acid"] = {
        Background = Color3.fromRGB(10, 20, 10),
        Secondary = Color3.fromRGB(15, 28, 15),
        Tertiary = Color3.fromRGB(20, 38, 20),
        Accent = Color3.fromRGB(150, 255, 0),
        AccentHover = Color3.fromRGB(180, 255, 50),
        Stroke = Color3.fromRGB(42, 62, 42),
        Text = Color3.fromRGB(235, 255, 235),
        SubText = Color3.fromRGB(142, 175, 142),
        Danger = Color3.fromRGB(235, 87, 87),
        AccentColors = { Color3.fromRGB(150, 255, 0), Color3.fromRGB(0, 255, 100), Color3.fromRGB(200, 255, 0) }
    },
    ["Prism"] = {
        Background = Color3.fromRGB(12, 12, 16),
        Secondary = Color3.fromRGB(18, 18, 24),
        Tertiary = Color3.fromRGB(26, 26, 34),
        Accent = Color3.fromRGB(255, 0, 0),
        AccentHover = Color3.fromRGB(255, 110, 110),
        Stroke = Color3.fromRGB(50, 48, 62),
        Text = Color3.fromRGB(238, 235, 245),
        SubText = Color3.fromRGB(150, 145, 165),
        Danger = Color3.fromRGB(235, 87, 87),
        AccentColors = { Color3.fromRGB(255, 0, 0), Color3.fromRGB(0, 255, 0), Color3.fromRGB(0, 0, 255) }
    },
    ["Vaporwave"] = {
        Background = Color3.fromRGB(18, 10, 24),
        Secondary = Color3.fromRGB(26, 15, 34),
        Tertiary = Color3.fromRGB(36, 20, 46),
        Accent = Color3.fromRGB(255, 90, 200),
        AccentHover = Color3.fromRGB(255, 130, 220),
        Stroke = Color3.fromRGB(62, 42, 75),
        Text = Color3.fromRGB(245, 235, 250),
        SubText = Color3.fromRGB(175, 150, 190),
        Danger = Color3.fromRGB(255, 87, 120),
        AccentColors = { Color3.fromRGB(255, 90, 200), Color3.fromRGB(0, 220, 255) }
    },
    ["Citrus"] = {
        Background = Color3.fromRGB(22, 18, 12),
        Secondary = Color3.fromRGB(30, 24, 16),
        Tertiary = Color3.fromRGB(40, 32, 22),
        Accent = Color3.fromRGB(255, 180, 0),
        AccentHover = Color3.fromRGB(255, 210, 50),
        Stroke = Color3.fromRGB(65, 52, 35),
        Text = Color3.fromRGB(250, 245, 235),
        SubText = Color3.fromRGB(180, 170, 150),
        Danger = Color3.fromRGB(235, 87, 87),
    },
    ["Frost"] = {
        Background = Color3.fromRGB(10, 16, 24),
        Secondary = Color3.fromRGB(15, 24, 34),
        Tertiary = Color3.fromRGB(22, 32, 45),
        Accent = Color3.fromRGB(100, 200, 255),
        AccentHover = Color3.fromRGB(140, 220, 255),
        Stroke = Color3.fromRGB(40, 60, 80),
        Text = Color3.fromRGB(235, 245, 255),
        SubText = Color3.fromRGB(150, 175, 200),
        Danger = Color3.fromRGB(235, 87, 87),
    },
    ["Mint"] = {
        Background = Color3.fromRGB(10, 20, 18),
        Secondary = Color3.fromRGB(15, 28, 25),
        Tertiary = Color3.fromRGB(22, 38, 34),
        Accent = Color3.fromRGB(50, 230, 180),
        AccentHover = Color3.fromRGB(90, 245, 200),
        Stroke = Color3.fromRGB(40, 65, 60),
        Text = Color3.fromRGB(235, 250, 245),
        SubText = Color3.fromRGB(150, 180, 170),
        Danger = Color3.fromRGB(235, 87, 87),
    },
    ["Spectrum"] = {
        Background = Color3.fromRGB(14, 14, 18),
        Secondary = Color3.fromRGB(20, 20, 26),
        Tertiary = Color3.fromRGB(28, 28, 36),
        Accent = Color3.fromRGB(255, 60, 120),
        AccentHover = Color3.fromRGB(255, 100, 150),
        Stroke = Color3.fromRGB(55, 50, 70),
        Text = Color3.fromRGB(240, 238, 245),
        SubText = Color3.fromRGB(160, 155, 175),
        Danger = Color3.fromRGB(235, 87, 87),
        AccentColors = { Color3.fromRGB(255, 60, 120), Color3.fromRGB(255, 180, 40), Color3.fromRGB(40, 220, 180), Color3.fromRGB(120, 80, 255) }
    },
    ["Ember"] = {
        Background = Color3.fromRGB(22, 12, 10),
        Secondary = Color3.fromRGB(32, 18, 14),
        Tertiary = Color3.fromRGB(42, 24, 20),
        Accent = Color3.fromRGB(255, 80, 20),
        AccentHover = Color3.fromRGB(255, 120, 50),
        Stroke = Color3.fromRGB(70, 40, 35),
        Text = Color3.fromRGB(250, 235, 230),
        SubText = Color3.fromRGB(180, 150, 140),
        Danger = Color3.fromRGB(235, 87, 87),
    },
    ["Ocean"] = {
        Background = Color3.fromRGB(8, 15, 22),
        Secondary = Color3.fromRGB(12, 22, 32),
        Tertiary = Color3.fromRGB(18, 30, 42),
        Accent = Color3.fromRGB(20, 140, 230),
        AccentHover = Color3.fromRGB(50, 170, 255),
        Stroke = Color3.fromRGB(35, 55, 75),
        Text = Color3.fromRGB(230, 240, 250),
        SubText = Color3.fromRGB(140, 165, 190),
        Danger = Color3.fromRGB(235, 87, 87),
    },
    ["Neon"] = {
        Background = Color3.fromRGB(10, 10, 14),
        Secondary = Color3.fromRGB(16, 16, 22),
        Tertiary = Color3.fromRGB(24, 24, 32),
        Accent = Color3.fromRGB(0, 255, 200),
        AccentHover = Color3.fromRGB(50, 255, 220),
        Stroke = Color3.fromRGB(40, 50, 60),
        Text = Color3.fromRGB(235, 245, 245),
        SubText = Color3.fromRGB(140, 165, 165),
        Danger = Color3.fromRGB(235, 87, 87),
    },
    ["Cyber"] = {
        Background = Color3.fromRGB(12, 10, 18),
        Secondary = Color3.fromRGB(18, 15, 26),
        Tertiary = Color3.fromRGB(26, 22, 36),
        Accent = Color3.fromRGB(255, 230, 0),
        AccentHover = Color3.fromRGB(255, 245, 60),
        Stroke = Color3.fromRGB(60, 50, 75),
        Text = Color3.fromRGB(250, 245, 235),
        SubText = Color3.fromRGB(175, 165, 150),
        Danger = Color3.fromRGB(235, 87, 87),
    },
    ["Synthwave"] = {
        Background = Color3.fromRGB(20, 10, 25),
        Secondary = Color3.fromRGB(28, 15, 36),
        Tertiary = Color3.fromRGB(38, 22, 48),
        Accent = Color3.fromRGB(255, 40, 140),
        AccentHover = Color3.fromRGB(255, 80, 170),
        Stroke = Color3.fromRGB(70, 40, 85),
        Text = Color3.fromRGB(250, 235, 250),
        SubText = Color3.fromRGB(180, 150, 185),
        Danger = Color3.fromRGB(235, 87, 87),
    },
    ["Nebula"] = {
        Background = Color3.fromRGB(12, 8, 22),
        Secondary = Color3.fromRGB(18, 12, 32),
        Tertiary = Color3.fromRGB(26, 18, 44),
        Accent = Color3.fromRGB(180, 60, 255),
        AccentHover = Color3.fromRGB(210, 100, 255),
        Stroke = Color3.fromRGB(55, 35, 80),
        Text = Color3.fromRGB(240, 230, 255),
        SubText = Color3.fromRGB(165, 145, 195),
        Danger = Color3.fromRGB(235, 87, 87),
    },
    ["Lemon"] = {
        Background = Color3.fromRGB(20, 20, 12),
        Secondary = Color3.fromRGB(28, 28, 16),
        Tertiary = Color3.fromRGB(38, 38, 22),
        Accent = Color3.fromRGB(255, 230, 0),
        AccentHover = Color3.fromRGB(255, 245, 50),
        Stroke = Color3.fromRGB(65, 65, 35),
        Text = Color3.fromRGB(250, 250, 235),
        SubText = Color3.fromRGB(180, 180, 150),
        Danger = Color3.fromRGB(235, 87, 87),
    },
    ["Candy"] = {
        Background = Color3.fromRGB(24, 12, 20),
        Secondary = Color3.fromRGB(34, 18, 28),
        Tertiary = Color3.fromRGB(44, 25, 38),
        Accent = Color3.fromRGB(255, 105, 180),
        AccentHover = Color3.fromRGB(255, 140, 205),
        Stroke = Color3.fromRGB(75, 45, 68),
        Text = Color3.fromRGB(255, 240, 248),
        SubText = Color3.fromRGB(185, 155, 175),
        Danger = Color3.fromRGB(235, 87, 87),
    },
    ["Sunset Drive"] = {
        Background = Color3.fromRGB(22, 10, 16),
        Secondary = Color3.fromRGB(32, 15, 24),
        Tertiary = Color3.fromRGB(44, 22, 34),
        Accent = Color3.fromRGB(255, 85, 85),
        AccentHover = Color3.fromRGB(255, 125, 125),
        Stroke = Color3.fromRGB(75, 42, 58),
        Text = Color3.fromRGB(250, 238, 242),
        SubText = Color3.fromRGB(180, 148, 160),
        Danger = Color3.fromRGB(235, 87, 87),
    },
}

local v50 = "Default"
local v51 = {}

local v52 = {}

function v52.Track(v53, v54, v55)
    if not v51[v53] then
        v51[v53] = {}
    end
    table.insert(v51[v53], {
        Prop = v54,
        Getter = v55
    })
    local v56 = v55()
    if v56 ~= nil then
        v53[v54] = v56
    end
end

function v52.ApplyTheme(v31)
    if not v49[v31] then return end
    v50 = v31
    for v57, v58 in pairs(v51) do
        if v57 and v57.Parent then
            for v26, v59 in ipairs(v58) do
                local v56 = v59.Getter()
                if v56 ~= nil then
                    v57[v59.Prop] = v56
                end
            end
        else
            v51[v57] = nil
        end
    end
end

local v60 = 0
v1.RenderStepped:Connect(function(v61)
    v60 = (v60 + v61 * 0.5) % 1
    local v62 = v49[v50]
    if v62 and v62.AccentColors then
        local v63 = #v62.AccentColors
        local v64 = math.floor(v60 * v63) + 1
        local v65 = (v64 % v63) + 1
        local v66 = (v60 * v63) % 1
        local v67 = v62.AccentColors[v64]
        local v68 = v62.AccentColors[v65]
        if v67 and v68 then
            v62.Accent = v67:Lerp(v68, v66)
            for v57, v58 in pairs(v51) do
                if v57 and v57.Parent then
                    for v26, v59 in ipairs(v58) do
                        if v59.Prop == "TextColor3" or v59.Prop == "BackgroundColor3" or v59.Prop == "ImageColor3" or v59.Prop == "Color" then
                            local v56 = v59.Getter()
                            if v56 ~= nil then
                                v57[v59.Prop] = v56
                            end
                        end
                    end
                end
            end
        end
    end
end)

local v69 = nil
local v70 = nil

local function v71()
    if not v69 then
        local v72 = v11()
        v69 = Instance.new("ScreenGui")
        v69.Name = "SkidXTooltips"
        v69.ResetOnSpawn = false
        v69.DisplayOrder = 100
        v69.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        v69.Parent = v72

        local v73 = Instance.new("Frame", v69)
        v73.Name = "Bubble"
        v73.Size = UDim2.new(0, 100, 0, 24)
        v73.BackgroundColor3 = v49[v50].Secondary
        v73.BorderSizePixel = 0
        v73.Visible = false
        v52.Track(v73, "BackgroundColor3", function() return v49[v50].Secondary end)

        local v74 = Instance.new("UICorner", v73)
        v74.CornerRadius = UDim.new(0, 6)

        local v75 = Instance.new("UIStroke", v73)
        v75.Thickness = 1
        v75.Transparency = 0.5
        v75.Color = v49[v50].Stroke
        v52.Track(v75, "Color", function() return v49[v50].Stroke end)

        local v76 = Instance.new("TextLabel", v73)
        v76.Name = "Text"
        v76.Size = UDim2.new(1, -12, 1, 0)
        v76.Position = UDim2.new(0, 6, 0, 0)
        v76.BackgroundTransparency = 1
        v76.Font = Enum.Font.Gotham
        v76.TextColor3 = v49[v50].Text
        v76.TextSize = 11
        v52.Track(v76, "TextColor3", function() return v49[v50].Text end)

        v70 = v73
    end
end

local function v77(v78, v79)
    v71()
    v78.MouseEnter:Connect(function()
        if not v70 then return end
        local v80 = type(v79) == "function" and v79() or v79
        v70.Text.Text = tostring(v80)
        local v81 = v7:GetTextSize(tostring(v80), 11, Enum.Font.Gotham, Vector2.new(300, 100))
        v70.Size = UDim2.new(0, v81.X + 16, 0, 22)
        v70.Visible = true
    end)
    v78.MouseLeave:Connect(function()
        if v70 then
            v70.Visible = false
        end
    end)
end

v2.InputChanged:Connect(function(v82)
    if v70 and v70.Visible and v82.UserInputType == Enum.UserInputType.MouseMovement then
        v70.Position = UDim2.new(0, v82.Position.X + 12, 0, v82.Position.Y + 12)
    end
end)

local v83 = {}
v83.__index = v83

function v83.Notify(v84)
    v84 = v84 or {}
    local v85 = v84.Title or "Notification"
    local v86 = v84.Description or v84.Content or ""
    local v87 = v84.Duration or 3
    local v88 = v84.Image

    local v72 = v11()
    local v89 = v72:FindFirstChild("SkidXNotifications")
    if not v89 then
        v89 = Instance.new("ScreenGui")
        v89.Name = "SkidXNotifications"
        v89.ResetOnSpawn = false
        v89.DisplayOrder = 20
        v89.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        v89.Parent = v72

        local v90 = Instance.new("Frame", v89)
        v90.Name = "Container"
        v90.Size = UDim2.new(0, 260, 1, -20)
        v90.Position = UDim2.new(1, -276, 0, 10)
        v90.BackgroundTransparency = 1

        local v58 = Instance.new("UIListLayout", v90)
        v58.SortOrder = Enum.SortOrder.LayoutOrder
        v58.VerticalAlignment = Enum.VerticalAlignment.Top
        v58.Padding = UDim.new(0, 8)
    end

    local v90 = v89.Container
    local v91 = Instance.new("Frame", v90)
    v91.Name = "Notif"
    v91.Size = UDim2.new(1, 0, 0, 64)
    v91.Position = UDim2.new(1, 20, 0, 0)
    v91.BackgroundColor3 = v49[v50].Secondary
    v91.BorderSizePixel = 0
    v91.ClipsDescendants = true

    v52.Track(v91, "BackgroundColor3", function() return v49[v50].Secondary end)

    local v74 = Instance.new("UICorner", v91)
    v74.CornerRadius = UDim.new(0, 8)

    local v75 = Instance.new("UIStroke", v91)
    v75.Thickness = 1
    v75.Transparency = 0.5
    v75.Color = v49[v50].Stroke
    v52.Track(v75, "Color", function() return v49[v50].Stroke end)

    local v92 = Instance.new("TextLabel", v91)
    v92.Size = UDim2.new(1, -24, 0, 20)
    v92.Position = UDim2.new(0, 12, 0, 8)
    v92.BackgroundTransparency = 1
    v92.Font = Enum.Font.GothamBold
    v92.Text = v85
    v92.TextColor3 = v49[v50].Text
    v92.TextSize = 13
    v92.TextXAlignment = Enum.TextXAlignment.Left
    v52.Track(v92, "TextColor3", function() return v49[v50].Text end)

    local v93 = Instance.new("TextLabel", v91)
    v93.Size = UDim2.new(1, -24, 0, 24)
    v93.Position = UDim2.new(0, 12, 0, 28)
    v93.BackgroundTransparency = 1
    v93.Font = Enum.Font.Gotham
    v93.Text = v86
    v93.TextColor3 = v49[v50].SubText
    v93.TextSize = 12
    v93.TextWrapped = true
    v93.TextXAlignment = Enum.TextXAlignment.Left
    v52.Track(v93, "TextColor3", function() return v49[v50].SubText end)

    local v94 = Instance.new("Frame", v91)
    v94.Size = UDim2.new(1, 0, 0, 2)
    v94.Position = UDim2.new(0, 0, 1, -2)
    v94.BackgroundColor3 = v49[v50].Accent
    v94.BorderSizePixel = 0
    v52.Track(v94, "BackgroundColor3", function() return v49[v50].Accent end)

    v3:Create(v91, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(0, 0, 0, 0) }):Play()
    v3:Create(v94, TweenInfo.new(v87, Enum.EasingStyle.Linear), { Size = UDim2.new(0, 0, 0, 2) }):Play()

    task.delay(v87, function()
        local v95 = v3:Create(v91, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Position = UDim2.new(1, 20, 0, 0) })
        v95:Play()
        v95.Completed:Connect(function()
            v91:Destroy()
        end)
    end)
end

local function v96(v97)
    local v72 = v11()
    local v98 = Instance.new("ScreenGui")
    v98.Name = "SkidXMovableVideo"
    v98.ResetOnSpawn = false
    v98.DisplayOrder = 999
    v98.IgnoreGuiInset = true
    v98.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    v98.Parent = v72

    local v99 = Instance.new("Frame", v98)
    v99.Name = "LoadingCard"
    v99.Size = UDim2.new(0, 480, 0, 270)
    v99.Position = UDim2.new(0.5, -240, 0.5, -135)
    v99.BackgroundColor3 = v49[v50].Background
    v99.BorderSizePixel = 0
    v99.ClipsDescendants = true

    local v100 = Instance.new("UICorner", v99)
    v100.CornerRadius = UDim.new(0, 12)

    local v101 = Instance.new("UIStroke", v99)
    v101.Color = v49[v50].Accent
    v101.Thickness = 1.5
    v101.Transparency = 0.5

    local v102 = Instance.new("ImageLabel", v99)
    v102.Name = "Frame1"
    v102.Size = UDim2.new(1, 0, 1, 0)
    v102.BackgroundTransparency = 1
    v102.BorderSizePixel = 0
    v102.ZIndex = 2

    local v103 = Instance.new("ImageLabel", v99)
    v103.Name = "Frame2"
    v103.Size = UDim2.new(1, 0, 1, 0)
    v103.BackgroundTransparency = 1
    v103.BorderSizePixel = 0
    v103.ZIndex = 1

    local v104 = Instance.new("UICorner", v102)
    v104.CornerRadius = UDim.new(0, 12)
    local v105 = Instance.new("UICorner", v103)
    v105.CornerRadius = UDim.new(0, 12)

    local v106 = Instance.new("ImageLabel", v99)
    v106.Size = UDim2.new(0, 64, 0, 64)
    v106.Position = UDim2.new(0.5, -32, 0.5, -55)
    v106.BackgroundTransparency = 1
    v106.Image = v33 ~= "" and v33 or v30("layout-dashboard")
    v106.ImageColor3 = v49[v50].Accent
    v106.ZIndex = 3

    local v107 = Instance.new("TextLabel", v99)
    v107.Size = UDim2.new(1, 0, 0, 32)
    v107.Position = UDim2.new(0, 0, 0.5, 20)
    v107.BackgroundTransparency = 1
    v107.Font = Enum.Font.GothamBold
    v107.Text = "SkidX"
    v107.TextColor3 = v49[v50].Text
    v107.TextSize = 22
    v107.ZIndex = 3

    local v108 = Instance.new("TextLabel", v99)
    v108.Size = UDim2.new(1, 0, 0, 20)
    v108.Position = UDim2.new(0, 0, 0.5, 54)
    v108.BackgroundTransparency = 1
    v108.Font = Enum.Font.Gotham
    v108.Text = "Loading interface..."
    v108.TextColor3 = v49[v50].SubText
    v108.TextSize = 13
    v108.ZIndex = 3

    local v109 = false
    local v110, v111
    v99.InputBegan:Connect(function(v82)
        if v82.UserInputType == Enum.UserInputType.MouseButton1 or v82.UserInputType == Enum.UserInputType.Touch then
            v109 = true
            v110 = v82.Position
            v111 = v99.Position
            v82.Changed:Connect(function()
                if v82.UserInputState == Enum.UserInputState.End then
                    v109 = false
                end
            end)
        end
    end)

    v2.InputChanged:Connect(function(v82)
        if v109 and (v82.UserInputType == Enum.UserInputType.MouseMovement or v82.UserInputType == Enum.UserInputType.Touch) then
            local v112 = v82.Position - v110
            v99.Position = UDim2.new(v111.X.Scale, v111.X.Offset + v112.X, v111.Y.Scale, v111.Y.Offset + v112.Y)
        end
    end)

    v47(v46)

    local v113 = v3:Create(v106, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true), {
        Size = UDim2.new(0, 72, 0, 72),
        Position = UDim2.new(0.5, -36, 0.5, -59),
        ImageColor3 = v49[v50].AccentHover
    })
    v113:Play()

    local v114 = {}
    if isfolder and isfolder(v14 .. "/VideoFrames") and listfiles then
        local v12, v115 = pcall(listfiles, v14 .. "/VideoFrames")
        if v12 and type(v115) == "table" then
            table.sort(v115)
            for v26, v116 in ipairs(v115) do
                if string.match(v116, "%.png$") or string.match(v116, "%.jpg$") then
                    table.insert(v114, v20(v116))
                end
            end
        end
    end

    local v117
    local v118 = false
    local function v119()
        if v118 then return end
        v118 = true
        if v117 then v117:Disconnect() end
        v113:Cancel()

        local v95 = v3:Create(v99, TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        })
        v95:Play()
        v95.Completed:Connect(function()
            v98:Destroy()
            if v97 then
                v97()
            end
        end)
    end

    if #v114 > 1 then
        v106.Visible = false
        v107.Visible = false
        v108.Visible = false
        local v120 = tick()
        local v121 = 1
        local v122 = 1
        v117 = v1.RenderStepped:Connect(function()
            local v123 = tick()
            local v61 = v123 - v120
            v120 = v123
            v121 = v121 + v61 * 30
            local v124 = math.floor(v121)
            if v124 > #v114 then
                v119()
                return
            end
            if v124 ~= v122 and v114[v124] then
                v122 = v124
                if v102.ZIndex == 2 then
                    v102.ZIndex = 1
                    v103.ZIndex = 2
                    v102.Image = v114[v124]
                else
                    v103.ZIndex = 1
                    v102.ZIndex = 2
                    v103.Image = v114[v124]
                end
            end
        end)
    else
        task.delay(1.8, v119)
    end
end

function v83.CreateWindow(v84)
    v84 = v84 or {}
    local v125 = v84.Subtitle or "v1.0.0"
    local v126 = v84.DiscordLink or "https://discord.gg/Mtv33tEqbR"
    local v127 = v84.Icon or "layout-dashboard"

    local v72 = v11()
    local v128 = Instance.new("ScreenGui")
    v128.Name = "SkidXInterface"
    v128.ResetOnSpawn = false
    v128.DisplayOrder = 10
    v128.IgnoreGuiInset = true
    v128.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    v128.Parent = v72

    local v129 = Instance.new("Frame", v128)
    v129.Name = "Main"
    v129.Size = UDim2.new(0, 600, 0, 400)
    v129.Position = UDim2.new(0.5, -300, 0.5, -200)
    v129.BackgroundColor3 = v49[v50].Background
    v129.BorderSizePixel = 0
    v129.ClipsDescendants = true

    v52.Track(v129, "BackgroundColor3", function() return v49[v50].Background end)

    local v130 = Instance.new("UICorner", v129)
    v130.CornerRadius = UDim.new(0, 12)

    local v131 = Instance.new("UIStroke", v129)
    v131.Color = v49[v50].Accent
    v131.Thickness = 1
    v131.Transparency = 0.6
    v52.Track(v131, "Color", function() return v49[v50].Accent end)

    local v132 = Instance.new("Frame", v129)
    v132.Name = "TopBar"
    v132.Size = UDim2.new(1, 0, 0, 50)
    v132.BackgroundColor3 = v49[v50].Secondary
    v132.BorderSizePixel = 0
    v132.ZIndex = 2
    v52.Track(v132, "BackgroundColor3", function() return v49[v50].Secondary end)

    local v133 = Instance.new("UICorner", v132)
    v133.CornerRadius = UDim.new(0, 12)

    local v134 = Instance.new("Frame", v132)
    v134.Size = UDim2.new(1, 0, 0, 12)
    v134.Position = UDim2.new(0, 0, 1, -12)
    v134.BackgroundColor3 = v49[v50].Secondary
    v134.BorderSizePixel = 0
    v52.Track(v134, "BackgroundColor3", function() return v49[v50].Secondary end)

    local v135 = Instance.new("ImageLabel", v132)
    v135.Size = UDim2.new(0, 20, 0, 20)
    v135.Position = UDim2.new(0, 16, 0.5, -10)
    v135.BackgroundTransparency = 1
    v135.Image = v30(v127)
    v135.ImageColor3 = v49[v50].Accent
    v135.ZIndex = 3
    v52.Track(v135, "ImageColor3", function() return v49[v50].Accent end)

    local v92 = Instance.new("TextLabel", v132)
    v92.Size = UDim2.new(0, 120, 0, 20)
    v92.Position = UDim2.new(0, 44, 0.5, -10)
    v92.BackgroundTransparency = 1
    v92.Font = Enum.Font.GothamBold
    v92.Text = "SkidX"
    v92.TextColor3 = v49[v50].Text
    v92.TextSize = 15
    v92.TextXAlignment = Enum.TextXAlignment.Left
    v92.ZIndex = 3
    v52.Track(v92, "TextColor3", function() return v49[v50].Text end)

    local v136 = v7:GetTextSize(v125, 11, Enum.Font.Gotham, Vector2.new(1000, 14))
    local v137 = Instance.new("TextLabel", v132)
    v137.Size = UDim2.new(0, v136.X + 4, 0, 14)
    v137.Position = UDim2.new(0, 116, 0.5, -7)
    v137.BackgroundTransparency = 1
    v137.Font = Enum.Font.Gotham
    v137.Text = v125
    v137.TextColor3 = v49[v50].SubText
    v137.TextSize = 11
    v137.TextXAlignment = Enum.TextXAlignment.Left
    v137.ZIndex = 3
    v52.Track(v137, "TextColor3", function() return v49[v50].SubText end)

    local function v138(v139)
        local v140 = Instance.new("ScreenGui")
        v140.Name = "UwUFlyer"
        v140.IgnoreGuiInset = true
        v140.ResetOnSpawn = false
        v140.DisplayOrder = 999
        v140.Parent = v11()

        local v141 = v139.AbsolutePosition
        local v142 = v139.AbsoluteSize
        local v143 = v141.X + v142.X / 2 - 30
        local v144 = v141.Y + v142.Y / 2 - 15

        local v145 = Instance.new("TextLabel", v140)
        v145.Size = UDim2.new(0, 60, 0, 30)
        v145.Position = UDim2.new(0, v143, 0, v144)
        v145.BackgroundTransparency = 1
        v145.Font = Enum.Font.GothamBold
        v145.Text = "UwU"
        v145.TextColor3 = Color3.fromRGB(255, 105, 180)
        v145.TextStrokeColor3 = Color3.fromRGB(1, 1, 1)
        v145.TextStrokeTransparency = 0.2
        v145.TextSize = 24
        v145.TextTransparency = 0

        local v146 = math.random(-60, 60)
        local v147 = math.random(-150, -100)

        local v148 = v3:Create(v145, TweenInfo.new(1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, v143 + v146, 0, v144 + v147),
            TextTransparency = 1,
            TextStrokeTransparency = 1
        })
        v148:Play()
        v148.Completed:Connect(function()
            v140:Destroy()
        end)
    end

    local v149 = Instance.new("ImageButton", v132)
    v149.Name = "DiscordButton"
    v149.Size = UDim2.new(0, 18, 0, 18)
    v149.Position = UDim2.new(0, 116 + v136.X + 10, 0.5, -9)
    v149.BackgroundTransparency = 1
    v149.Image = v35 ~= "" and v35 or v30("message-circle")
    v149.ImageColor3 = v49[v50].Accent
    v149.ZIndex = 3
    v52.Track(v149, "ImageColor3", function() return v49[v50].Accent end)

    v77(v149, "Discord: " .. v126)

    v149.MouseEnter:Connect(function()
        v3:Create(v149, TweenInfo.new(0.2), { ImageColor3 = v49[v50].AccentHover }):Play()
    end)
    v149.MouseLeave:Connect(function()
        v3:Create(v149, TweenInfo.new(0.2), { ImageColor3 = v49[v50].Accent }):Play()
    end)
    v149.MouseButton1Click:Connect(function()
        v47(v43)
        v138(v149)
        if setclipboard then
            setclipboard(v126)
        elseif toclipboard then
            toclipboard(v126)
        end
        v83.Notify({
            Title = "Copied!",
            Description = "Discord link copied to clipboard.",
            Duration = 3
        })
    end)

    local v150 = {
        Gui = v128,
        Main = v129,
        Tabs = {},
        ActiveTab = nil,
        Locked = false,
    }

    function v150:PromptClose()
        local v151 = Instance.new("Frame", v128)
        v151.Name = "ModalOverlay"
        v151.Size = UDim2.new(1, 0, 1, 0)
        v151.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        v151.BackgroundTransparency = 1
        v151.ZIndex = 50

        v3:Create(v151, TweenInfo.new(0.15), { BackgroundTransparency = 0.4 }):Play()

        local v152 = Instance.new("Frame", v151)
        v152.Name = "PromptBox"
        v152.Size = UDim2.new(0, 260, 0, 130)
        v152.Position = UDim2.new(0.5, -130, 0.5, -65)
        v152.BackgroundColor3 = v49[v50].Secondary
        v152.BorderSizePixel = 0
        v152.ZIndex = 51

        local v153 = Instance.new("UICorner", v152)
        v153.CornerRadius = UDim.new(0, 10)

        local v154 = Instance.new("UIStroke", v152)
        v154.Color = v49[v50].Accent
        v154.Thickness = 1
        v154.Transparency = 0.5

        local v155 = Instance.new("TextLabel", v152)
        v155.Size = UDim2.new(1, -24, 0, 22)
        v155.Position = UDim2.new(0, 12, 0, 14)
        v155.BackgroundTransparency = 1
        v155.Font = Enum.Font.GothamSemibold
        v155.Text = "Close Interface?"
        v155.TextColor3 = v49[v50].Text
        v155.TextSize = 14
        v155.TextXAlignment = Enum.TextXAlignment.Left
        v155.ZIndex = 52

        local v156 = Instance.new("TextLabel", v152)
        v156.Size = UDim2.new(1, -24, 0, 40)
        v156.Position = UDim2.new(0, 12, 0, 38)
        v156.BackgroundTransparency = 1
        v156.Font = Enum.Font.Gotham
        v156.Text = "This will remove the interface completely."
        v156.TextColor3 = v49[v50].SubText
        v156.TextSize = 12
        v156.TextWrapped = true
        v156.TextXAlignment = Enum.TextXAlignment.Left
        v156.ZIndex = 52

        local v157 = Instance.new("TextButton", v152)
        v157.Size = UDim2.new(0, 110, 0, 32)
        v157.Position = UDim2.new(0, 12, 1, -44)
        v157.BackgroundColor3 = v49[v50].Tertiary
        v157.AutoButtonColor = false
        v157.Font = Enum.Font.GothamMedium
        v157.Text = "Cancel"
        v157.TextColor3 = v49[v50].Text
        v157.TextSize = 12
        v157.ZIndex = 52

        local v158 = Instance.new("UICorner", v157)
        v158.CornerRadius = UDim.new(0, 6)

        local v159 = Instance.new("TextButton", v152)
        v159.Size = UDim2.new(0, 110, 0, 32)
        v159.Position = UDim2.new(1, -122, 1, -44)
        v159.BackgroundColor3 = v49[v50].Danger
        v159.AutoButtonColor = false
        v159.Font = Enum.Font.GothamMedium
        v159.Text = "Close"
        v159.TextColor3 = Color3.fromRGB(255, 255, 255)
        v159.TextSize = 12
        v159.ZIndex = 52

        local v160 = Instance.new("UICorner", v159)
        v160.CornerRadius = UDim.new(0, 6)

        v157.MouseButton1Click:Connect(function()
            v47(v43)
            v151:Destroy()
        end)

        v159.MouseButton1Click:Connect(function()
            v47(v43)
            v128:Destroy()
        end)
    end

    local v161, v162

    local function v163(v164, v165, v166, v167, v168)
        local v169 = Instance.new("ImageButton", v132)
        v169.Size = UDim2.new(0, 28, 0, 28)
        v169.Position = UDim2.new(1, v164 * -36, 0.5, -14)
        v169.BackgroundColor3 = v49[v50].Tertiary
        v169.BackgroundTransparency = 1
        v169.BorderSizePixel = 0
        v169.AutoButtonColor = false
        v169.ZIndex = 3

        local v170 = Instance.new("UICorner", v169)
        v170.CornerRadius = UDim.new(0, 6)

        local v171 = Instance.new("ImageLabel", v169)
        v171.Size = UDim2.new(0, 16, 0, 16)
        v171.Position = UDim2.new(0.5, -8, 0.5, -8)
        v171.BackgroundTransparency = 1
        v171.Image = v30(v165)
        local v172 = v168 and v49[v50][v168] or v49[v50].SubText
        v171.ImageColor3 = v172
        v171.ZIndex = 3
        v52.Track(v171, "ImageColor3", function()
            return v168 and v49[v50][v168] or v49[v50].SubText
        end)

        if v167 then
            v77(v169, v167)
        end

        v169.MouseEnter:Connect(function()
            v3:Create(v169, TweenInfo.new(0.2), { BackgroundTransparency = 0.5 }):Play()
            local v173 = v168 and v49[v50][v168] or v49[v50].Text
            v3:Create(v171, TweenInfo.new(0.2), { ImageColor3 = v173 }):Play()
        end)
        v169.MouseLeave:Connect(function()
            v3:Create(v169, TweenInfo.new(0.2), { BackgroundTransparency = 1 }):Play()
            local v174 = v168 and v49[v50][v168] or v49[v50].SubText
            v3:Create(v171, TweenInfo.new(0.2), { ImageColor3 = v174 }):Play()
        end)
        v169.MouseButton1Click:Connect(function()
            v47(v43)
            v166(v171)
        end)

        return v169, v171
    end

    local v175 = Instance.new("ImageButton", v128)
    v175.Name = "FloatButton"
    v175.Size = UDim2.new(0, 42, 0, 42)
    v175.Position = UDim2.new(0, 42, 0.5, 0)
    v175.AnchorPoint = Vector2.new(0.5, 0.5)
    v175.BackgroundColor3 = v49[v50].Secondary
    v175.BorderSizePixel = 0
    v175.AutoButtonColor = false
    v175.Visible = false
    v52.Track(v175, "BackgroundColor3", function() return v49[v50].Secondary end)

    local v176 = Instance.new("UICorner", v175)
    v176.CornerRadius = UDim.new(1, 0)

    local v177 = Instance.new("UIStroke", v175)
    v177.Color = v49[v50].Accent
    v177.Thickness = 1
    v177.Transparency = 0.4
    v52.Track(v177, "Color", function() return v49[v50].Accent end)

    local v178 = Instance.new("ImageLabel", v175)
    v178.Size = UDim2.new(0, 20, 0, 20)
    v178.Position = UDim2.new(0.5, -10, 0.5, -10)
    v178.BackgroundTransparency = 1
    v178.Image = v30("layout-dashboard")
    v178.ImageColor3 = v49[v50].Accent
    v52.Track(v178, "ImageColor3", function() return v49[v50].Accent end)

    local v179 = false
    local v180 = false
    local v181 = UDim2.new(0, 600, 0, 400)
    local v182 = UDim2.new(0.5, -300, 0.5, -200)

    function v150:ToggleVisibility(v183)
        local v184 = v183 ~= nil and not v183 or (v129.Visible and not v175.Visible)
        if v184 then
            v83.Notify({
                Title = "Interface Hidden",
                Description = "Press RightControl again to reveal the menu.",
                Duration = 4
            })
            local v185 = v3:Create(v129, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 0, 0, 0)
            })
            v185:Play()
            v185.Completed:Connect(function()
                v129.Visible = false
                v175.Visible = true
                v175.Size = UDim2.new(0, 0, 0, 0)
                v3:Create(v175, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, 42, 0, 42)
                }):Play()
            end)
        else
            local v185 = v3:Create(v175, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 0, 0, 0)
            })
            v185:Play()
            v185.Completed:Connect(function()
                v175.Visible = false
                v129.Visible = true
                v129.Size = UDim2.new(0, 0, 0, 0)
                local v186 = v179 and UDim2.new(0, v129.AbsoluteSize.X, 0, 50) or (v180 and UDim2.new(0.8, 0, 0.8, 0) or v181)
                v3:Create(v129, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                    Size = v186
                }):Play()
            end)
        end
    end

    v175.MouseButton1Click:Connect(function()
        v47(v43)
        v150:ToggleVisibility(true)
    end)

    v163(1, "x", function()
        v150:PromptClose()
    end, "Close", "Danger")

    v163(2, "eye-off", function()
        v150:ToggleVisibility(false)
    end, "Hide UI")

    v163(3, "minus", function()
        v47(v43)
        v179 = not v179
        if v161 then v161.Visible = not v179 end
        if v162 then v162.Visible = not v179 end
        if v179 then
            local v187 = v129.AbsoluteSize.X
            v3:Create(v129, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, v187, 0, 50)
            }):Play()
        else
            local v186 = v180 and UDim2.new(0.8, 0, 0.8, 0) or v181
            v3:Create(v129, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                Size = v186
            }):Play()
        end
    end, function()
        return v179 and "Restore" or "Minimize"
    end)

    v163(4, "maximize-2", function()
        v47(v43)
        v180 = not v180
        if v180 then
            v181 = v129.Size
            v182 = v129.Position
            v3:Create(v129, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                Size = UDim2.new(0.8, 0, 0.8, 0),
                Position = UDim2.new(0.1, 0, 0.1, 0)
            }):Play()
        else
            v3:Create(v129, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                Size = v181,
                Position = v182
            }):Play()
        end
    end, function()
        return v180 and "Restore" or "Maximize"
    end)

    v163(5, "unlock", function(v171)
        v150.Locked = not v150.Locked
        v171.Image = v30(v150.Locked and "lock" or "unlock")
        v83.Notify({
            Title = "Window",
            Description = v150.Locked and "Window position locked." or "Window unlocked.",
            Duration = 2
        })
    end, function()
        return v150.Locked and "Unlock Position" or "Lock Position"
    end)

    local v188 = false
    local v189, v110, v111
    v132.InputBegan:Connect(function(v82)
        if v150.Locked then return end
        if v82.UserInputType == Enum.UserInputType.MouseButton1 or v82.UserInputType == Enum.UserInputType.Touch then
            v188 = true
            v110 = v82.Position
            v111 = v129.Position
            v82.Changed:Connect(function()
                if v82.UserInputState == Enum.UserInputState.End then
                    v188 = false
                end
            end)
        end
    end)

    v132.InputChanged:Connect(function(v82)
        if v82.UserInputType == Enum.UserInputType.MouseMovement or v82.UserInputType == Enum.UserInputType.Touch then
            v189 = v82
        end
    end)

    v2.InputChanged:Connect(function(v82)
        if v82 == v189 and v188 and not v150.Locked then
            local v112 = v82.Position - v110
            v129.Position = UDim2.new(v111.X.Scale, v111.X.Offset + v112.X, v111.Y.Scale, v111.Y.Offset + v112.Y)
        end
    end)

    local function v190(v191, v192, v193)
        local v194 = Instance.new("Frame", v129)
        v194.Name = "Resize_" .. v191
        v194.Size = v192
        v194.Position = v193
        v194.BackgroundTransparency = 1
        v194.Active = true
        v194.ZIndex = 15

        local v195 = string.find(v191, "S") ~= nil
        local v196 = string.find(v191, "E") ~= nil

        local v197 = false
        local v198, v199

        v194.InputBegan:Connect(function(v82)
            if v150.Locked then return end
            if v82.UserInputType == Enum.UserInputType.MouseButton1 or v82.UserInputType == Enum.UserInputType.Touch then
                v197 = true
                v198 = v82.Position
                v199 = v129.AbsoluteSize
                v82.Changed:Connect(function()
                    if v82.UserInputState == Enum.UserInputState.End then
                        v197 = false
                    end
                end)
            end
        end)

        v2.InputChanged:Connect(function(v82)
            if v197 and (v82.UserInputType == Enum.UserInputType.MouseMovement or v82.UserInputType == Enum.UserInputType.Touch) then
                local v112 = v82.Position - v198
                local v200 = v199.X
                local v201 = v199.Y
                if v196 then
                    v200 = math.max(450, v199.X + v112.X)
                end
                if v195 then
                    v201 = math.max(300, v199.Y + v112.Y)
                end
                v129.Size = UDim2.new(0, v200, 0, v201)
            end
        end)

        return v194
    end

    v190("S", UDim2.new(1, -16, 0, 8), UDim2.new(0, 8, 1, -8))
    v190("E", UDim2.new(0, 8, 1, -16), UDim2.new(1, -8, 0, 8))
    v190("SE", UDim2.new(0, 16, 0, 16), UDim2.new(1, -16, 1, -16))

    v161 = Instance.new("ScrollingFrame", v129)
    v161.Name = "TabList"
    v161.Size = UDim2.new(0, 150, 1, -50)
    v161.Position = UDim2.new(0, 0, 0, 50)
    v161.BackgroundColor3 = v49[v50].Secondary
    v161.BorderSizePixel = 0
    v161.ScrollBarThickness = 2
    v161.ScrollBarImageColor3 = v49[v50].Stroke
    v161.CanvasSize = UDim2.new(0, 0, 0, 0)
    v52.Track(v161, "BackgroundColor3", function() return v49[v50].Secondary end)

    local v202 = Instance.new("UIListLayout", v161)
    v202.SortOrder = Enum.SortOrder.LayoutOrder
    v202.Padding = UDim.new(0, 4)

    local v203 = Instance.new("UIPadding", v161)
    v203.PaddingTop = UDim.new(0, 8)
    v203.PaddingLeft = UDim.new(0, 8)
    v203.PaddingRight = UDim.new(0, 8)
    v203.PaddingBottom = UDim.new(0, 8)

    v202:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        v161.CanvasSize = UDim2.new(0, 0, 0, v202.AbsoluteContentSize.Y + 16)
    end)

    v162 = Instance.new("Frame", v129)
    v162.Name = "Content"
    v162.Size = UDim2.new(1, -150, 1, -50)
    v162.Position = UDim2.new(0, 150, 0, 50)
    v162.BackgroundTransparency = 1
    v162.ClipsDescendants = true

    v150.TabList = v161
    v150.Content = v162

    v2.InputBegan:Connect(function(v82, v204)
        if not v204 and v82.KeyCode == Enum.KeyCode.RightControl then
            v129.Visible = not v129.Visible
        end
    end)

    v129.Size = UDim2.new(0, 0, 0, 0)
    v129.Position = UDim2.new(0.5, 0, 0.5, 0)
    v3:Create(v129, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 600, 0, 400),
        Position = UDim2.new(0.5, -300, 0.5, -200)
    }):Play()

    local v205 = {}

    function v205:CreateTab(v31, v165)
        local v206 = #v150.Tabs + 1

        local v207 = Instance.new("TextButton", v150.TabList)
        v207.Name = "Tab_" .. v31
        v207.Size = UDim2.new(1, 0, 0, 36)
        v207.BackgroundColor3 = v49[v50].Accent
        v207.BackgroundTransparency = 1
        v207.AutoButtonColor = false
        v207.Text = ""
        v207.LayoutOrder = v206

        local v208 = Instance.new("UICorner", v207)
        v208.CornerRadius = UDim.new(0, 8)

        local v209 = Instance.new("ImageLabel", v207)
        v209.Size = UDim2.new(0, 18, 0, 18)
        v209.Position = UDim2.new(0, 10, 0.5, -9)
        v209.BackgroundTransparency = 1
        v209.Image = v30(v165 or "circle")
        v209.ImageColor3 = v49[v50].SubText
        v52.Track(v209, "ImageColor3", function()
            if v150.ActiveTab and v150.ActiveTab.Name == v31 then
                return v49[v50].Text
            end
            return v49[v50].SubText
        end)

        local v210 = Instance.new("TextLabel", v207)
        v210.Size = UDim2.new(1, -40, 1, 0)
        v210.Position = UDim2.new(0, 36, 0, 0)
        v210.BackgroundTransparency = 1
        v210.Font = Enum.Font.GothamMedium
        v210.Text = v31
        v210.TextColor3 = v49[v50].SubText
        v210.TextSize = 13
        v210.TextXAlignment = Enum.TextXAlignment.Left
        v52.Track(v210, "TextColor3", function()
            if v150.ActiveTab and v150.ActiveTab.Name == v31 then
                return v49[v50].Text
            end
            return v49[v50].SubText
        end)

        local v211 = Instance.new("Frame", v207)
        v211.Size = UDim2.new(0, 3, 0, 18)
        v211.Position = UDim2.new(0, 2, 0.5, -9)
        v211.BackgroundColor3 = v49[v50].Accent
        v211.BorderSizePixel = 0
        v211.BackgroundTransparency = 1
        v52.Track(v211, "BackgroundColor3", function() return v49[v50].Accent end)

        local v212 = Instance.new("UICorner", v211)
        v212.CornerRadius = UDim.new(1, 0)

        local v213 = Instance.new("ScrollingFrame", v150.Content)
        v213.Name = "Page_" .. v31
        v213.Size = UDim2.new(1, 0, 1, 0)
        v213.BackgroundTransparency = 1
        v213.BorderSizePixel = 0
        v213.ScrollBarThickness = 3
        v213.ScrollBarImageColor3 = v49[v50].Stroke
        v213.CanvasSize = UDim2.new(0, 0, 0, 0)
        v213.Visible = false

        local v214 = Instance.new("UIListLayout", v213)
        v214.SortOrder = Enum.SortOrder.LayoutOrder
        v214.Padding = UDim.new(0, 8)

        local v215 = Instance.new("UIPadding", v213)
        v215.PaddingTop = UDim.new(0, 12)
        v215.PaddingLeft = UDim.new(0, 14)
        v215.PaddingRight = UDim.new(0, 14)
        v215.PaddingBottom = UDim.new(0, 12)

        v214:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            v213.CanvasSize = UDim2.new(0, 0, 0, v214.AbsoluteContentSize.Y + 24)
        end)

        local v216 = {
            Name = v31,
            Button = v207,
            Icon = v209,
            Label = v210,
            Indicator = v211,
            Page = v213,
            LayoutOrder = 0,
        }

        local function v217()
            if v150.ActiveTab == v216 then return end

            v47(v45)

            if v150.ActiveTab then
                local v218 = v150.ActiveTab
                v218.Page.Visible = false
                v3:Create(v218.Button, TweenInfo.new(0.2), { BackgroundTransparency = 1 }):Play()
                v3:Create(v218.Icon, TweenInfo.new(0.2), { ImageColor3 = v49[v50].SubText }):Play()
                v3:Create(v218.Label, TweenInfo.new(0.2), { TextColor3 = v49[v50].SubText }):Play()
                v3:Create(v218.Indicator, TweenInfo.new(0.2), { BackgroundTransparency = 1 }):Play()
            end

            v150.ActiveTab = v216
            v216.Page.Visible = true
            v216.Page.Position = UDim2.new(0, 10, 0, 0)
            v3:Create(v216.Page, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(0, 0, 0, 0) }):Play()

            v3:Create(v207, TweenInfo.new(0.2), { BackgroundTransparency = 0.88 }):Play()
            v3:Create(v209, TweenInfo.new(0.2), { ImageColor3 = v49[v50].Accent }):Play()
            v3:Create(v210, TweenInfo.new(0.2), { TextColor3 = v49[v50].Text }):Play()
            v3:Create(v211, TweenInfo.new(0.2), { BackgroundTransparency = 0 }):Play()
        end

        v207.MouseButton1Click:Connect(v217)

        table.insert(v150.Tabs, v216)
        if #v150.Tabs == 1 then
            v217()
        end

        local v219 = {}

        local function v220()
            v216.LayoutOrder = v216.LayoutOrder + 1
            return v216.LayoutOrder
        end

        function v219:CreateSection(v85)
            local v221 = Instance.new("TextLabel", v213)
            v221.Size = UDim2.new(1, 0, 0, 18)
            v221.BackgroundTransparency = 1
            v221.Font = Enum.Font.GothamBold
            v221.Text = string.upper(v85)
            v221.TextColor3 = v49[v50].Accent
            v221.TextSize = 11
            v221.TextXAlignment = Enum.TextXAlignment.Left
            v221.LayoutOrder = v220()
            v52.Track(v221, "TextColor3", function() return v49[v50].Accent end)

            local v222 = {}

            function v222:CreateLabel(v223)
                local v76 = Instance.new("TextLabel", v213)
                v76.Size = UDim2.new(1, 0, 0, 20)
                v76.BackgroundTransparency = 1
                v76.Font = Enum.Font.Gotham
                v76.Text = v223
                v76.TextColor3 = v49[v50].SubText
                v76.TextSize = 12
                v76.TextWrapped = true
                v76.TextXAlignment = Enum.TextXAlignment.Left
                v76.LayoutOrder = v220()
                v52.Track(v76, "TextColor3", function() return v49[v50].SubText end)
                return v76
            end

            function v222:CreateButton(v224)
                v224 = v224 or {}
                local v225 = v224.Title or "Button"
                local v226 = v224.Callback or function() end

                local v227 = Instance.new("Frame", v213)
                v227.Size = UDim2.new(1, 0, 0, 44)
                v227.BackgroundColor3 = v49[v50].Secondary
                v227.BorderSizePixel = 0
                v227.LayoutOrder = v220()
                v52.Track(v227, "BackgroundColor3", function() return v49[v50].Secondary end)

                local v228 = Instance.new("UICorner", v227)
                v228.CornerRadius = UDim.new(0, 8)

                local v229 = Instance.new("UIStroke", v227)
                v229.Color = v49[v50].Stroke
                v229.Thickness = 1
                v229.Transparency = 0.5
                v52.Track(v229, "Color", function() return v49[v50].Stroke end)

                local v76 = Instance.new("TextLabel", v227)
                v76.Size = UDim2.new(1, -90, 1, 0)
                v76.Position = UDim2.new(0, 14, 0, 0)
                v76.BackgroundTransparency = 1
                v76.Font = Enum.Font.GothamMedium
                v76.Text = v225
                v76.TextColor3 = v49[v50].Text
                v76.TextSize = 13
                v76.TextXAlignment = Enum.TextXAlignment.Left
                v52.Track(v76, "TextColor3", function() return v49[v50].Text end)

                local v230 = Instance.new("TextButton", v227)
                v230.Size = UDim2.new(0, 72, 0, 28)
                v230.Position = UDim2.new(1, -86, 0.5, -14)
                v230.BackgroundColor3 = v49[v50].Tertiary
                v230.AutoButtonColor = false
                v230.Font = Enum.Font.GothamMedium
                v230.Text = "Run"
                v230.TextColor3 = v49[v50].Accent
                v230.TextSize = 13
                v52.Track(v230, "BackgroundColor3", function() return v49[v50].Tertiary end)
                v52.Track(v230, "TextColor3", function() return v49[v50].Accent end)

                local v231 = Instance.new("UICorner", v230)
                v231.CornerRadius = UDim.new(0, 6)

                v230.MouseEnter:Connect(function()
                    v3:Create(v230, TweenInfo.new(0.2), { BackgroundColor3 = v49[v50].Accent, TextColor3 = v49[v50].Secondary }):Play()
                end)
                v230.MouseLeave:Connect(function()
                    v3:Create(v230, TweenInfo.new(0.2), { BackgroundColor3 = v49[v50].Tertiary, TextColor3 = v49[v50].Accent }):Play()
                end)
                v230.MouseButton1Click:Connect(function()
                    v47(v43)
                    pcall(v226)
                end)

                return v230
            end

            function v222:CreateToggle(v232)
                v232 = v232 or {}
                local v225 = v232.Title or "Toggle"
                local v233 = v232.Default or false
                local v226 = v232.Callback or function() end

                local v227 = Instance.new("Frame", v213)
                v227.Size = UDim2.new(1, 0, 0, 44)
                v227.BackgroundColor3 = v49[v50].Secondary
                v227.BorderSizePixel = 0
                v227.LayoutOrder = v220()
                v52.Track(v227, "BackgroundColor3", function() return v49[v50].Secondary end)

                local v228 = Instance.new("UICorner", v227)
                v228.CornerRadius = UDim.new(0, 8)

                local v229 = Instance.new("UIStroke", v227)
                v229.Color = v49[v50].Stroke
                v229.Thickness = 1
                v229.Transparency = 0.5
                v52.Track(v229, "Color", function() return v49[v50].Stroke end)

                local v76 = Instance.new("TextLabel", v227)
                v76.Size = UDim2.new(1, -70, 1, 0)
                v76.Position = UDim2.new(0, 14, 0, 0)
                v76.BackgroundTransparency = 1
                v76.Font = Enum.Font.GothamMedium
                v76.Text = v225
                v76.TextColor3 = v49[v50].Text
                v76.TextSize = 13
                v76.TextXAlignment = Enum.TextXAlignment.Left
                v52.Track(v76, "TextColor3", function() return v49[v50].Text end)

                local v234 = Instance.new("Frame", v227)
                v234.Size = UDim2.new(0, 40, 0, 22)
                v234.Position = UDim2.new(1, -54, 0.5, -11)
                v234.BackgroundColor3 = v233 and v49[v50].Accent or v49[v50].Tertiary
                v234.BorderSizePixel = 0
                v52.Track(v234, "BackgroundColor3", function()
                    return v233 and v49[v50].Accent or v49[v50].Tertiary
                end)

                local v235 = Instance.new("UICorner", v234)
                v235.CornerRadius = UDim.new(1, 0)

                local v236 = Instance.new("Frame", v234)
                v236.Size = UDim2.new(0, 16, 0, 16)
                v236.Position = v233 and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)
                v236.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                v236.BorderSizePixel = 0

                local v237 = Instance.new("UICorner", v236)
                v237.CornerRadius = UDim.new(1, 0)

                local v238 = Instance.new("TextButton", v227)
                v238.Size = UDim2.new(1, 0, 1, 0)
                v238.BackgroundTransparency = 1
                v238.Text = ""

                local function v239(v56)
                    v233 = v56
                    v47(v44)
                    local v240 = v233 and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)
                    local v241 = v233 and v49[v50].Accent or v49[v50].Tertiary
                    v3:Create(v236, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = v240 }):Play()
                    v3:Create(v234, TweenInfo.new(0.2), { BackgroundColor3 = v241 }):Play()
                    pcall(v226, v233)
                end

                v238.MouseButton1Click:Connect(function()
                    v239(not v233)
                end)

                return {
                    Set = v239,
                    Get = function() return v233 end,
                }
            end

            function v222:CreateSlider(v242)
                v242 = v242 or {}
                local v225 = v242.Title or "Slider"
                local v243 = v242.Min or 0
                local v244 = v242.Max or 100
                local v245 = v242.Increment or 1
                local v246 = v242.Default or v243
                local v226 = v242.Callback or function() end

                local v227 = Instance.new("Frame", v213)
                v227.Size = UDim2.new(1, 0, 0, 54)
                v227.BackgroundColor3 = v49[v50].Secondary
                v227.BorderSizePixel = 0
                v227.LayoutOrder = v220()
                v52.Track(v227, "BackgroundColor3", function() return v49[v50].Secondary end)

                local v228 = Instance.new("UICorner", v227)
                v228.CornerRadius = UDim.new(0, 8)

                local v229 = Instance.new("UIStroke", v227)
                v229.Color = v49[v50].Stroke
                v229.Thickness = 1
                v229.Transparency = 0.5
                v52.Track(v229, "Color", function() return v49[v50].Stroke end)

                local v76 = Instance.new("TextLabel", v227)
                v76.Size = UDim2.new(1, -80, 0, 24)
                v76.Position = UDim2.new(0, 14, 0, 6)
                v76.BackgroundTransparency = 1
                v76.Font = Enum.Font.GothamMedium
                v76.Text = v225
                v76.TextColor3 = v49[v50].Text
                v76.TextSize = 13
                v76.TextXAlignment = Enum.TextXAlignment.Left
                v52.Track(v76, "TextColor3", function() return v49[v50].Text end)

                local v247 = Instance.new("TextLabel", v227)
                v247.Size = UDim2.new(0, 60, 0, 24)
                v247.Position = UDim2.new(1, -74, 0, 6)
                v247.BackgroundTransparency = 1
                v247.Font = Enum.Font.Gotham
                v247.Text = tostring(v246)
                v247.TextColor3 = v49[v50].SubText
                v247.TextSize = 12
                v247.TextXAlignment = Enum.TextXAlignment.Right
                v52.Track(v247, "TextColor3", function() return v49[v50].SubText end)

                local v248 = Instance.new("Frame", v227)
                v248.Size = UDim2.new(1, -28, 0, 6)
                v248.Position = UDim2.new(0, 14, 1, -14)
                v248.BackgroundColor3 = v49[v50].Tertiary
                v248.BorderSizePixel = 0
                v52.Track(v248, "BackgroundColor3", function() return v49[v50].Tertiary end)

                local v249 = Instance.new("UICorner", v248)
                v249.CornerRadius = UDim.new(1, 0)

                local v250 = math.clamp((v246 - v243) / (v244 - v243), 0, 1)

                local v251 = Instance.new("Frame", v248)
                v251.Size = UDim2.new(v250, 0, 1, 0)
                v251.BackgroundColor3 = v49[v50].Accent
                v251.BorderSizePixel = 0
                v52.Track(v251, "BackgroundColor3", function() return v49[v50].Accent end)

                local v252 = Instance.new("UICorner", v251)
                v252.CornerRadius = UDim.new(1, 0)

                local v253 = Instance.new("Frame", v251)
                v253.Size = UDim2.new(0, 12, 0, 12)
                v253.Position = UDim2.new(1, -6, 0.5, -6)
                v253.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                v253.BorderSizePixel = 0

                local v254 = Instance.new("UICorner", v253)
                v254.CornerRadius = UDim.new(1, 0)

                local v255 = false

                local function v256(v257)
                    local v258 = v248.AbsolutePosition.X
                    local v259 = v248.AbsoluteSize.X
                    local v260 = math.clamp((v257 - v258) / v259, 0, 1)
                    local v261 = v243 + v260 * (v244 - v243)
                    local v262 = math.floor(v261 / v245 + 0.5) * v245
                    v246 = math.clamp(v262, v243, v244)

                    v247.Text = tostring(v246)
                    local v263 = math.clamp((v246 - v243) / (v244 - v243), 0, 1)
                    v251.Size = UDim2.new(v263, 0, 1, 0)
                    pcall(v226, v246)
                end

                v248.InputBegan:Connect(function(v82)
                    if v82.UserInputType == Enum.UserInputType.MouseButton1 or v82.UserInputType == Enum.UserInputType.Touch then
                        v255 = true
                        v256(v82.Position.X)
                    end
                end)

                v2.InputEnded:Connect(function(v82)
                    if v82.UserInputType == Enum.UserInputType.MouseButton1 or v82.UserInputType == Enum.UserInputType.Touch then
                        v255 = false
                    end
                end)

                v2.InputChanged:Connect(function(v82)
                    if v255 and (v82.UserInputType == Enum.UserInputType.MouseMovement or v82.UserInputType == Enum.UserInputType.Touch) then
                        v256(v82.Position.X)
                    end
                end)

                return {
                    Set = function(v56)
                        v246 = math.clamp(v56, v243, v244)
                        v247.Text = tostring(v246)
                        local v264 = math.clamp((v246 - v243) / (v244 - v243), 0, 1)
                        v251.Size = UDim2.new(v264, 0, 1, 0)
                        pcall(v226, v246)
                    end,
                    Get = function() return v246 end,
                }
            end

            function v222:CreateDropdown(v265)
                v265 = v265 or {}
                local v225 = v265.Title or "Dropdown"
                local v266 = v265.Options or {}
                local v267 = v265.Multi or false
                local v268 = v265.Default or (v267 and {} or v266[1] or "")
                local v226 = v265.Callback or function() end

                local v227 = Instance.new("Frame", v213)
                v227.Size = UDim2.new(1, 0, 0, 44)
                v227.BackgroundColor3 = v49[v50].Secondary
                v227.BorderSizePixel = 0
                v227.ClipsDescendants = true
                v227.LayoutOrder = v220()
                v52.Track(v227, "BackgroundColor3", function() return v49[v50].Secondary end)

                local v228 = Instance.new("UICorner", v227)
                v228.CornerRadius = UDim.new(0, 8)

                local v229 = Instance.new("UIStroke", v227)
                v229.Color = v49[v50].Stroke
                v229.Thickness = 1
                v229.Transparency = 0.5
                v52.Track(v229, "Color", function() return v49[v50].Stroke end)

                local v76 = Instance.new("TextLabel", v227)
                v76.Size = UDim2.new(1, -70, 0, 44)
                v76.Position = UDim2.new(0, 14, 0, 0)
                v76.BackgroundTransparency = 1
                v76.Font = Enum.Font.GothamMedium
                v76.Text = v225
                v76.TextColor3 = v49[v50].Text
                v76.TextSize = 13
                v76.TextXAlignment = Enum.TextXAlignment.Left
                v52.Track(v76, "TextColor3", function() return v49[v50].Text end)

                local v269 = Instance.new("ImageLabel", v227)
                v269.Size = UDim2.new(0, 16, 0, 16)
                v269.Position = UDim2.new(1, -30, 0, 14)
                v269.BackgroundTransparency = 1
                v269.Image = v30("chevron-down")
                v269.ImageColor3 = v49[v50].SubText
                v52.Track(v269, "ImageColor3", function() return v49[v50].SubText end)

                local v270 = Instance.new("Frame", v227)
                v270.Size = UDim2.new(1, -28, 0, #v266 * 28)
                v270.Position = UDim2.new(0, 14, 0, 44)
                v270.BackgroundTransparency = 1

                local v271 = Instance.new("UIListLayout", v270)
                v271.SortOrder = Enum.SortOrder.LayoutOrder
                v271.Padding = UDim.new(0, 2)

                local v272 = false

                local function v273()
                    for v26, v274 in ipairs(v270:GetChildren()) do
                        if v274:IsA("TextButton") then v274:Destroy() end
                    end
                    for v64, v275 in ipairs(v266) do
                        local v276 = Instance.new("TextButton", v270)
                        v276.Size = UDim2.new(1, 0, 0, 26)
                        v276.BackgroundColor3 = v49[v50].Tertiary
                        v276.BackgroundTransparency = 0.5
                        v276.AutoButtonColor = false
                        v276.Font = Enum.Font.Gotham
                        v276.Text = "  " .. tostring(v275)
                        v276.TextSize = 12
                        v276.TextXAlignment = Enum.TextXAlignment.Left
                        v276.LayoutOrder = v64

                        local v277 = (v267 and table.find(v268, v275)) or (not v267 and v268 == v275)
                        v276.TextColor3 = v277 and v49[v50].Accent or v49[v50].Text
                        v52.Track(v276, "BackgroundColor3", function() return v49[v50].Tertiary end)

                        local v278 = Instance.new("UICorner", v276)
                        v278.CornerRadius = UDim.new(0, 4)

                        v276.MouseButton1Click:Connect(function()
                            v47(v43)
                            if v267 then
                                local v279 = table.find(v268, v275)
                                if v279 then
                                    table.remove(v268, v279)
                                else
                                    table.insert(v268, v275)
                                end
                                pcall(v226, v268)
                            else
                                v268 = v275
                                v272 = false
                                v3:Create(v227, TweenInfo.new(0.2), { Size = UDim2.new(1, 0, 0, 44) }):Play()
                                v3:Create(v269, TweenInfo.new(0.2), { Rotation = 0 }):Play()
                                pcall(v226, v268)
                            end
                            v273()
                        end)
                    end
                end

                v273()

                local v280 = Instance.new("TextButton", v227)
                v280.Size = UDim2.new(1, 0, 0, 44)
                v280.BackgroundTransparency = 1
                v280.Text = ""

                v280.MouseButton1Click:Connect(function()
                    v272 = not v272
                    local v281 = v272 and (44 + #v266 * 28 + 8) or 44
                    v3:Create(v227, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(1, 0, 0, v281) }):Play()
                    v3:Create(v269, TweenInfo.new(0.2), { Rotation = v272 and 180 or 0 }):Play()
                end)

                return {
                    Set = function(v56)
                        v268 = v56
                        v273()
                        pcall(v226, v268)
                    end,
                    Get = function() return v268 end,
                }
            end

            function v222:CreateThemePicker(v282)
                v282 = v282 or {}
                local v283 = v282.Themes or {
                    "Default", "Midnight", "Crimson", "Toxic", "Sunset", "Blossom",
                    "Carbon", "Matrix", "Coral", "RGB", "Galaxy", "Aurora", "Lava",
                    "Bubblegum", "Acid", "Prism", "Vaporwave", "Citrus", "Frost",
                    "Mint", "Spectrum", "Ember", "Ocean", "Neon", "Cyber",
                    "Synthwave", "Nebula", "Lemon", "Candy", "Sunset Drive"
                }
                local v284 = v282.Default or "Default"
                local v285 = v282.HoverCallback or function() end
                local v286 = v282.LeaveCallback or function() end
                local v287 = v282.Callback or function() end

                local v227 = Instance.new("Frame", v213)
                v227.Size = UDim2.new(1, 0, 0, 44)
                v227.BackgroundColor3 = v49[v50].Secondary
                v227.BorderSizePixel = 0
                v227.ClipsDescendants = true
                v227.LayoutOrder = v220()
                v52.Track(v227, "BackgroundColor3", function() return v49[v50].Secondary end)

                local v228 = Instance.new("UICorner", v227)
                v228.CornerRadius = UDim.new(0, 8)

                local v229 = Instance.new("UIStroke", v227)
                v229.Color = v49[v50].Stroke
                v229.Thickness = 1
                v229.Transparency = 0.5
                v52.Track(v229, "Color", function() return v49[v50].Stroke end)

                local v76 = Instance.new("TextLabel", v227)
                v76.Size = UDim2.new(1, -70, 0, 44)
                v76.Position = UDim2.new(0, 14, 0, 0)
                v76.BackgroundTransparency = 1
                v76.Font = Enum.Font.GothamMedium
                v76.Text = "Theme: " .. v284
                v76.TextColor3 = v49[v50].Text
                v76.TextSize = 13
                v76.TextXAlignment = Enum.TextXAlignment.Left
                v52.Track(v76, "TextColor3", function() return v49[v50].Text end)

                local v269 = Instance.new("ImageLabel", v227)
                v269.Size = UDim2.new(0, 16, 0, 16)
                v269.Position = UDim2.new(1, -30, 0, 14)
                v269.BackgroundTransparency = 1
                v269.Image = v30("chevron-down")
                v269.ImageColor3 = v49[v50].SubText
                v52.Track(v269, "ImageColor3", function() return v49[v50].SubText end)

                local v288 = Instance.new("ScrollingFrame", v227)
                v288.Size = UDim2.new(1, -28, 0, 160)
                v288.Position = UDim2.new(0, 14, 0, 44)
                v288.BackgroundTransparency = 1
                v288.ScrollBarThickness = 3
                v288.ScrollBarImageColor3 = v49[v50].Stroke
                v288.CanvasSize = UDim2.new(0, 0, 0, #v283 * 28)

                local v289 = Instance.new("UIListLayout", v288)
                v289.SortOrder = Enum.SortOrder.LayoutOrder
                v289.Padding = UDim.new(0, 2)

                local v272 = false

                for v64, v290 in ipairs(v283) do
                    local v291 = Instance.new("TextButton", v288)
                    v291.Size = UDim2.new(1, -6, 0, 26)
                    v291.BackgroundColor3 = v49[v50].Tertiary
                    v291.BackgroundTransparency = 0.5
                    v291.AutoButtonColor = false
                    v291.Font = Enum.Font.Gotham
                    v291.Text = "  " .. v290
                    v291.TextColor3 = (v290 == v284) and v49[v50].Accent or v49[v50].Text
                    v291.TextSize = 12
                    v291.TextXAlignment = Enum.TextXAlignment.Left
                    v291.LayoutOrder = v64

                    local v292 = Instance.new("UICorner", v291)
                    v292.CornerRadius = UDim.new(0, 4)

                    v291.MouseEnter:Connect(function()
                        v52.ApplyTheme(v290)
                        pcall(v285, v290)
                    end)

                    v291.MouseLeave:Connect(function()
                        v52.ApplyTheme(v284)
                        pcall(v286)
                    end)

                    v291.MouseButton1Click:Connect(function()
                        v47(v43)
                        v284 = v290
                        v76.Text = "Theme: " .. v284
                        v52.ApplyTheme(v284)
                        v272 = false
                        v3:Create(v227, TweenInfo.new(0.2), { Size = UDim2.new(1, 0, 0, 44) }):Play()
                        v3:Create(v269, TweenInfo.new(0.2), { Rotation = 0 }):Play()
                        pcall(v287, v284)
                    end)
                end

                local v280 = Instance.new("TextButton", v227)
                v280.Size = UDim2.new(1, 0, 0, 44)
                v280.BackgroundTransparency = 1
                v280.Text = ""

                v280.MouseButton1Click:Connect(function()
                    v272 = not v272
                    local v281 = v272 and 212 or 44
                    v3:Create(v227, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(1, 0, 0, v281) }):Play()
                    v3:Create(v269, TweenInfo.new(0.2), { Rotation = v272 and 180 or 0 }):Play()
                end)

                return {
                    Set = function(v290)
                        v284 = v290
                        v76.Text = "Theme: " .. v284
                        v52.ApplyTheme(v284)
                        pcall(v287, v284)
                    end,
                    Get = function() return v284 end,
                }
            end

            function v222:CreateInput(v293)
                v293 = v293 or {}
                local v225 = v293.Title or "Input"
                local v294 = v293.Placeholder or "Type here..."
                local v295 = v293.Default or ""
                local v226 = v293.Callback or function() end

                local v227 = Instance.new("Frame", v213)
                v227.Size = UDim2.new(1, 0, 0, 44)
                v227.BackgroundColor3 = v49[v50].Secondary
                v227.BorderSizePixel = 0
                v227.LayoutOrder = v220()
                v52.Track(v227, "BackgroundColor3", function() return v49[v50].Secondary end)

                local v228 = Instance.new("UICorner", v227)
                v228.CornerRadius = UDim.new(0, 8)

                local v229 = Instance.new("UIStroke", v227)
                v229.Color = v49[v50].Stroke
                v229.Thickness = 1
                v229.Transparency = 0.5
                v52.Track(v229, "Color", function() return v49[v50].Stroke end)

                local v76 = Instance.new("TextLabel", v227)
                v76.Size = UDim2.new(0.4, -14, 1, 0)
                v76.Position = UDim2.new(0, 14, 0, 0)
                v76.BackgroundTransparency = 1
                v76.Font = Enum.Font.GothamMedium
                v76.Text = v225
                v76.TextColor3 = v49[v50].Text
                v76.TextSize = 13
                v76.TextXAlignment = Enum.TextXAlignment.Left
                v52.Track(v76, "TextColor3", function() return v49[v50].Text end)

                local v296 = Instance.new("TextBox", v227)
                v296.Size = UDim2.new(0.6, -20, 0, 28)
                v296.Position = UDim2.new(0.4, 6, 0.5, -14)
                v296.BackgroundColor3 = v49[v50].Tertiary
                v296.BorderSizePixel = 0
                v296.Font = Enum.Font.Gotham
                v296.PlaceholderText = v294
                v296.PlaceholderColor3 = v49[v50].SubText
                v296.Text = v295
                v296.TextColor3 = v49[v50].Text
                v296.TextSize = 12
                v296.ClearTextOnFocus = false
                v52.Track(v296, "BackgroundColor3", function() return v49[v50].Tertiary end)
                v52.Track(v296, "TextColor3", function() return v49[v50].Text end)
                v52.Track(v296, "PlaceholderColor3", function() return v49[v50].SubText end)

                local v292 = Instance.new("UICorner", v296)
                v292.CornerRadius = UDim.new(0, 6)

                v296.FocusLost:Connect(function(v297)
                    pcall(v226, v296.Text, v297)
                end)

                return {
                    Set = function(v80) v296.Text = v80 end,
                    Get = function() return v296.Text end,
                }
            end

            function v222:CreateKeybind(v298)
                v298 = v298 or {}
                local v225 = v298.Title or "Keybind"
                local v299 = v298.Default or Enum.KeyCode.Unknown
                local v226 = v298.Callback or function() end

                local v227 = Instance.new("Frame", v213)
                v227.Size = UDim2.new(1, 0, 0, 44)
                v227.BackgroundColor3 = v49[v50].Secondary
                v227.BorderSizePixel = 0
                v227.LayoutOrder = v220()
                v52.Track(v227, "BackgroundColor3", function() return v49[v50].Secondary end)

                local v228 = Instance.new("UICorner", v227)
                v228.CornerRadius = UDim.new(0, 8)

                local v229 = Instance.new("UIStroke", v227)
                v229.Color = v49[v50].Stroke
                v229.Thickness = 1
                v229.Transparency = 0.5
                v52.Track(v229, "Color", function() return v49[v50].Stroke end)

                local v76 = Instance.new("TextLabel", v227)
                v76.Size = UDim2.new(1, -110, 1, 0)
                v76.Position = UDim2.new(0, 14, 0, 0)
                v76.BackgroundTransparency = 1
                v76.Font = Enum.Font.GothamMedium
                v76.Text = v225
                v76.TextColor3 = v49[v50].Text
                v76.TextSize = 13
                v76.TextXAlignment = Enum.TextXAlignment.Left
                v52.Track(v76, "TextColor3", function() return v49[v50].Text end)

                local v300 = Instance.new("TextButton", v227)
                v300.Size = UDim2.new(0, 86, 0, 28)
                v300.Position = UDim2.new(1, -100, 0.5, -14)
                v300.BackgroundColor3 = v49[v50].Tertiary
                v300.AutoButtonColor = false
                v300.Font = Enum.Font.Gotham
                v300.Text = v299.Name or "None"
                v300.TextColor3 = v49[v50].Accent
                v300.TextSize = 12
                v52.Track(v300, "BackgroundColor3", function() return v49[v50].Tertiary end)
                v52.Track(v300, "TextColor3", function() return v49[v50].Accent end)

                local v301 = Instance.new("UICorner", v300)
                v301.CornerRadius = UDim.new(0, 6)

                local v302 = false

                v300.MouseButton1Click:Connect(function()
                    v47(v43)
                    v302 = true
                    v300.Text = "..."
                end)

                v2.InputBegan:Connect(function(v82, v204)
                    if v302 and v82.UserInputType == Enum.UserInputType.Keyboard then
                        v302 = false
                        v299 = v82.KeyCode
                        v300.Text = v299.Name
                        pcall(v226, v299)
                    end
                end)

                return {
                    Set = function(v303) v299 = v303; v300.Text = v303.Name end,
                    Get = function() return v299 end,
                }
            end

            return v222
        end

        return v219
    end

    return v205
end

v96(function()
    local v304 = v83.CreateWindow({
        Subtitle = "v1.0.0",
        DiscordLink = "https://discord.gg/Mtv33tEqbR",
        Icon = "layout-dashboard"
    })

    local v305 = v304:CreateTab("Home", "home")
    local v306 = v305:CreateSection("Welcome")
    v306:CreateLabel("This is an example interface built with the SkidX UI library.")

    v306:CreateButton({
        Title = "Example Button",
        Callback = function()
            v83.Notify({
                Title = "Button Pressed",
                Description = "This is a test notification.",
                Duration = 3
            })
        end
    })

    local v307 = v305:CreateSection("Toggles")
    v307:CreateToggle({
        Title = "Example Toggle",
        Default = false,
        Callback = function(v56)
        end
    })

    local v308 = v304:CreateTab("Settings", "settings-2")
    local v309 = v308:CreateSection("Appearance")

    v309:CreateThemePicker({
        Themes = {
            "Default", "Midnight", "Crimson", "Toxic", "Sunset", "Blossom",
            "Carbon", "Matrix", "Coral", "RGB", "Galaxy", "Aurora", "Lava",
            "Bubblegum", "Acid", "Prism", "Vaporwave", "Citrus", "Frost",
            "Mint", "Spectrum", "Ember", "Ocean", "Neon", "Cyber",
            "Synthwave", "Nebula", "Lemon", "Candy", "Sunset Drive"
        },
        Default = "Default",
        HoverCallback = function(v310)
            v52.ApplyTheme(v310)
        end,
        LeaveCallback = function()
            v52.ApplyTheme(v50)
        end,
        Callback = function(v310)
            v50 = v310
            v52.ApplyTheme(v310)
        end
    })

    local v311 = v308:CreateSection("General")
    v311:CreateSlider({
        Title = "Example Slider",
        Min = 0,
        Max = 100,
        Default = 50,
        Increment = 1,
        Callback = function(v56)
        end
    })

    v311:CreateKeybind({
        Title = "Example Keybind",
        Default = Enum.KeyCode.RightShift,
        Callback = function(v312)
        end
    })

    local v313 = v304:CreateTab("Player", "user")
    local v314 = v313:CreateSection("Profile")
    v314:CreateInput({
        Title = "Example Input",
        Placeholder = "Type here...",
        Callback = function(v223)
        end
    })

    local v315 = v304:CreateTab("About", "info")
    local v316 = v315:CreateSection("Information")
    v316:CreateLabel("SkidX UI Library")
    v316:CreateLabel("A modern, dynamically themed interface library for Roblox.")

    v83.Notify({
        Title = "Interface Loaded",
        Description = "Press RightControl to toggle visibility.",
        Duration = 4
    })
end)
