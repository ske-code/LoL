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

local v45=0

function v43:UpdateLayout()

v45=0

for v46,v47 in pairs(v43.content:GetChildren())do

if v47:IsA("Frame")then

v47.Position=UDim2.new(0,0,0,v45)

v45=v45+v47.AbsoluteSize.Y+5

end

end

v34:UpdateContainer(v44)

end

if v43.side=="left"then

table.insert(v34.leftSections,v43)

else

table.insert(v34.rightSections,v43)

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
function v43:Slider(v77, v78, v79, v80, v81)
    local v82 = Instance.new("Frame")
    v82.Size = UDim2.new(1, 0, 0, 40)
    v82.BackgroundTransparency = 1
    v82.Parent = v43.content

    local v83 = Instance.new("TextLabel")
    v83.Size = UDim2.new(1, 0, 0, 15)
    v83.BackgroundTransparency = 1
    v83.Text = v77
    v83.TextColor3 = Color3.new(1, 1, 1)
    v83.TextSize = 12
    v83.FontFace = v21
    v83.TextXAlignment = Enum.TextXAlignment.Left
    v83.Parent = v82

    local v84 = Instance.new("Frame")
    v84.Size = UDim2.new(1, 0, 0, 15)
    v84.Position = UDim2.new(0, 0, 0, 20)
    v84.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    v84.BorderSizePixel = 1
    v84.BorderColor3 = Color3.fromRGB(60, 60, 70)
    v84.ClipsDescendants = true
    v84.Parent = v82

    local v85 = Instance.new("Frame")
    v85.Size = UDim2.new(0, 0, 1, 0)
    v85.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
    v85.BorderSizePixel = 0
    v85.Parent = v84

    local v86 = Instance.new("TextLabel")
    v86.Size = UDim2.new(1, 0, 1, 0)
    v86.BackgroundTransparency = 1
    v86.Text = tostring(v78) .. "/" .. tostring(v79)
    v86.TextColor3 = Color3.new(1, 1, 1)
    v86.TextSize = 10
    v86.FontFace = v21
    v86.Parent = v84

    local v87 = v78
    local v88 = false

    local function v89()
        local v90 = (v87 - v78) / (v79 - v78)
        v85.Size = UDim2.new(v90, 0, 1, 0)
        v86.Text = tostring(math.floor(v87)) .. "/" .. tostring(v79)
        if v81 then
            v81(v87)
        end
    end

    v84.InputBegan:Connect(function(v91)
        if v91.UserInputType == Enum.UserInputType.MouseButton1 or v91.UserInputType == Enum.UserInputType.Touch then
            v88 = true
        end
    end)

    v84.InputEnded:Connect(function(v92)
        if v92.UserInputType == Enum.UserInputType.MouseButton1 or v92.UserInputType == Enum.UserInputType.Touch then
            v88 = false
        end
    end)

    v3.InputChanged:Connect(function(v93)
        if v88 and (v93.UserInputType == Enum.UserInputType.MouseMovement or v93.UserInputType == Enum.UserInputType.Touch) then
            local v94 = v84.AbsolutePosition.X
            local v95 = v84.AbsoluteSize.X
            local v96 = math.clamp((v93.Position.X - v94) / v95, 0, 1)
            v87 = math.floor(v78 + (v79 - v78) * v96)
            v89()
        end
    end)

    v89()

    v43:UpdateLayout()

    local v97 = {}
    function v97:Set(v98)
        v87 = math.clamp(v98, v78, v79)
        v89()
    end
    function v97:Get()
        return v87
    end
    return v97
end

