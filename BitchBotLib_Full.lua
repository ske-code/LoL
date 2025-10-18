--getgenv().BitchBotLib = (function()
--[[
local v1={}

v1.__index=v1

local v2=game:GetService("Players").LocalPlayer

local v3=game:GetService("UserInputService")

local v4=game:GetService("TweenService")

local v5=game:GetService("RunService")

local vc=function()

local v6="Font_"..tostring(math.random(10000,99999))

local v7="Folder_"..tostring(math.random(10000,99999))

if isfolder("UI_Fonts")then delfolder("UI_Fonts")end

makefolder(v7)

local v8=v7.."/"..v6..".ttf"

local v9=v7.."/"..v6..".json"

local v10=v7.."/"..v6..".rbxmx"

if not isfile(v8)then

local v11=pcall(function()

local v12=request({Url="https://raw.githubusercontent.com/bluescan/proggyfonts/refs/heads/master/ProggyOriginal/ProggyClean.ttf",Method="GET"})

if v12 and v12.Success then writefile(v8,v12.Body)return true end

return false

end)

if not v11 then return Font.fromEnum(Enum.Font.Code)end

end

local v13=pcall(function()

local v14=readfile(v8)

local v15=game:GetService("TextService"):RegisterFontFaceAsync(v14,v6)

return v15

end)

if v13 then return v13 end

local v16=pcall(function()return Font.fromFilename(v8)end)

if v16 then return v16 end

local v17={name=v6,faces={{name="Regular",weight=400,style="Normal",assetId=getcustomasset(v8)}}}

writefile(v9,game:GetService("HttpService"):JSONEncode(v17))

local v18,v19=pcall(function()return Font.new(getcustomasset(v9))end)

if v18 then return v19 end

local v20=[[

<?xml version="1.0" encoding="utf-8"?>

<roblox xmlns:xmime="http://www.w3.org/2005/05/xmlmime" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://www.roblox.com/roblox.xsd" version="4">

<External>null</External>

<External>nil</External>

<Item class="FontFace" referent="RBX0">

<Properties>

<Content name="FontData">

<url>rbxasset://..v8..</url>

</Content>

<string name="Family">..v6..</string>

<token name="Style">0</token>

<token name="Weight">400</token>

</Properties>

</Item>

</roblox>]]

writefile(v10,v20)

return Font.fromEnum(Enum.Font.Code)

end

local v21=vc()
--]]
--[[
function v1.new(v22)

local v23=setmetatable({},v1)

v23.name=v22 or "Library"

v23.open=true

v23.tabs={}

v23.currentTab=nil

v23.leftSections={}

v23.rightSections={}

v23.main=Instance.new("ScreenGui")

v23.main.Name="BitchBotLib"

v23.main.Parent = game:GetService("CoreGui")

v23.mainFrame=Instance.new("Frame")

v23.mainFrame.Size=UDim2.new(0,600,0,705)

v23.mainFrame.Position=UDim2.new(0.5,-250,0.5,-200)

v23.mainFrame.BackgroundColor3=Color3.fromRGB(25,25,35)

v23.mainFrame.BorderSizePixel=1

v23.mainFrame.BorderColor3=Color3.fromRGB(60,60,70)

v23.mainFrame.ClipsDescendants=true

v23.mainFrame.Parent=v23.main

local v24=Instance.new("Frame")

v24.Size=UDim2.new(1,-4,1,-4)

v24.Position=UDim2.new(0,2,0,2)

v24.BackgroundColor3=Color3.fromRGB(30,30,40)

v24.BorderSizePixel=0

v24.Parent=v23.mainFrame

v23.titleBar=Instance.new("Frame")

v23.titleBar.Size=UDim2.new(1,0,0,30)

v23.titleBar.BackgroundColor3=Color3.fromRGB(20,20,30)

v23.titleBar.BorderSizePixel=1

v23.titleBar.BorderColor3=Color3.fromRGB(60,60,70)

v23.titleBar.Parent=v24

local topLine=Instance.new("Frame")

topLine.Size=UDim2.new(1,0,0,2)

topLine.Position=UDim2.new(0,0,0,0)

topLine.BackgroundColor3=Color3.fromRGB(255,105,180)

topLine.BorderSizePixel=0

topLine.Parent=v23.titleBar

v23.title=Instance.new("TextLabel")

v23.title.Size=UDim2.new(1,-10,1,0)

v23.title.Position=UDim2.new(0,10,0,0)

v23.title.BackgroundTransparency=1

v23.title.Text=v23.name

v23.title.TextColor3=Color3.new(1,1,1)

v23.title.TextSize=14

v23.title.FontFace=v21

v23.title.TextXAlignment=Enum.TextXAlignment.Left

v23.title.Parent=v23.titleBar

v23.tabContainer=Instance.new("Frame")

v23.tabContainer.Size=UDim2.new(1,0,0,30)

v23.tabContainer.BackgroundColor3=Color3.fromRGB(25,25,35)

v23.tabContainer.BorderSizePixel=1

v23.tabContainer.BorderColor3=Color3.fromRGB(60,60,70)

v23.tabContainer.Parent=v24

v23.contentFrame=Instance.new("Frame")

v23.contentFrame.Size=UDim2.new(1,-20,1,-70)

v23.contentFrame.Position=UDim2.new(0,10,0,60)

v23.contentFrame.BackgroundTransparency=1

v23.contentFrame.ClipsDescendants=true

v23.contentFrame.Parent=v24


v23.watermarkFrame = Instance.new("Frame")

v23.watermarkFrame.Size = UDim2.new(0, 0, 0, 25)

v23.watermarkFrame.Position = UDim2.new(0, 10, 0, 10)

v23.watermarkFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

v23.watermarkFrame.BorderSizePixel = 0

v23.watermarkFrame.ClipsDescendants = true

v23.watermarkFrame.Visible = false

v23.watermarkFrame.Parent = v23.main

local watermarkLine = Instance.new("Frame")

watermarkLine.Size = UDim2.new(1, 0, 0, 2)

watermarkLine.Position = UDim2.new(0, 0, 0, 0)

watermarkLine.BackgroundColor3 = Color3.fromRGB(255, 105, 180)

watermarkLine.BorderSizePixel = 0

watermarkLine.Parent = v23.watermarkFrame

v23.watermarkText = Instance.new("TextLabel")

v23.watermarkText.Size = UDim2.new(1, -10, 1, 0)

v23.watermarkText.Position = UDim2.new(0, 5, 0, 0)

v23.watermarkText.BackgroundTransparency = 1

v23.watermarkText.Text = "BitchBotLib | " .. v23.name

v23.watermarkText.TextColor3 = Color3.new(1, 1, 1)

v23.watermarkText.TextSize = 12

v23.watermarkText.FontFace = v21

v23.watermarkText.TextXAlignment = Enum.TextXAlignment.Left

v23.watermarkText.Parent = v23.watermarkFrame

function v23:SetWatermark(v24)

    v23.watermarkText.Text = v24

    local textSize = v23.watermarkText.TextBounds

    v23.watermarkFrame.Size = UDim2.new(0, textSize.X + 30, 0, 25)

end

function v23:ToggleWatermark(v26)

    v23.watermarkFrame.Visible = v26

end
v23.toggleButton = Instance.new("TextButton")
v23.toggleButton.Size = UDim2.new(0, 80, 0, 25)
v23.toggleButton.Position = UDim2.new(0, 10, 0, 40)
v23.toggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
v23.toggleButton.BorderSizePixel = 0
v23.toggleButton.Text = "Toggle UI"
v23.toggleButton.TextColor3 = Color3.new(1, 1, 1)
v23.toggleButton.TextSize = 12
v23.toggleButton.FontFace = v21
v23.toggleButton.Parent = v23.main

local toggleLine = Instance.new("Frame")
toggleLine.Size = UDim2.new(1, 0, 0, 2)
toggleLine.Position = UDim2.new(0, 0, 0, 0)
toggleLine.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
toggleLine.BorderSizePixel = 0
toggleLine.Parent = v23.toggleButton

v23.toggleButton.MouseButton1Click:Connect(function()
    v23.mainFrame.Visible = not v23.mainFrame.Visible
end)

v23.leftContainer=Instance.new("ScrollingFrame")

v23.leftContainer.Size=UDim2.new(0.5,-5,1,0)

v23.leftContainer.Position=UDim2.new(0,0,0,0)

v23.leftContainer.BackgroundTransparency=1

v23.leftContainer.ScrollBarThickness=4

v23.leftContainer.ScrollBarImageColor3=Color3.fromRGB(255,105,180)

v23.leftContainer.CanvasSize=UDim2.new(0,0,0,0)

v23.leftContainer.Parent=v23.contentFrame

v23.rightContainer=Instance.new("ScrollingFrame")

v23.rightContainer.Size=UDim2.new(0.5,-5,1,0)

v23.rightContainer.Position=UDim2.new(0.5,5,0,0)

v23.rightContainer.BackgroundTransparency=1

v23.rightContainer.ScrollBarThickness=4

v23.rightContainer.ScrollBarImageColor3=Color3.fromRGB(255,105,180)

v23.rightContainer.CanvasSize=UDim2.new(0,0,0,0)

v23.rightContainer.Parent=v23.contentFrame

local v25=false

local v26

local v27

local function updateDrag(v28)

if v25 then

local v29=v28.Position-v26

v23.mainFrame.Position=UDim2.new(v27.X.Scale,v27.X.Offset+v29.X,v27.Y.Scale,v27.Y.Offset+v29.Y)

end

end

v23.titleBar.InputBegan:Connect(function(v30)

if v30.UserInputType==Enum.UserInputType.MouseButton1 or v30.UserInputType==Enum.UserInputType.Touch then

v25=true

v26=v30.Position

v27=v23.mainFrame.Position

end

end)

v23.titleBar.InputEnded:Connect(function(v31)

if v31.UserInputType==Enum.UserInputType.MouseButton1 or v31.UserInputType==Enum.UserInputType.Touch then

v25=false

end

end)

v3.InputChanged:Connect(function(v32)

if v32.UserInputType==Enum.UserInputType.MouseMovement or v32.UserInputType==Enum.UserInputType.Touch then

updateDrag(v32)

end

end)

return v23

end

function v1:Tab(v33)

local v34={}

v34.name=v33

v34.leftSections={}

v34.rightSections={}

v34.button=Instance.new("TextButton")

v34.button.Size=UDim2.new(0,80,1,0)

v34.button.Position=UDim2.new(0,#self.tabs*80,0,0)

v34.button.BackgroundColor3=Color3.fromRGB(35,35,45)

v34.button.BorderSizePixel=1

v34.button.BorderColor3=Color3.fromRGB(60,60,70)

v34.button.Text=v33

v34.button.TextColor3=Color3.new(1,1,1)

v34.button.TextSize=12

v34.button.FontFace=v21

v34.button.Parent=self.tabContainer

v34.content=Instance.new("Frame")

v34.content.Size=UDim2.new(1,0,1,0)

v34.content.BackgroundTransparency=1

v34.content.Visible=false

v34.content.Parent=self.contentFrame

v34.leftContainer=Instance.new("ScrollingFrame")

v34.leftContainer.Size=UDim2.new(0.5,-5,1,0)

v34.leftContainer.Position=UDim2.new(0,0,0,0)

v34.leftContainer.BackgroundTransparency=1

v34.leftContainer.ScrollBarThickness=4

v34.leftContainer.ScrollBarImageColor3=Color3.fromRGB(255,105,180)

v34.leftContainer.CanvasSize=UDim2.new(0,0,0,0)

v34.leftContainer.Parent=v34.content

v34.rightContainer=Instance.new("ScrollingFrame")

v34.rightContainer.Size=UDim2.new(0.5,-5,1,0)

v34.rightContainer.Position=UDim2.new(0.5,5,0,0)

v34.rightContainer.BackgroundTransparency=1

v34.rightContainer.ScrollBarThickness=4

v34.rightContainer.ScrollBarImageColor3=Color3.fromRGB(255,105,180)

v34.rightContainer.CanvasSize=UDim2.new(0,0,0,0)

v34.rightContainer.Parent=v34.content

v34.button.MouseButton1Click:Connect(function()

for v35,v36 in pairs(self.tabs)do

v36.content.Visible=false

v36.button.BackgroundColor3=Color3.fromRGB(35,35,45)

end

v34.content.Visible=true

v34.button.BackgroundColor3=Color3.fromRGB(255,105,180)

self.currentTab=v34

end)

table.insert(self.tabs,v34)

if#self.tabs==1 then

v34.button.BackgroundColor3=Color3.fromRGB(255,105,180)

v34.content.Visible=true

self.currentTab=v34

end

function v34:UpdateContainer(v37)

local v38=0

for v39,v40 in pairs(v37:GetChildren())do

if v40:IsA("Frame")then

v40.Position=UDim2.new(0,0,0,v38)

v38=v38+v40.AbsoluteSize.Y+10

end

end

v37.CanvasSize=UDim2.new(0,0,0,v38)

end

function v34:Section(v41,v42)

local v43={}

v43.name=v41

v43.side=v42 or "left"

local v44=v43.side=="left"and v34.leftContainer or v34.rightContainer

v43.frame=Instance.new("Frame")

v43.frame.Size=UDim2.new(1,0,0,150)

v43.frame.BackgroundColor3=Color3.fromRGB(30,30,40)

v43.frame.BorderSizePixel=1

v43.frame.BorderColor3=Color3.fromRGB(60,60,70)

v43.frame.Parent=v44

local sectionTopLine=Instance.new("Frame")

sectionTopLine.Size=UDim2.new(1,0,0,2)

sectionTopLine.Position=UDim2.new(0,0,0,0)

sectionTopLine.BackgroundColor3=Color3.fromRGB(255,105,180)

sectionTopLine.BorderSizePixel=0

sectionTopLine.Parent=v43.frame

v43.title=Instance.new("TextLabel")

v43.title.Size=UDim2.new(1,-10,0,20)

v43.title.Position=UDim2.new(0,10,0,5)

v43.title.BackgroundTransparency=1

v43.title.Text=v41

v43.title.TextColor3=Color3.new(1,1,1)

v43.title.TextSize=12

v43.title.FontFace=v21

v43.title.TextXAlignment=Enum.TextXAlignment.Left

v43.title.Parent=v43.frame

v43.content=Instance.new("Frame")

v43.content.Size=UDim2.new(1,-20,1,-30)

v43.content.Position=UDim2.new(0,10,0,25)

v43.content.BackgroundTransparency=1

v43.content.Parent=v43.frame

function v43:UpdateLayout()
    v45 = 0
    for v46, v47 in pairs(v43.content:GetChildren()) do
        if v47:IsA("Frame") then
            v47.Position = UDim2.new(0, 0, 0, v45)
            v45 = v45 + v47.AbsoluteSize.Y + 5
        end
    end
    local newHeight = math.max(150, v45 + 30)
    v43.frame.Size = UDim2.new(1, 0, 0, newHeight)
    v34:UpdateContainer(v44)
end

if v43.side=="left"then

table.insert(v34.leftSections,v43)

else

table.insert(v34.rightSections,v43)

end
function v43:Slider(v48, v49, v50, v51, v52)
    local v53 = Instance.new("Frame")
    v53.Size = UDim2.new(1, 0, 0, 40)
    v53.BackgroundTransparency = 1
    v53.Parent = v43.content

    local v54 = Instance.new("TextLabel")
    v54.Size = UDim2.new(1, 0, 0, 15)
    v54.BackgroundTransparency = 1
    v54.Text = v48
    v54.TextColor3 = Color3.new(1, 1, 1)
    v54.TextSize = 12
    v54.FontFace = v21
    v54.TextXAlignment = Enum.TextXAlignment.Left
    v54.Parent = v53

    local v55 = Instance.new("Frame")
    v55.Size = UDim2.new(1, 0, 0, 15)
    v55.Position = UDim2.new(0, 0, 0, 20)
    v55.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    v55.BorderSizePixel = 1
    v55.BorderColor3 = Color3.fromRGB(60, 60, 70)
    v55.Parent = v53

    local v56 = Instance.new("Frame")
    v56.Size = UDim2.new((v51 - v49) / (v50 - v49), 0, 1, 0)
    v56.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
    v56.BorderSizePixel = 0
    v56.Parent = v55

    local v57 = Instance.new("TextLabel")
    v57.Size = UDim2.new(1, 0, 1, 0)
    v57.BackgroundTransparency = 1
    v57.Text = tostring(v51)
    v57.TextColor3 = Color3.new(1, 1, 1)
    v57.TextSize = 12
    v57.FontFace = v21
    v57.TextXAlignment = Enum.TextXAlignment.Center
    v57.Parent = v55

    local v58 = false
    local v59 = v51 or v49

    local function v60(input)
        local mouse = v3:GetMouseLocation()
        local absoluteX = mouse.X
        local relative = math.clamp((absoluteX - v55.AbsolutePosition.X) / v55.AbsoluteSize.X, 0, 1)
        v59 = math.floor(v49 + (v50 - v49) * relative)
        v56.Size = UDim2.new(relative, 0, 1, 0)
        v57.Text = tostring(v59)
        if v52 then v52(v59) end
    end

    v55.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            v58 = true
            v60(input)
        end
    end)

    v55.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            v58 = false
        end
    end)

    v3.InputChanged:Connect(function(input)
        if v58 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            v60(input)
        end
    end)

    v43:UpdateLayout()
    local v66 = {}
    function v66:Set(v67)
        local relative = (v67 - v49) / (v50 - v49)
        v59 = v67
        v56.Size = UDim2.new(relative, 0, 1, 0)
        v57.Text = tostring(v67)
        if v52 then v52(v67) end
    end
    return v66
end

function v43:Dropdown(v68, v69, v70)
    local v71 = Instance.new("Frame")
    v71.Size = UDim2.new(1, 0, 0, 30)
    v71.BackgroundTransparency = 1
    v71.Parent = v43.content

    local v72 = Instance.new("TextButton")
    v72.Size = UDim2.new(1, 0, 1, 0)
    v72.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    v72.BorderSizePixel = 1
    v72.BorderColor3 = Color3.fromRGB(60, 60, 70)
    v72.Text = v68
    v72.TextColor3 = Color3.new(1, 1, 1)
    v72.TextSize = 12
    v72.FontFace = v21
    v72.Parent = v71

    local v73 = Instance.new("Frame")
    v73.Size = UDim2.new(1, 0, 0, #v69 * 25)
    v73.Position = UDim2.new(0, 0, 1, 2)
    v73.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    v73.BorderSizePixel = 1
    v73.BorderColor3 = Color3.fromRGB(60, 60, 70)
    v73.Visible = false
    v73.ZIndex = 10
    v73.Parent = v71

    for v74, v75 in ipairs(v69) do
        local v76 = Instance.new("TextButton")
        v76.Size = UDim2.new(1, 0, 0, 25)
        v76.Position = UDim2.new(0, 0, 0, (v74 - 1) * 25)
        v76.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        v76.BorderSizePixel = 0
        v76.Text = v75
        v76.TextColor3 = Color3.new(1, 1, 1)
        v76.TextSize = 12
        v76.FontFace = v21
        v76.Parent = v73

        v76.MouseButton1Click:Connect(function()
            v72.Text = v68 .. ": " .. v75
            v73.Visible = false
            if v70 then v70(v75) end
        end)
        
        v76.TouchTap:Connect(function()
            v72.Text = v68 .. ": " .. v75
            v73.Visible = false
            if v70 then v70(v75) end
        end)
    end

    v72.MouseButton1Click:Connect(function()
        v73.Visible = not v73.Visible
    end)
    
    v3.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            if v73.Visible and not v72:IsDescendantOf(input.Target) and not v73:IsDescendantOf(input.Target) then
                v73.Visible = false
            end
        end
    end)

    v43:UpdateLayout()
end

function v43:ColorPicker(v77, v78, v79)
    local v80 = Instance.new("Frame")
    v80.Size = UDim2.new(1, 0, 0, 120)
    v80.BackgroundTransparency = 1
    v80.Parent = v43.content

    local v81 = Instance.new("TextLabel")
    v81.Size = UDim2.new(1, 0, 0, 15)
    v81.BackgroundTransparency = 1
    v81.Text = v77
    v81.TextColor3 = Color3.new(1, 1, 1)
    v81.TextSize = 12
    v81.FontFace = v21
    v81.TextXAlignment = Enum.TextXAlignment.Left
    v81.Parent = v80

    local colorDisplay = Instance.new("Frame")
    colorDisplay.Size = UDim2.new(1, 0, 0, 20)
    colorDisplay.Position = UDim2.new(0, 0, 0, 15)
    colorDisplay.BackgroundColor3 = v78
    colorDisplay.BorderSizePixel = 1
    colorDisplay.BorderColor3 = Color3.fromRGB(60, 60, 70)
    colorDisplay.Parent = v80

    local v82, v83, v84 = v78.R * 255, v78.G * 255, v78.B * 255

    local function v85()
        local v86 = Color3.fromRGB(v82, v83, v84)
        colorDisplay.BackgroundColor3 = v86
        if v79 then v79(v86) end
    end

    local function createColorSlider(v88, v89, v90, v91)
        local v92 = Instance.new("Frame")
        v92.Size = UDim2.new(1, 0, 0, 15)
        v92.Position = UDim2.new(0, 0, 0, v89)
        v92.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        v92.BorderSizePixel = 1
        v92.BorderColor3 = Color3.fromRGB(60, 60, 70)
        v92.Parent = v80

        local v93 = Instance.new("Frame")
        v93.Size = UDim2.new(v90 / 255, 0, 1, 0)
        v93.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
        v93.BorderSizePixel = 0
        v93.Parent = v92

        local v94 = Instance.new("TextLabel")
        v94.Size = UDim2.new(1, 0, 1, 0)
        v94.BackgroundTransparency = 1
        v94.Text = v88 .. ": " .. tostring(v90)
        v94.TextColor3 = Color3.new(1, 1, 1)
        v94.TextSize = 12
        v94.FontFace = v21
        v94.TextXAlignment = Enum.TextXAlignment.Center
        v94.Parent = v92

        local v95 = false

        local function v96(input)
            local mouse = v3:GetMouseLocation()
            local absoluteX = mouse.X
            local relative = math.clamp((absoluteX - v92.AbsolutePosition.X) / v92.AbsoluteSize.X, 0, 1)
            local value = math.floor(255 * relative)
            v93.Size = UDim2.new(relative, 0, 1, 0)
            v94.Text = v88 .. ": " .. tostring(value)
            v91(value)
        end

        v92.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                v95 = true
                v96(input)
            end
        end)

        v92.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                v95 = false
            end
        end)

        v3.InputChanged:Connect(function(input)
            if v95 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                v96(input)
            end
        end)
    end

    createColorSlider("R", 40, v82, function(value) v82 = value v85() end)
    createColorSlider("G", 65, v83, function(value) v83 = value v85() end)
    createColorSlider("B", 90, v84, function(value) v84 = value v85() end)

    v43:UpdateLayout()
