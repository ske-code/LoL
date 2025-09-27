local PhoenixUI = {}
PhoenixUI.Open = true
PhoenixUI.Accent = Color3.fromRGB(85,170,255)
PhoenixUI.ThemeObjects = {}
PhoenixUI.Flags = {}
PhoenixUI.Holder = nil
PhoenixUI.ScreenGUI = nil
PhoenixUI.UIFont = Font.new("rbxassetid://12187371840")

local v1 = game:GetService('Players').LocalPlayer
local v2 = v1:GetMouse()
local v3 = game:GetService("TweenService")
local v4 = game:GetService("UserInputService")
local v5 = game:GetService("RunService")

function PhoenixUI:v6(v7,v8)
return v7:Connect(v8)
end

function PhoenixUI:v9(v10,v11,v12)
return Color3.fromRGB(v10,v11,v12)
end

function PhoenixUI:v13(v14)
if typeof(v14) == 'boolean' then
PhoenixUI.Open = v14
if PhoenixUI.Holder then
PhoenixUI.Holder.Visible = v14
end
end
end

function PhoenixUI:v15(v16)
local v17,v18 = v16.AbsolutePosition,v16.AbsoluteSize
if v2.X >= v17.X and v2.X <= v17.X + v18.X and v2.Y >= v17.Y and v2.Y <= v17.Y + v18.Y then
return true
end
return false
end

function PhoenixUI:v19(v20)
PhoenixUI.Accent = v20
for v21,v22 in next,PhoenixUI.ThemeObjects do
if v22:IsA("Frame") or v22:IsA("TextButton") then
v22.BackgroundColor3 = v20
elseif v22:IsA("TextLabel") then
v22.TextColor3 = v20
elseif v22:IsA("ImageLabel") or v22:IsA("ImageButton") then
v22.ImageColor3 = v20
elseif v22:IsA("UIStroke") then
v22.Color = v20
end
end
end

function PhoenixUI:v23(v24,v25)
local v26 = Instance.new(v24)
if v25 then
table.insert(PhoenixUI.ThemeObjects,v26)
if v26:IsA("Frame") or v26:IsA("TextButton") then
v26.BackgroundColor3 = PhoenixUI.Accent
elseif v26:IsA("TextLabel") then
v26.TextColor3 = PhoenixUI.Accent
elseif v26:IsA("ImageLabel") then
v26.ImageColor3 = PhoenixUI.Accent
elseif v26:IsA("UIStroke") then
v26.Color = PhoenixUI.Accent
end
end
return v26
end

function PhoenixUI:Window(v27)
local v28 = {}
v28.Pages = {}
v28.Elements = {}
v28.Name = v27.Name or "Window"

local v29 = Instance.new("ScreenGui",game:GetService("RunService"):IsStudio() and v1.PlayerGui or game.CoreGui)
v29.Name = "PhoenixUI"
v29.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
PhoenixUI.ScreenGUI = v29

local v30 = PhoenixUI:v23("TextButton",true)
v30.Name = "MainFrame"
v30.AnchorPoint = Vector2.new(0,0)
v30.Position = UDim2.new(0,200,0,200)
v30.Size = UDim2.new(0,400,0,500)
v30.ZIndex = 2
v30.Text = ""
v30.AutoButtonColor = false
v30.Parent = v29

local v31 = PhoenixUI:v23("Frame",false)
v31.BackgroundColor3 = Color3.fromRGB(20,20,20)
v31.Position = UDim2.new(0,1,0,1)
v31.Size = UDim2.new(1,-2,1,-2)
v31.ZIndex = 2
v31.Parent = v30

local v32 = PhoenixUI:v23("Frame",false)
v32.BackgroundColor3 = Color3.fromRGB(30,30,30)
v32.Position = UDim2.new(0,5,0,5)
v32.Size = UDim2.new(1,-10,1,-10)
v32.ZIndex = 3
v32.Parent = v31

local v33 = PhoenixUI:v23("Frame",false)
v33.BackgroundTransparency = 1
v33.Size = UDim2.new(1,0,1,0)
v33.ZIndex = 4
v33.Parent = v32