function v43:Dropdown(v99, v100, v101)
    local v102 = Instance.new("Frame")
    v102.Size = UDim2.new(1, 0, 0, 25)
    v102.BackgroundTransparency = 1
    v102.Parent = v43.content

    local v103 = Instance.new("TextButton")
    v103.Size = UDim2.new(1, 0, 1, 0)
    v103.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    v103.BorderSizePixel = 1
    v103.BorderColor3 = Color3.fromRGB(60, 60, 70)
    v103.Text = v99 .. ": " .. (v100[1] or "")
    v103.TextColor3 = Color3.new(1, 1, 1)
    v103.TextSize = 12
    v103.FontFace = v21
    v103.Parent = v102

    local v104 = Instance.new("UIPadding")
    v104.PaddingLeft = UDim.new(0, 5)
    v104.Parent = v103

    local v105 = Instance.new("Frame")
    v105.Size = UDim2.new(1, 0, 0, 0)
    v105.Position = UDim2.new(0, 0, 1, 2)
    v105.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    v105.BorderSizePixel = 1
    v105.BorderColor3 = Color3.fromRGB(60, 60, 70)
    v105.ClipsDescendants = true
    v105.Visible = false
    v105.Parent = v102

    local v106 = Instance.new("UIListLayout")
    v106.Parent = v105

    local v107 = v100[1]

    local function v108()
        for v109, v110 in pairs(v105:GetChildren()) do
            if v110:IsA("TextButton") then
                v110:Destroy()
            end
        end
        
        for v111, v112 in pairs(v100) do
            local v113 = Instance.new("TextButton")
            v113.Size = UDim2.new(1, 0, 0, 25)
            v113.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
            v113.BorderSizePixel = 0
            v113.Text = v112
            v113.TextColor3 = Color3.new(1, 1, 1)
            v113.TextSize = 12
            v113.FontFace = v21
            v113.Parent = v105
            
            v113.MouseButton1Click:Connect(function()
                v107 = v112
                v103.Text = v99 .. ": " .. v112
                v105.Visible = false
                if v101 then
                    v101(v112)
                end
            end)
        end
        v105.Size = UDim2.new(1, 0, 0, #v100 * 25)
    end

    v108()

    v103.MouseButton1Click:Connect(function()
        v105.Visible = not v105.Visible
    end)

    v43:UpdateLayout()

    local v114 = {}
    function v114:Set(v115)
        v107 = v115
        v103.Text = v99 .. ": " .. v115
        if v101 then
            v101(v115)
        end
    end
    function v114:Get()
        return v107
    end
    return v114
end
function v43:Colorpicker(v77, v78, v79)
    local v80 = Instance.new("Frame")
    v80.Size = UDim2.new(1, 0, 0, 25)
    v80.BackgroundTransparency = 1
    v80.Parent = v43.content

    local v81 = Instance.new("TextLabel")
    v81.Size = UDim2.new(1, -35, 1, 0)
    v81.BackgroundTransparency = 1
    v81.Text = v77
    v81.TextColor3 = Color3.new(1, 1, 1)
    v81.TextSize = 12
    v81.FontFace = v21
    v81.TextXAlignment = Enum.TextXAlignment.Left
    v81.Parent = v80

    local v82 = Instance.new("TextButton")
    v82.Size = UDim2.new(0, 30, 0, 20)
    v82.Position = UDim2.new(1, -32, 0.5, -10)
    v82.BackgroundColor3 = v78 or Color3.new(1, 1, 1)
    v82.BorderSizePixel = 1
    v82.BorderColor3 = Color3.fromRGB(60, 60, 70)
    v82.Text = ""
    v82.Parent = v80

    local v83 = Instance.new("Frame")
    v83.Size = UDim2.new(1, 0, 0, 120)
    v83.Position = UDim2.new(0, 0, 1, 5)
    v83.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    v83.BorderSizePixel = 1
    v83.BorderColor3 = Color3.fromRGB(60, 60, 70)
    v83.Visible = false
    v83.Parent = v80

    local v84 = Instance.new("ImageButton")
    v84.Size = UDim2.new(1, -10, 0, 80)
    v84.Position = UDim2.new(0, 5, 0, 5)
    v84.BackgroundColor3 = Color3.new(1, 1, 1)
    v84.BorderSizePixel = 1
    v84.BorderColor3 = Color3.fromRGB(60, 60, 70)
    v84.Image = "rbxassetid://14204231522"
    v84.Parent = v83

    local v85 = Instance.new("Frame")
    v85.Size = UDim2.new(0, 15, 1, -10)
    v85.Position = UDim2.new(1, -20, 0, 5)
    v85.BackgroundColor3 = Color3.new(1, 1, 1)
    v85.BorderSizePixel = 1
    v85.BorderColor3 = Color3.fromRGB(60, 60, 70)
    v85.Parent = v83

    local v86 = Instance.new("UIGradient")
    v86.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.new(1, 0, 0)),
        ColorSequenceKeypoint.new(0.17, Color3.new(1, 1, 0)),
        ColorSequenceKeypoint.new(0.33, Color3.new(0, 1, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.new(0, 1, 1)),
        ColorSequenceKeypoint.new(0.67, Color3.new(0, 0, 1)),
        ColorSequenceKeypoint.new(0.83, Color3.new(1, 0, 1)),
        ColorSequenceKeypoint.new(1, Color3.new(1, 0, 0))
    })
    v86.Rotation = 90
    v86.Parent = v85

    local v87 = Instance.new("Frame")
    v87.Size = UDim2.new(1, 0, 0, 20)
    v87.Position = UDim2.new(0, 5, 1, -25)
    v87.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    v87.BorderSizePixel = 1
    v87.BorderColor3 = Color3.fromRGB(60, 60, 70)
    v87.Parent = v83

    local v88 = Instance.new("TextLabel")
    v88.Size = UDim2.new(1, 0, 1, 0)
    v88.BackgroundTransparency = 1
    v88.Text = tostring(v78 or Color3.new(1, 1, 1))
    v88.TextColor3 = Color3.new(1, 1, 1)
    v88.TextSize = 10
    v88.FontFace = v21
    v88.Parent = v87

    local v89 = v78 or Color3.new(1, 1, 1)
    local v90 = false
    local v91 = false

    local function v92(v93, v94)
        local v95 = math.clamp((v93 - v84.AbsolutePosition.X) / v84.AbsoluteSize.X, 0, 1)
        local v96 = math.clamp(1 - ((v94 - v84.AbsolutePosition.Y) / v84.AbsoluteSize.Y), 0, 1)
        
        local v97 = Color3.fromHSV(v95, v96, 1)
        v89 = v97
        v82.BackgroundColor3 = v97
        v88.Text = "R:" .. math.floor(v97.R * 255) .. " G:" .. math.floor(v97.G * 255) .. " B:" .. math.floor(v97.B * 255)
        
        if v79 then
            v79(v97)
        end
    end

    local function v98(v99)
        local v100 = math.clamp(1 - ((v99 - v85.AbsolutePosition.Y) / v85.AbsoluteSize.Y), 0, 1)
        local v101, v102, v103 = v89:ToHSV()
        local v104 = Color3.fromHSV(v101, v102, v100)
        v89 = v104
        v82.BackgroundColor3 = v104
        v88.Text = "R:" .. math.floor(v104.R * 255) .. " G:" .. math.floor(v104.G * 255) .. " B:" .. math.floor(v104.B * 255)
        
        if v79 then
            v79(v104)
        end
    end

    v82.MouseButton1Click:Connect(function()
        v83.Visible = not v83.Visible
    end)

    v84.InputBegan:Connect(function(v105)
        if v105.UserInputType == Enum.UserInputType.MouseButton1 or v105.UserInputType == Enum.UserInputType.Touch then
            v90 = true
            v92(v105.Position.X, v105.Position.Y)
        end
    end)

    v84.InputEnded:Connect(function(v106)
        if v106.UserInputType == Enum.UserInputType.MouseButton1 or v106.UserInputType == Enum.UserInputType.Touch then
            v90 = false
        end
    end)

    v85.InputBegan:Connect(function(v107)
        if v107.UserInputType == Enum.UserInputType.MouseButton1 or v107.UserInputType == Enum.UserInputType.Touch then
            v91 = true
            v98(v107.Position.Y)
        end
    end)

    v85.InputEnded:Connect(function(v108)
        if v108.UserInputType == Enum.UserInputType.MouseButton1 or v108.UserInputType == Enum.UserInputType.Touch then
            v91 = false
        end
    end)

    v3.InputChanged:Connect(function(v109)
        if v90 and (v109.UserInputType == Enum.UserInputType.MouseMovement or v109.UserInputType == Enum.UserInputType.Touch) then
            v92(v109.Position.X, v109.Position.Y)
        elseif v91 and (v109.UserInputType == Enum.UserInputType.MouseMovement or v109.UserInputType == Enum.UserInputType.Touch) then
            v98(v109.Position.Y)
        end
    end)

    v43:UpdateLayout()

    local v110 = {}
    function v110:Set(v111)
        v89 = v111
        v82.BackgroundColor3 = v111
        v88.Text = "R:" .. math.floor(v111.R * 255) .. " G:" .. math.floor(v111.G * 255) .. " B:" .. math.floor(v111.B * 255)
        if v79 then
            v79(v111)
        end
    end
    function v110:Get()
        return v89
    end
    return v110
end                  
return v75

end

return v43

end

return v34

end

return v1

end)()