end
function v43:Checkbox(v48,v49,v50)

    local v60=Instance.new("Frame")

    v60.Size=UDim2.new(1,0,0,20)

    v60.BackgroundTransparency=1

    v60.Parent=v43.content

    local v51=Instance.new("TextButton")

    v51.Size=UDim2.new(1,0,1,0)

    v51.BackgroundTransparency=1

    v51.Text=""

    v51.Parent=v60

    local v52=Instance.new("TextLabel")

    v52.Size=UDim2.new(1,-25,1,0)

    v52.Position=UDim2.new(0,0,0,0)

    v52.BackgroundTransparency=1

    v52.Text=v48

    v52.TextColor3=Color3.new(1,1,1)

    v52.TextSize=12

    v52.FontFace=v21

    v52.TextXAlignment=Enum.TextXAlignment.Left

    v52.Parent=v51

    local v53=Instance.new("Frame")

    v53.Size=UDim2.new(0,15,0,15)

    v53.Position=UDim2.new(1,-20,0.5,-7)

    v53.BackgroundColor3=Color3.fromRGB(25,25,35)

    v53.BorderSizePixel=1

    v53.BorderColor3=Color3.fromRGB(80,80,90)

    v53.Parent=v51

    local v54=Instance.new("Frame")

    v54.Size=UDim2.new(0,9,0,9)

    v54.Position=UDim2.new(0.5,-4,0.5,-4)

    v54.BackgroundColor3=Color3.fromRGB(255,105,180)

    v54.BorderSizePixel=0

    v54.Visible=v49 or false

    v54.Parent=v53

    local v55=v49 or false

    local function v56()

        v55=not v55

        v54.Visible=v55

        if v50 then

            v50(v55)

        end

    end

    v51.MouseButton1Click:Connect(v56)

    v43:UpdateLayout()

    local v57={}

    function v57:Set(v58)

        if v55~=v58 then

            v56()

        end

    end

    return v57