v28.Elements = {
Main = v30,
Content = v33
}

PhoenixUI.Holder = v30
return setmetatable(v28,PhoenixUI)
end

function PhoenixUI:Page(v34)
v34 = v34 or {}
local v35 = {
Name = v34.Name or "Page",
Window = self,
Open = false,
Elements = {}
}

local v36 = PhoenixUI:v23("ScrollingFrame",false)
v36.BackgroundTransparency = 1
v36.Size = UDim2.new(1,0,1,0)
v36.Visible = false
v36.ScrollBarThickness = 4
v36.ScrollBarImageColor3 = PhoenixUI.Accent
v36.Parent = self.Elements.Content

local v37 = PhoenixUI:v23("UIListLayout",false)
v37.Padding = UDim.new(0,8)
v37.SortOrder = Enum.SortOrder.LayoutOrder
v37.Parent = v36

local v38 = PhoenixUI:v23("UIPadding",false)
v38.PaddingLeft = UDim.new(0,5)
v38.PaddingTop = UDim.new(0,5)
v38.Parent = v36

function v35:v39(v40)
v35.Open = v40
v36.Visible = v40
end

v35.Elements = {
Frame = v36,
Layout = v37
}

if #self.Pages == 0 then
v35:v39(true)
end

self.Pages[#self.Pages + 1] = v35
return setmetatable(v35,{__index = PhoenixUI})
end

function PhoenixUI:Checkbox(v41)
v41 = v41 or {}
local v42 = {
Text = v41.Text or "Checkbox",
Default = v41.Default or false,
Flag = v41.Flag,
Callback = v41.Callback or function() end
}

local v43 = PhoenixUI:v23("TextButton",false)
v43.BackgroundColor3 = Color3.fromRGB(40,40,40)
v43.Size = UDim2.new(1,-10,0,25)
v43.Text = ""
v43.AutoButtonColor = false

local v44 = PhoenixUI:v23("Frame",false)
v44.BackgroundColor3 = Color3.fromRGB(60,60,60)
v44.Position = UDim2.new(0,5,0,5)
v44.Size = UDim2.new(0,15,0,15)
v44.Parent = v43

local v45 = PhoenixUI:v23("TextLabel",false)
v45.BackgroundTransparency = 1
v45.Text = v42.Text
v45.TextColor3 = Color3.fromRGB(255,255,255)
v45.Font = PhoenixUI.UIFont
v45.TextSize = 12
v45.Position = UDim2.new(0,25,0,0)
v45.Size = UDim2.new(1,-25,1,0)
v45.TextXAlignment = Enum.TextXAlignment.Left
v45.Parent = v43

local v46 = PhoenixUI:v23("Frame",true)
v46.BackgroundColor3 = PhoenixUI.Accent
v46.Position = UDim2.new(0,2,0,2)
v46.Size = UDim2.new(1,-4,1,-4)
v46.Visible = v42.Default
v46.Parent = v44

function v42:Set(v47)
v46.Visible = v47
if v42.Flag then
PhoenixUI.Flags[v42.Flag] = v47
end
v42.Callback(v47)
end

function v42:Toggle()
v42:Set(not v46.Visible)
end

PhoenixUI:v6(v43.MouseButton1Click,function()
v42:Toggle()
end)

if v42.Flag then
PhoenixUI.Flags[v42.Flag] = v42.Default
end

v42:Set(v42.Default)
v43.Parent = self.Elements.Frame
return v42
end

function PhoenixUI:Button(v48)
v48 = v48 or {}
local v49 = {
Text = v48.Text or "Button",
Callback = v48.Callback or function() end
}

local v50 = PhoenixUI:v23("TextButton",true)
v50.BackgroundColor3 = PhoenixUI.Accent
v50.Size = UDim2.new(1,-10,0,30)
v50.Text = v49.Text
v50.TextColor3 = Color3.fromRGB(255,255,255)
v50.Font = PhoenixUI.UIFont
v50.TextSize = 12
v50.AutoButtonColor = false

local v51 = false

PhoenixUI:v6(v50.MouseButton1Down,function()
v51 = true
v50.BackgroundColor3 = PhoenixUI.Accent:Lerp(Color3.new(0,0,0),0.3)
end)

PhoenixUI:v6(v50.MouseButton1Up,function()
if v51 then
v51 = false
v50.BackgroundColor3 = PhoenixUI.Accent
v49.Callback()
end
end)

PhoenixUI:v6(v50.MouseLeave,function()
if v51 then
v51 = false
v50.BackgroundColor3 = PhoenixUI.Accent
end
end)

v50.Parent = self.Elements.Frame
return v49
end

function PhoenixUI:Textbox(v52)
v52 = v52 or {}
local v53 = {
Text = v52.Text or "",
Placeholder = v52.Placeholder or "Enter text...",
Flag = v52.Flag,
Callback = v52.Callback or function() end
}

local v54 = PhoenixUI:v23("Frame",false)
v54.BackgroundColor3 = Color3.fromRGB(40,40,40)
v54.Size = UDim2.new(1,-10,0,30)

local v55 = PhoenixUI:v23("TextBox",false)
v55.BackgroundTransparency = 1
v55.Size = UDim2.new(1,-10,1,0)
v55.Position = UDim2.new(0,5,0,0)
v55.Text = v53.Text
v55.PlaceholderText = v53.Placeholder
v55.TextColor3 = Color3.fromRGB(255,255,255)
v55.Font = PhoenixUI.UIFont
v55.TextSize = 12
v55.TextXAlignment = Enum.TextXAlignment.Left
v55.ClearTextOnFocus = false
v55.Parent = v54

local v56 = PhoenixUI:v23("Frame",true)
v56.BackgroundColor3 = PhoenixUI.Accent
v56.Size = UDim2.new(1,0,0,1)
v56.Position = UDim2.new(0,0,1,0)
v56.Parent = v54

function v53:Set(v57)
v55.Text = v57
if v53.Flag then
PhoenixUI.Flags[v53.Flag] = v57
end
v53.Callback(v57)
end

PhoenixUI:v6(v55.FocusLost,function()
v53:Set(v55.Text)
end)

if v53.Flag then
PhoenixUI.Flags[v53.Flag] = v53.Text
end

v54.Parent = self.Elements.Frame
return v53
end

function PhoenixUI:Colorpicker(v58)
v58 = v58 or {}
local v59 = {
Color = v58.Color or PhoenixUI.Accent,
Flag = v58.Flag,
Callback = v58.Callback or function() end
}

local v60 = PhoenixUI:v23("TextButton",false)
v60.BackgroundColor3 = Color3.fromRGB(40,40,40)
v60.Size = UDim2.new(1,-10,0,25)
v60.Text = ""
v60.AutoButtonColor = false

local v61 = PhoenixUI:v23("TextLabel",false)
v61.BackgroundTransparency = 1
v61.Text = "Color"
v61.TextColor3 = Color3.fromRGB(255,255,255)
v61.Font = PhoenixUI.UIFont
v61.TextSize = 12
v61.Position = UDim2.new(0,5,0,0)
v61.Size = UDim2.new(0,40,1,0)
v61.TextXAlignment = Enum.TextXAlignment.Left
v61.Parent = v60

local v62 = PhoenixUI:v23("TextButton",false)
v62.BackgroundColor3 = v59.Color
v62.BorderSizePixel = 0
v62.Position = UDim2.new(0,50,0,5)
v62.Size = UDim2.new(0,60,0,15)
v62.Text = ""
v62.AutoButtonColor = false
v62.Parent = v60

local v63 = PhoenixUI:v23("Frame",false)
v63.BackgroundColor3 = Color3.fromRGB(50,50,50)
v63.Position = UDim2.new(1,-180,1,2)
v63.Size = UDim2.new(0,170,0,150)
v63.ZIndex = 10
v63.Visible = false
v63.Parent = v60

local v64 = PhoenixUI:v23("Frame",false)
v64.BackgroundColor3 = Color3.fromRGB(25,25,25)
v64.Position = UDim2.new(0,1,0,1)
v64.Size = UDim2.new(1,-2,1,-2)
v64.Parent = v63

local v65 = PhoenixUI:v23("TextButton",false)
v65.BackgroundColor3 = v59.Color
v65.BorderSizePixel = 0
v65.Position = UDim2.new(0,5,0,5)
v65.Size = UDim2.new(1,-35,1,-10)
v65.Text = ""
v65.AutoButtonColor = false
v65.Parent = v64

local v66 = PhoenixUI:v23("ImageLabel",false)
v66.Image = "rbxassetid://14204231522"
v66.BackgroundTransparency = 1
v66.Size = UDim2.new(1,0,1,0)
v66.Parent = v65

local v67 = PhoenixUI:v23("ImageButton",false)
v67.Image = "rbxassetid://14204232622"
v67.BackgroundTransparency = 1
v67.Position = UDim2.new(1,-15,0,5)
v67.Size = UDim2.new(0,10,1,-10)
v67.AutoButtonColor = false
v67.Parent = v64

local v68 = false
local v69 = false
local v70,v71,v72 = v59.Color:ToHSV()

local function v73()
local v74 = Color3.fromHSV(v70,v71,v72)
v62.BackgroundColor3 = v74
v65.BackgroundColor3 = Color3.fromHSV(v70,1,1)
if v59.Flag then
PhoenixUI.Flags[v59.Flag] = v74
end
v59.Callback(v74)
end

function v59:Set(v75)
v70,v71,v72 = v75:ToHSV()
v73()
end

PhoenixUI:v6(v62.MouseButton1Click,function()
v63.Visible = not v63.Visible
end)

PhoenixUI:v6(v65.InputBegan,function(v76)
if v76.UserInputType == Enum.UserInputType.MouseButton1 then
v68 = true
end
end)

PhoenixUI:v6(v65.InputEnded,function(v77)
if v77.UserInputType == Enum.UserInputType.MouseButton1 then
v68 = false
end
end)

PhoenixUI:v6(v67.InputBegan,function(v78)
if v78.UserInputType == Enum.UserInputType.MouseButton1 then
v69 = true
end
end)

PhoenixUI:v6(v67.InputEnded,function(v79)
if v79.UserInputType == Enum.UserInputType.MouseButton1 then
v69 = false
end
end)

PhoenixUI:v6(v4.InputChanged,function(v80)
if v80.UserInputType == Enum.UserInputType.MouseMovement then
if v68 then
local v81 = v80.Position
local v82 = v81 - v65.AbsolutePosition
v71 = math.clamp(v82.X / v65.AbsoluteSize.X,0,1)
v72 = math.clamp(v82.Y / v65.AbsoluteSize.Y,0,1)
v73()
elseif v69 then
local v83 = v80.Position
local v84 = v83 - v67.AbsolutePosition
v70 = math.clamp(v84.Y / v67.AbsoluteSize.Y,0,1)
v73()
end
end
end)

PhoenixUI:v6(v4.InputBegan,function(v85)
if v85.UserInputType == Enum.UserInputType.MouseButton1 and v63.Visible then
if not PhoenixUI:v15(v63) and not PhoenixUI:v15(v62) then
v63.Visible = false
end
end
end)

if v59.Flag then
PhoenixUI.Flags[v59.Flag] = v59.Color
end

v60.Parent = self.Elements.Frame
return v59
end

function PhoenixUI:Label(v86)
v86 = v86 or {}
local v87 = {
Text = v86.Text or "Label"
}

local v88 = PhoenixUI:v23("TextLabel",false)
v88.BackgroundTransparency = 1
v88.Size = UDim2.new(1,-10,0,20)
v88.Text = v87.Text
v88.TextColor3 = Color3.fromRGB(255,255,255)
v88.Font = PhoenixUI.UIFont
v88.TextSize = 12
v88.TextXAlignment = Enum.TextXAlignment.Left
v88.Parent = self.Elements.Frame

function v87:Set(v89)
v88.Text = v89
end

return v87
end

return PhoenixUI