end


function v43:TextLabel(v59)

local v60=Instance.new("Frame")

v60.Size=UDim2.new(1,0,0,20)

v60.BackgroundTransparency=1

v60.Parent=v43.content

local v61=Instance.new("TextLabel")

v61.Size=UDim2.new(1,0,1,0)

v61.BackgroundTransparency=1

v61.Text=v59

v61.TextColor3=Color3.new(1,1,1)

v61.TextSize=12

v61.FontFace=v21

v61.TextXAlignment=Enum.TextXAlignment.Left

v61.Parent=v60

v43:UpdateLayout()

return v61

end

function v43:Textbox(v62,v63,v64)

local v65=Instance.new("Frame")

v65.Size=UDim2.new(1,0,0,25)

v65.BackgroundTransparency=1

v65.Parent=v43.content

local v66=Instance.new("TextBox")

v66.Size=UDim2.new(1,0,1,0)

v66.BackgroundColor3=Color3.fromRGB(35,35,45)

v66.BorderSizePixel=1

v66.BorderColor3=Color3.fromRGB(60,60,70)

v66.Text=v63 or ""

v66.PlaceholderText=v62

v66.TextColor3=Color3.new(1,1,1)

v66.TextSize=12

v66.FontFace=v21

v66.TextXAlignment=Enum.TextXAlignment.Left

v66.Parent=v65

local v67=Instance.new("UIPadding")

v67.PaddingLeft=UDim.new(0,5)

v67.Parent=v66

v66.FocusLost:Connect(function(v68)

if v68 and v64 then

v64(v66.Text)

end

end)

v43:UpdateLayout()

local v69={}

function v69:Set(v70)

v66.Text=v70

end

return v69

end

function v43:Button(v71,v72)

local v73=Instance.new("Frame")

v73.Size=UDim2.new(1,0,0,25)

v73.BackgroundTransparency=1

v73.Parent=v43.content

local v74=Instance.new("TextButton")

v74.Size=UDim2.new(1,0,1,0)

v74.BackgroundColor3=Color3.fromRGB(35,35,45)

v74.BorderSizePixel=1

v74.BorderColor3=Color3.fromRGB(60,60,70)

v74.Text=v71

v74.TextColor3=Color3.new(1,1,1)

v74.TextSize=12

v74.FontFace=v21

v74.Parent=v73

v74.MouseButton1Click:Connect(v72)

v43:UpdateLayout()

local v75={}

function v75:SetText(v76)

v74.Text=v76

end

return v75

end

return v43

end

return v34

end

return v1

end)()
--]]
--== Extended Components ==--

--[[
Additional UI Components for BitchBotLib
Slider, Dropdown, ColorPicker
--]]
--[[
function v43:Slider(name, min, max, default, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 40)
    frame.BackgroundTransparency = 1
    frame.Parent = v43.content

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 15)
    title.BackgroundTransparency = 1
    title.Text = name
    title.TextColor3 = Color3.new(1, 1, 1)
    title.TextSize = 12
    title.FontFace = v21
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = frame

    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(1, 0, 0, 15)
    bar.Position = UDim2.new(0, 0, 0, 20)
    bar.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    bar.BorderSizePixel = 1
    bar.BorderColor3 = Color3.fromRGB(60, 60, 70)
    bar.Parent = frame

    local fill = Instance.new("Frame")
    fill.Size = UDim2.new(0, 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
    fill.BorderSizePixel = 0
    fill.Parent = bar

    local valueLabel = Instance.new("TextLabel")
    valueLabel.Size = UDim2.new(1, 0, 1, 0)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Text = tostring(default)
    valueLabel.TextColor3 = Color3.new(1, 1, 1)
    valueLabel.TextSize = 12
    valueLabel.FontFace = v21
    valueLabel.TextXAlignment = Enum.TextXAlignment.Center
    valueLabel.Parent = bar

    local dragging = false
    local value = default or min

    local function updateValue(x)
        local rel = math.clamp((x - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
        value = math.floor(min + (max - min) * rel)
        fill.Size = UDim2.new(rel, 0, 1, 0)
        valueLabel.Text = tostring(value)
        if callback then callback(value) end
    end

    bar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            updateValue(input.Position.X)
        end
    end)

    bar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            updateValue(input.Position.X)
        end
    end)

    fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)

    v43:UpdateLayout()
    return { Set = function(_, val) updateValue(bar.AbsolutePosition.X + (bar.AbsoluteSize.X * ((val - min) / (max - min)))) end }
end

function v43:Dropdown(name, options, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 30)
    frame.BackgroundTransparency = 1
    frame.Parent = v43.content

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 1, 0)
    button.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    button.BorderSizePixel = 1
    button.BorderColor3 = Color3.fromRGB(60, 60, 70)
    button.Text = name
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextSize = 12
    button.FontFace = v21
    button.Parent = frame

    local dropdownFrame = Instance.new("Frame")
    dropdownFrame.Size = UDim2.new(1, 0, 0, #options * 25)
    dropdownFrame.Position = UDim2.new(0, 0, 1, 2)
    dropdownFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    dropdownFrame.BorderSizePixel = 1
    dropdownFrame.BorderColor3 = Color3.fromRGB(60, 60, 70)
    dropdownFrame.Visible = false
    dropdownFrame.ZIndex = 10
    dropdownFrame.Parent = frame

    for i, option in ipairs(options) do
        local opt = Instance.new("TextButton")
        opt.Size = UDim2.new(1, 0, 0, 25)
        opt.Position = UDim2.new(0, 0, 0, (i - 1) * 25)
        opt.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        opt.BorderSizePixel = 0
        opt.Text = option
        opt.TextColor3 = Color3.new(1, 1, 1)
        opt.TextSize = 12
        opt.FontFace = v21
        opt.Parent = dropdownFrame

        opt.MouseButton1Click:Connect(function()
            button.Text = name .. ": " .. option
            dropdownFrame.Visible = false
            if callback then callback(option) end
        end)
    end

    button.MouseButton1Click:Connect(function()
        dropdownFrame.Visible = not dropdownFrame.Visible
    end)

    v43:UpdateLayout()
end

function v43:ColorPicker(name, defaultColor, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 100)
    frame.BackgroundTransparency = 1
    frame.Parent = v43.content

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 15)
    title.BackgroundTransparency = 1
    title.Text = name
    title.TextColor3 = Color3.new(1, 1, 1)
    title.TextSize = 12
    title.FontFace = v21
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = frame

    local function createSlider(colorName, startY, defaultValue, onChange)
        local bar = Instance.new("Frame")
        bar.Size = UDim2.new(1, 0, 0, 15)
        bar.Position = UDim2.new(0, 0, 0, startY)
        bar.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        bar.BorderSizePixel = 1
        bar.BorderColor3 = Color3.fromRGB(60, 60, 70)
        bar.Parent = frame

        local fill = Instance.new("Frame")
        fill.Size = UDim2.new(defaultValue / 255, 0, 1, 0)
        fill.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
        fill.BorderSizePixel = 0
        fill.Parent = bar

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = colorName .. ": " .. tostring(defaultValue)
        label.TextColor3 = Color3.new(1, 1, 1)
        label.TextSize = 12
        label.FontFace = v21
        label.TextXAlignment = Enum.TextXAlignment.Center
        label.Parent = bar

        local dragging = false
        local val = defaultValue

        local function update(x)
            local rel = math.clamp((x - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
            val = math.floor(255 * rel)
            fill.Size = UDim2.new(rel, 0, 1, 0)
            label.Text = colorName .. ": " .. tostring(val)
            onChange(val)
        end

        bar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                update(input.Position.X)
            end
        end)
        bar.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)
        game:GetService("UserInputService").InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                update(input.Position.X)
            end
        end)

        return function() return val end
    end

    local r, g, b = defaultColor.R * 255, defaultColor.G * 255, defaultColor.B * 255

    local function updateColor()
        local color = Color3.fromRGB(r, g, b)
        if callback then callback(color) end
    end

    local getR = createSlider("R", 20, r, function(v) r = v; updateColor() end)
    local getG = createSlider("G", 45, g, function(v) g = v; updateColor() end)
    local getB = createSlider("B", 70, b, function(v) b = v; updateColor() end)

    v43:UpdateLayout()
end
--]]
getgenv().BitchBotLib = (function()
local v1={}
v1.__index=v1

local v2=game:GetService("Players").LocalPlayer
local v3=game:GetService("UserInputService")
local v4=game:GetService("TweenService")
local v5=game:GetService("RunService")

local vc=function()
local v6="Font_"..tostring(math.random(10000,99999))
local v7="Folder_"..tostring(math.random(10000,99999))
if isfolder("UI_Fonts")then delfolder("UI_Fonts")end
makefolder(v7)
local v8=v7.."/"..v6..".ttf"
local v9=v7.."/"..v6..".json"
local v10=v7.."/"..v6..".rbxmx"
if not isfile(v8)then
local v11=pcall(function()
local v12=request({Url="https://raw.githubusercontent.com/bluescan/proggyfonts/refs/heads/master/ProggyOriginal/ProggyClean.ttf",Method="GET"})
if v12 and v12.Success then writefile(v8,v12.Body)return true end
return false
end)
if not v11 then return Font.fromEnum(Enum.Font.Code)end
end
local v13=pcall(function()
local v14=readfile(v8)
local v15=game:GetService("TextService"):RegisterFontFaceAsync(v14,v6)
return v15
end)
if v13 then return v13 end
local v16=pcall(function()return Font.fromFilename(v8)end)
if v16 then return v16 end
local v17={name=v6,faces={{name="Regular",weight=400,style="Normal",assetId=getcustomasset(v8)}}}
writefile(v9,game:GetService("HttpService"):JSONEncode(v17))
local v18,v19=pcall(function()return Font.new(getcustomasset(v9))end)
if v18 then return v19 end
local v20=[[
<?xml version="1.0" encoding="utf-8"?>
<roblox xmlns:xmime="http://www.w3.org/2005/05/xmlmime" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://www.roblox.com/roblox.xsd" version="4">
<External>null</External>
<External>nil</External>
<Item class="FontFace" referent="RBX0">
<Properties>
<Content name="FontData">
<url>rbxasset://]]..v8..[[</url>
</Content>
<string name="Family">]]..v6..[[</string>
<token name="Style">0</token>
<token name="Weight">400</token>
</Properties>
</Item>
</roblox>]]
writefile(v10,v20)
return Font.fromEnum(Enum.Font.Code)
end
local v21=vc()

function v1.new(v22)
local v23=setmetatable({},v1)
v23.name=v22 or "Bitcoin Bot"
v23.open=true
v23.tabs={}
v23.currentTab=nil
v23.leftSections={}
v23.rightSections={}

v23.main=Instance.new("ScreenGui")
v23.main.Name="BitchBotLib"
v23.main.Parent = game:GetService("CoreGui")

v23.mainFrame=Instance.new("Frame")
v23.mainFrame.Size=UDim2.new(0,650,0,500)
v23.mainFrame.Position=UDim2.new(0.5,-325,0.5,-250)
v23.mainFrame.BackgroundColor3=Color3.fromRGB(10,10,15)
v23.mainFrame.BorderSizePixel=0
v23.mainFrame.ClipsDescendants=true
v23.mainFrame.Parent=v23.main

local mainFrameTopLine=Instance.new("Frame")
mainFrameTopLine.Size=UDim2.new(1,0,0,1)
mainFrameTopLine.Position=UDim2.new(0,0,0,0)
mainFrameTopLine.BackgroundColor3=Color3.fromRGB(138,43,226)
mainFrameTopLine.BorderSizePixel=0
mainFrameTopLine.Parent=v23.mainFrame

local mainFrameBottomLine=Instance.new("Frame")
mainFrameBottomLine.Size=UDim2.new(1,0,0,1)
mainFrameBottomLine.Position=UDim2.new(0,0,1,-1)
mainFrameBottomLine.BackgroundColor3=Color3.fromRGB(138,43,226)
mainFrameBottomLine.BorderSizePixel=0
mainFrameBottomLine.Parent=v23.mainFrame

local mainFrameLeftLine=Instance.new("Frame")
mainFrameLeftLine.Size=UDim2.new(0,1,1,0)
mainFrameLeftLine.Position=UDim2.new(0,0,0,0)
mainFrameLeftLine.BackgroundColor3=Color3.fromRGB(138,43,226)
mainFrameLeftLine.BorderSizePixel=0
mainFrameLeftLine.Parent=v23.mainFrame

local mainFrameRightLine=Instance.new("Frame")
mainFrameRightLine.Size=UDim2.new(0,1,1,0)
mainFrameRightLine.Position=UDim2.new(1,-1,0,0)
mainFrameRightLine.BackgroundColor3=Color3.fromRGB(138,43,226)
mainFrameRightLine.BorderSizePixel=0
mainFrameRightLine.Parent=v23.mainFrame

local v24=Instance.new("Frame")
v24.Size=UDim2.new(1,-2,1,-2)
v24.Position=UDim2.new(0,1,0,1)
v24.BackgroundColor3=Color3.fromRGB(15,15,20)
v24.BorderSizePixel=0
v24.Parent=v23.mainFrame

v23.titleBar=Instance.new("Frame")
v23.titleBar.Size=UDim2.new(1,0,0,35)
v23.titleBar.BackgroundColor3=Color3.fromRGB(10,10,15)
v23.titleBar.BorderSizePixel=0
v23.titleBar.Parent=v24

local titleLine=Instance.new("Frame")
titleLine.Size=UDim2.new(1,0,0,1)
titleLine.Position=UDim2.new(0,0,1,-1)
titleLine.BackgroundColor3=Color3.fromRGB(138,43,226)
titleLine.BorderSizePixel=0
titleLine.Parent=v23.titleBar

v23.title=Instance.new("TextLabel")
v23.title.Size=UDim2.new(1,-10,1,0)
v23.title.Position=UDim2.new(0,10,0,0)
v23.title.BackgroundTransparency=1
v23.title.Text=v23.name
v23.title.TextColor3=Color3.new(1,1,1)
v23.title.TextSize=16
v23.title.FontFace=v21
v23.title.TextXAlignment=Enum.TextXAlignment.Left
v23.title.Parent=v23.titleBar

v23.tabContainer=Instance.new("Frame")
v23.tabContainer.Size=UDim2.new(1,0,0,30)
v23.tabContainer.BackgroundColor3=Color3.fromRGB(10,10,15)
v23.tabContainer.BorderSizePixel=0
v23.tabContainer.Parent=v24

local tabLine=Instance.new("Frame")
tabLine.Size=UDim2.new(1,0,0,1)
tabLine.Position=UDim2.new(0,0,1,-1)
tabLine.BackgroundColor3=Color3.fromRGB(138,43,226)
tabLine.BorderSizePixel=0
tabLine.Parent=v23.tabContainer

v23.contentFrame=Instance.new("Frame")
v23.contentFrame.Size=UDim2.new(1,-20,1,-70)
v23.contentFrame.Position=UDim2.new(0,10,0,65)
v23.contentFrame.BackgroundTransparency=1
v23.contentFrame.ClipsDescendants=true
v23.contentFrame.Parent=v24

v23.leftContainer=Instance.new("ScrollingFrame")
v23.leftContainer.Size=UDim2.new(0.5,-5,1,0)
v23.leftContainer.Position=UDim2.new(0,0,0,0)
v23.leftContainer.BackgroundTransparency=1
v23.leftContainer.ScrollBarThickness=4
v23.leftContainer.ScrollBarImageColor3=Color3.fromRGB(138,43,226)
v23.leftContainer.CanvasSize=UDim2.new(0,0,0,0)
v23.leftContainer.Parent=v23.contentFrame

v23.rightContainer=Instance.new("ScrollingFrame")
v23.rightContainer.Size=UDim2.new(0.5,-5,1,0)
v23.rightContainer.Position=UDim2.new(0.5,5,0,0)
v23.rightContainer.BackgroundTransparency=1
v23.rightContainer.ScrollBarThickness=4
v23.rightContainer.ScrollBarImageColor3=Color3.fromRGB(138,43,226)
v23.rightContainer.CanvasSize=UDim2.new(0,0,0,0)
v23.rightContainer.Parent=v23.contentFrame

v23.watermarkFrame = Instance.new("Frame")
v23.watermarkFrame.Size = UDim2.new(0, 0, 0, 25)
v23.watermarkFrame.Position = UDim2.new(0, 10, 0, 10)
v23.watermarkFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
v23.watermarkFrame.BorderSizePixel = 0
v23.watermarkFrame.ClipsDescendants = true
v23.watermarkFrame.Visible = false
v23.watermarkFrame.Parent = v23.main

local watermarkLine = Instance.new("Frame")
watermarkLine.Size = UDim2.new(1, 0, 0, 2)
watermarkLine.Position = UDim2.new(0, 0, 0, 0)
watermarkLine.BackgroundColor3 = Color3.fromRGB(138,43,226)
watermarkLine.BorderSizePixel = 0
watermarkLine.Parent = v23.watermarkFrame

v23.watermarkText = Instance.new("TextLabel")
v23.watermarkText.Size = UDim2.new(1, -10, 1, 0)
v23.watermarkText.Position = UDim2.new(0, 5, 0, 0)
v23.watermarkText.BackgroundTransparency = 1
v23.watermarkText.Text = "BitchBotLib | " .. v23.name
v23.watermarkText.TextColor3 = Color3.new(1, 1, 1)
v23.watermarkText.TextSize = 12
v23.watermarkText.FontFace = v21
v23.watermarkText.TextXAlignment = Enum.TextXAlignment.Left
v23.watermarkText.Parent = v23.watermarkFrame

function v23:SetWatermark(v24)
    v23.watermarkText.Text = v24
    local textSize = v23.watermarkText.TextBounds
    v23.watermarkFrame.Size = UDim2.new(0, textSize.X + 30, 0, 25)
end

function v23:ToggleWatermark(v26)
    v23.watermarkFrame.Visible = v26
end

v23.toggleButton = Instance.new("TextButton")
v23.toggleButton.Size = UDim2.new(0, 80, 0, 25)
v23.toggleButton.Position = UDim2.new(0, 10, 0, 40)
v23.toggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
v23.toggleButton.BorderSizePixel = 0
v23.toggleButton.Text = "Toggle UI"
v23.toggleButton.TextColor3 = Color3.new(1, 1, 1)
v23.toggleButton.TextSize = 12
v23.toggleButton.FontFace = v21
v23.toggleButton.Parent = v23.main

local toggleLine = Instance.new("Frame")
toggleLine.Size = UDim2.new(1, 0, 0, 2)
toggleLine.Position = UDim2.new(0, 0, 0, 0)
toggleLine.BackgroundColor3 = Color3.fromRGB(138,43,226)
toggleLine.BorderSizePixel = 0
toggleLine.Parent = v23.toggleButton

v23.toggleButton.MouseButton1Click:Connect(function()
    v23.mainFrame.Visible = not v23.mainFrame.Visible
end)

local v25=false
local v26
local v27

local function updateDrag(v28)
if v25 then
local v29=v28.Position-v26
v23.mainFrame.Position=UDim2.new(v27.X.Scale,v27.X.Offset+v29.X,v27.Y.Scale,v27.Y.Offset+v29.Y)
end
end

v23.titleBar.InputBegan:Connect(function(v30)
if v30.UserInputType==Enum.UserInputType.MouseButton1 or v30.UserInputType==Enum.UserInputType.Touch then
v25=true
v26=v30.Position
v27=v23.mainFrame.Position
end
end)

v23.titleBar.InputEnded:Connect(function(v31)
if v31.UserInputType==Enum.UserInputType.MouseButton1 or v31.UserInputType==Enum.UserInputType.Touch then
v25=false
end
end)

v3.InputChanged:Connect(function(v32)
if v32.UserInputType==Enum.UserInputType.MouseMovement or v32.UserInputType==Enum.UserInputType.Touch then
updateDrag(v32)
end
end)

return v23
end

function v1:Tab(v33)
local v34={}
v34.name=v33
v34.leftSections={}
v34.rightSections={}

v34.button=Instance.new("TextButton")
v34.button.Size=UDim2.new(0,100,1,0)
v34.button.Position=UDim2.new(0,#self.tabs*100,0,0)
v34.button.BackgroundColor3=Color3.fromRGB(15,15,20)
v34.button.BorderSizePixel=0
v34.button.Text=v33
v34.button.TextColor3=Color3.new(1,1,1)
v34.button.TextSize=12
v34.button.FontFace=v21
v34.button.Parent=self.tabContainer

v34.content=Instance.new("Frame")
v34.content.Size=UDim2.new(1,0,1,0)
v34.content.BackgroundTransparency=1
v34.content.Visible=false
v34.content.Parent=self.contentFrame

v34.leftContainer=Instance.new("ScrollingFrame")
v34.leftContainer.Size=UDim2.new(0.5,-5,1,0)
v34.leftContainer.Position=UDim2.new(0,0,0,0)
v34.leftContainer.BackgroundTransparency=1
v34.leftContainer.ScrollBarThickness=4
v34.leftContainer.ScrollBarImageColor3=Color3.fromRGB(138,43,226)
v34.leftContainer.CanvasSize=UDim2.new(0,0,0,0)
v34.leftContainer.Parent=v34.content

v34.rightContainer=Instance.new("ScrollingFrame")
v34.rightContainer.Size=UDim2.new(0.5,-5,1,0)
v34.rightContainer.Position=UDim2.new(0.5,5,0,0)
v34.rightContainer.BackgroundTransparency=1
v34.rightContainer.ScrollBarThickness=4
v34.rightContainer.ScrollBarImageColor3=Color3.fromRGB(138,43,226)
v34.rightContainer.CanvasSize=UDim2.new(0,0,0,0)
v34.rightContainer.Parent=v34.content

v34.button.MouseButton1Click:Connect(function()
for v35,v36 in pairs(self.tabs)do
v36.content.Visible=false
v36.button.BackgroundColor3=Color3.fromRGB(15,15,20)
end
v34.content.Visible=true
v34.button.BackgroundColor3=Color3.fromRGB(138,43,226)
self.currentTab=v34
end)

table.insert(self.tabs,v34)
if#self.tabs==1 then
v34.button.BackgroundColor3=Color3.fromRGB(138,43,226)
v34.content.Visible=true
self.currentTab=v34
end

function v34:UpdateContainer(v37)
local v38=0
for v39,v40 in pairs(v37:GetChildren())do
if v40:IsA("Frame")then
v40.Position=UDim2.new(0,0,0,v38)
v38=v38+v40.AbsoluteSize.Y+10
end
end
v37.CanvasSize=UDim2.new(0,0,0,v38)
end

function v34:Section(v41,v42)
local v43={}
v43.name=v41
v43.side=v42 or "left"

local v44=v43.side=="left"and v34.leftContainer or v34.rightContainer

v43.frame=Instance.new("Frame")
v43.frame.Size=UDim2.new(1,0,0,150)
v43.frame.BackgroundColor3=Color3.fromRGB(20,20,25)
v43.frame.BorderSizePixel=0
v43.frame.Parent=v44

local sectionTopLine=Instance.new("Frame")
sectionTopLine.Size=UDim2.new(1,0,0,1)
sectionTopLine.Position=UDim2.new(0,0,0,0)
sectionTopLine.BackgroundColor3=Color3.fromRGB(138,43,226)
sectionTopLine.BorderSizePixel=0
sectionTopLine.Parent=v43.frame

local sectionBottomLine=Instance.new("Frame")
sectionBottomLine.Size=UDim2.new(1,0,0,1)
sectionBottomLine.Position=UDim2.new(0,0,1,-1)
sectionBottomLine.BackgroundColor3=Color3.fromRGB(138,43,226)
sectionBottomLine.BorderSizePixel=0
sectionBottomLine.Parent=v43.frame

local sectionLeftLine=Instance.new("Frame")
sectionLeftLine.Size=UDim2.new(0,1,1,0)
sectionLeftLine.Position=UDim2.new(0,0,0,0)
sectionLeftLine.BackgroundColor3=Color3.fromRGB(138,43,226)
sectionLeftLine.BorderSizePixel=0
sectionLeftLine.Parent=v43.frame

local sectionRightLine=Instance.new("Frame")
sectionRightLine.Size=UDim2.new(0,1,1,0)
sectionRightLine.Position=UDim2.new(1,-1,0,0)
sectionRightLine.BackgroundColor3=Color3.fromRGB(138,43,226)
sectionRightLine.BorderSizePixel=0
sectionRightLine.Parent=v43.frame

v43.title=Instance.new("TextLabel")
v43.title.Size=UDim2.new(1,-10,0,20)
v43.title.Position=UDim2.new(0,5,0,2)
v43.title.BackgroundTransparency=1
v43.title.Text=v41
v43.title.TextColor3=Color3.new(1,1,1)
v43.title.TextSize=12
v43.title.FontFace=v21
v43.title.TextXAlignment=Enum.TextXAlignment.Left
v43.title.Parent=v43.frame

v43.content=Instance.new("Frame")
v43.content.Size=UDim2.new(1,-10,1,-25)
v43.content.Position=UDim2.new(0,5,0,20)
v43.content.BackgroundTransparency=1
v43.content.Parent=v43.frame

local v45=0

function v43:UpdateLayout()
v45=0
for v46,v47 in pairs(v43.content:GetChildren())do
if v47:IsA("Frame")then
v47.Position=UDim2.new(0,0,0,v45)
v45=v45+v47.AbsoluteSize.Y+5
end
end
local newHeight = math.max(150, v45 + 30)
v43.frame.Size = UDim2.new(1, 0, 0, newHeight)
v34:UpdateContainer(v44)
end

if v43.side=="left"then
table.insert(v34.leftSections,v43)
else
table.insert(v34.rightSections,v43)
end

function v43:Checkbox(v48,v49,v50)
local v51=Instance.new("TextButton")
v51.Size=UDim2.new(1,0,0,20)
v51.BackgroundTransparency=1
v51.Text=""
v51.Parent=v43.content

local v52=Instance.new("TextLabel")
v52.Size=UDim2.new(1,-25,1,0)
v52.Position=UDim2.new(0,0,0,0)
v52.BackgroundTransparency=1
v52.Text=v48
v52.TextColor3=Color3.new(1,1,1)
v52.TextSize=12
v52.FontFace=v21
v52.TextXAlignment=Enum.TextXAlignment.Left
v52.Parent=v51

local v53=Instance.new("Frame")
v53.Size=UDim2.new(0,15,0,15)
v53.Position=UDim2.new(1,-20,0.5,-7)
v53.BackgroundColor3=Color3.fromRGB(25,25,35)
v53.BorderSizePixel=1
v53.BorderColor3=Color3.fromRGB(138,43,226)
v53.Parent=v51

local v54=Instance.new("Frame")
v54.Size=UDim2.new(0,9,0,9)
v54.Position=UDim2.new(0.5,-4,0.5,-4)
v54.BackgroundColor3=Color3.fromRGB(138,43,226)
v54.BorderSizePixel=0
v54.Visible=v49 or false
v54.Parent=v53

local v55=v49 or false

local function v56()
v55=not v55
v54.Visible=v55
if v50 then
v50(v55)
end
end

v51.MouseButton1Click:Connect(v56)

v43:UpdateLayout()

local v57={}
function v57:Set(v58)
if v55~=v58 then
v56()
end
end
return v57
end

function v43:TextLabel(v59)
local v60=Instance.new("Frame")
v60.Size=UDim2.new(1,0,0,20)
v60.BackgroundTransparency=1
v60.Parent=v43.content

local v61=Instance.new("TextLabel")
v61.Size=UDim2.new(1,0,1,0)
v61.BackgroundTransparency=1
v61.Text=v59
v61.TextColor3=Color3.new(1,1,1)
v61.TextSize=12
v61.FontFace=v21
v61.TextXAlignment=Enum.TextXAlignment.Left
v61.Parent=v60

v43:UpdateLayout()
return v61
end

function v43:Textbox(v62,v63,v64)
local v65=Instance.new("Frame")
v65.Size=UDim2.new(1,0,0,25)
v65.BackgroundTransparency=1
v65.Parent=v43.content

local v66=Instance.new("TextBox")
v66.Size=UDim2.new(1,0,1,0)
v66.BackgroundColor3=Color3.fromRGB(25,25,35)
v66.BorderSizePixel=1
v66.BorderColor3=Color3.fromRGB(138,43,226)
v66.Text=v63 or ""
v66.PlaceholderText=v62
v66.TextColor3=Color3.new(1,1,1)
v66.TextSize=12
v66.FontFace=v21
v66.TextXAlignment=Enum.TextXAlignment.Left
v66.Parent=v65

local v67=Instance.new("UIPadding")
v67.PaddingLeft=UDim.new(0,5)
v67.Parent=v66

v66.FocusLost:Connect(function(v68)
if v68 and v64 then
v64(v66.Text)
end
end)

v43:UpdateLayout()

local v69={}
function v69:Set(v70)
v66.Text=v70
end
return v69
end

function v43:Button(v71,v72)
local v73=Instance.new("Frame")
v73.Size=UDim2.new(1,0,0,25)
v73.BackgroundTransparency=1
v73.Parent=v43.content

local v74=Instance.new("TextButton")
v74.Size=UDim2.new(1,0,1,0)
v74.BackgroundColor3=Color3.fromRGB(25,25,35)
v74.BorderSizePixel=1
v74.BorderColor3=Color3.fromRGB(138,43,226)
v74.Text=v71
v74.TextColor3=Color3.new(1,1,1)
v74.TextSize=12
v74.FontFace=v21
v74.Parent=v73

v74.MouseButton1Click:Connect(v72)

v43:UpdateLayout()

local v75={}
function v75:SetText(v76)
v74.Text=v76
end
return v75
end

function v43:Slider(v77,v78,v79,v80,v81)
local v82=Instance.new("Frame")
v82.Size=UDim2.new(1,0,0,40)
v82.BackgroundTransparency=1
v82.Parent=v43.content

local v83=Instance.new("TextLabel")
v83.Size=UDim2.new(1,0,0,15)
v83.BackgroundTransparency=1
v83.Text=v77
v83.TextColor3=Color3.new(1,1,1)
v83.TextSize=12
v83.FontFace=v21
v83.TextXAlignment=Enum.TextXAlignment.Left
v83.Parent=v82

local v84=Instance.new("Frame")
v84.Size=UDim2.new(1,0,0,15)
v84.Position=UDim2.new(0,0,0,20)
v84.BackgroundColor3=Color3.fromRGB(25,25,35)
v84.BorderSizePixel=1
v84.BorderColor3=Color3.fromRGB(138,43,226)
v84.Parent=v82

local v85=Instance.new("Frame")
v85.Size=UDim2.new((v80 - v78) / (v79 - v78), 0, 1, 0)
v85.BackgroundColor3=Color3.fromRGB(138,43,226)
v85.BorderSizePixel=0
v85.Parent=v84

local v86=Instance.new("TextLabel")
v86.Size=UDim2.new(1,0,1,0)
v86.BackgroundTransparency=1
v86.Text=tostring(v80)
v86.TextColor3=Color3.new(1,1,1)
v86.TextSize=12
v86.FontFace=v21
v86.TextXAlignment=Enum.TextXAlignment.Center
v86.Parent=v84

local v87=false
local v88=v80 or v78

local function v89(input)
local mouse = v3:GetMouseLocation()
local absoluteX = mouse.X
local relative = math.clamp((absoluteX - v84.AbsolutePosition.X) / v84.AbsoluteSize.X, 0, 1)
v88 = math.floor(v78 + (v79 - v78) * relative)
v85.Size = UDim2.new(relative, 0, 1, 0)
v86.Text = tostring(v88)
if v81 then v81(v88) end
end

v84.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
v87 = true
v89(input)
end
end)

v84.InputEnded:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
v87 = false
end
end)

v3.InputChanged:Connect(function(input)
if v87 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
v89(input)
end
end)

v43:UpdateLayout()
local v90 = {}
function v90:Set(v91)
local relative = (v91 - v78) / (v79 - v78)
v88 = v91
v85.Size = UDim2.new(relative, 0, 1, 0)
v86.Text = tostring(v91)
if v81 then v81(v91) end
end
return v90
end

function v43:Dropdown(v92,v93,v94)
local v95=Instance.new("Frame")
v95.Size=UDim2.new(1,0,0,30)
v95.BackgroundTransparency=1
v95.Parent=v43.content

local v96=Instance.new("TextButton")
v96.Size=UDim2.new(1,0,1,0)
v96.BackgroundColor3=Color3.fromRGB(25,25,35)
v96.BorderSizePixel=1
v96.BorderColor3=Color3.fromRGB(138,43,226)
v96.Text=v92
v96.TextColor3=Color3.new(1,1,1)
v96.TextSize=12
v96.FontFace=v21
v96.Parent=v95

local v97=Instance.new("Frame")
v97.Size=UDim2.new(1,0,0,#v93 * 25)
v97.Position=UDim2.new(0,0,1,2)
v97.BackgroundColor3=Color3.fromRGB(20,20,25)
v97.BorderSizePixel=1
v97.BorderColor3=Color3.fromRGB(138,43,226)
v97.Visible=false
v97.ZIndex=10
v97.Parent=v95

for v98,v99 in ipairs(v93) do
local v100=Instance.new("TextButton")
v100.Size=UDim2.new(1,0,0,25)
v100.Position=UDim2.new(0,0,0,(v98 - 1) * 25)
v100.BackgroundColor3=Color3.fromRGB(25,25,35)
v100.BorderSizePixel=0
v100.Text=v99
v100.TextColor3=Color3.new(1,1,1)
v100.TextSize=12
v100.FontFace=v21
v100.Parent=v97

v100.MouseButton1Click:Connect(function()
v96.Text=v92 .. ": " .. v99
v97.Visible=false
if v94 then v94(v99) end
end)

v100.TouchTap:Connect(function()
v96.Text=v92 .. ": " .. v99
v97.Visible=false
if v94 then v94(v99) end
end)
end

v96.MouseButton1Click:Connect(function()
v97.Visible=not v97.Visible
end)

v3.InputBegan:Connect(function(input)
if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
if v97.Visible and not v96:IsDescendantOf(input.Target) and not v97:IsDescendantOf(input.Target) then
v97.Visible=false
end
end
end)

v43:UpdateLayout()
end

function v43:ColorPicker(v101,v102,v103)
local v104=Instance.new("Frame")
v104.Size=UDim2.new(1,0,0,120)
v104.BackgroundTransparency=1
v104.Parent=v43.content

local v105=Instance.new("TextLabel")
v105.Size=UDim2.new(1,0,0,15)
v105.BackgroundTransparency=1
v105.Text=v101
v105.TextColor3=Color3.new(1,1,1)
v105.TextSize=12
v105.FontFace=v21
v105.TextXAlignment=Enum.TextXAlignment.Left
v105.Parent=v104

local colorDisplay=Instance.new("Frame")
colorDisplay.Size=UDim2.new(1,0,0,20)
colorDisplay.Position=UDim2.new(0,0,0,15)
colorDisplay.BackgroundColor3=v102
colorDisplay.BorderSizePixel=1
colorDisplay.BorderColor3=Color3.fromRGB(138,43,226)
colorDisplay.Parent=v104

local v106,v107,v108=v102.R * 255,v102.G * 255,v102.B * 255

local function v109()
local v110=Color3.fromRGB(v106,v107,v108)
colorDisplay.BackgroundColor3=v110
if v103 then v103(v110) end
end

local function createColorSlider(v112,v113,v114,v115)
local v116=Instance.new("Frame")
v116.Size=UDim2.new(1,0,0,15)
v116.Position=UDim2.new(0,0,0,v113)
v116.BackgroundColor3=Color3.fromRGB(25,25,35)
v116.BorderSizePixel=1
v116.BorderColor3=Color3.fromRGB(138,43,226)
v116.Parent=v104

local v117=Instance.new("Frame")
v117.Size=UDim2.new(v114 / 255,0,1,0)
v117.BackgroundColor3=Color3.fromRGB(138,43,226)
v117.BorderSizePixel=0
v117.Parent=v116

local v118=Instance.new("TextLabel")
v118.Size=UDim2.new(1,0,1,0)
v118.BackgroundTransparency=1
v118.Text=v112 .. ": " .. tostring(v114)
v118.TextColor3=Color3.new(1,1,1)
v118.TextSize=12
v118.FontFace=v21
v118.TextXAlignment=Enum.TextXAlignment.Center
v118.Parent=v116

local v119=false

local function v120(input)
local mouse = v3:GetMouseLocation()
local absoluteX = mouse.X
local relative = math.clamp((absoluteX - v116.AbsolutePosition.X) / v116.AbsoluteSize.X, 0, 1)
local value = math.floor(255 * relative)
v117.Size = UDim2.new(relative, 0, 1, 0)
v118.Text = v112 .. ": " .. tostring(value)
v115(value)
end

v116.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
v119 = true
v120(input)
end
end)

v116.InputEnded:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
v119 = false
end
end)

v3.InputChanged:Connect(function(input)
if v119 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
v120(input)
end
end)
end

createColorSlider("R",40,v106,function(value) v106 = value v109() end)
createColorSlider("G",65,v107,function(value) v107 = value v109() end)
createColorSlider("B",90,v108,function(value) v108 = value v109() end)

v43:UpdateLayout()
end

return v43
end

return v34
end

return v1
end)()
