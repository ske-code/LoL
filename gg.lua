local PhoenixUI = {}
PhoenixUI.Open = true
PhoenixUI.Accent = Color3.fromRGB(255, 182, 193)
PhoenixUI.ThemeObjects = {}
PhoenixUI.Flags = {}
PhoenixUI.Holder = nil
PhoenixUI.ScreenGUI = nil
PhoenixUI.UIFont = Font.new("rbxassetid://12187371840")
PhoenixUI.Watermarks = {}

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

function PhoenixUI:v15(v16,v17)
    local v18,v19 = v16.AbsolutePosition,v16.AbsoluteSize
    if v17 then
        return v17.X >= v18.X and v17.X <= v18.X + v19.X and v17.Y >= v18.Y and v17.Y <= v18.Y + v19.Y
    else
        return v2.X >= v18.X and v2.X <= v18.X + v19.X and v2.Y >= v18.Y and v2.Y <= v18.Y + v19.Y
    end
end

function PhoenixUI:v20(v21)
    PhoenixUI.Accent = v21
    for v22,v23 in next,PhoenixUI.ThemeObjects do
        if v23:IsA("Frame") or v23:IsA("TextButton") then
            v23.BackgroundColor3 = v21
        elseif v23:IsA("TextLabel") then
            v23.TextColor3 = v21
        elseif v23:IsA("ImageLabel") or v23:IsA("ImageButton") then
            v23.ImageColor3 = v21
        elseif v23:IsA("UIStroke") then
            v23.Color = v21
        end
    end
end

function PhoenixUI:v24(v25,v26)
    local v27 = Instance.new(v25)
    if v26 then
        table.insert(PhoenixUI.ThemeObjects,v27)
        if v27:IsA("Frame") or v27:IsA("TextButton") then
            v27.BackgroundColor3 = PhoenixUI.Accent
        elseif v27:IsA("TextLabel") then
            v27.TextColor3 = PhoenixUI.Accent
        elseif v27:IsA("ImageLabel") then
            v27.ImageColor3 = PhoenixUI.Accent
        elseif v27:IsA("UIStroke") then
            v27.Color = PhoenixUI.Accent
        end
    end
    return v27
end

function PhoenixUI:Window(v28)
    local v29 = {
        Pages = {},
        Elements = {},
        Name = v28.Name or "PhoenixUI",
        Dragging = false,
        DragOffset = Vector2.new(0,0)
    }
    
    local v30 = Instance.new("ScreenGui")
    v30.Name = "PhoenixUIMain"
    v30.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    v30.Parent = game:GetService("RunService"):IsStudio() and v1.PlayerGui or game.CoreGui
    PhoenixUI.ScreenGUI = v30

    local v31 = PhoenixUI:v24("TextButton",true)
    v31.Name = "MainFrame"
    v31.AnchorPoint = Vector2.new(0.5,0.5)
    v31.Position = UDim2.new(0.5,0,0.5,0)
    v31.Size = UDim2.new(0,650,0,700)
    v31.BorderSizePixel = 0
    v31.Text = ""
    v31.AutoButtonColor = false
    v31.Parent = v30

    local v32 = PhoenixUI:v24("Frame",false)
    v32.BackgroundColor3 = Color3.fromRGB(15,15,15)
    v32.Size = UDim2.new(1,0,1,0)
    v32.Parent = v31

    local v33 = PhoenixUI:v24("Frame",true)
    v33.BackgroundColor3 = PhoenixUI.Accent
    v33.Size = UDim2.new(1,0,0,2)
    v33.Parent = v32

    local v34 = PhoenixUI:v24("TextLabel",false)
    v34.Text = v29.Name
    v34.TextColor3 = Color3.fromRGB(255,255,255)
    v34.FontFace = PhoenixUI.UIFont
    v34.TextSize = 16
    v34.BackgroundTransparency = 1
    v34.Position = UDim2.new(0,15,0,8)
    v34.Size = UDim2.new(1,-30,0,25)
    v34.TextXAlignment = Enum.TextXAlignment.Left
    v34.Parent = v32

    local v35 = PhoenixUI:v24("Frame",false)
    v35.BackgroundColor3 = Color3.fromRGB(25,25,25)
    v35.Position = UDim2.new(0,10,0,40)
    v35.Size = UDim2.new(1,-20,0,30)
    v35.BorderSizePixel = 0
    v35.Parent = v32

    local v36 = PhoenixUI:v24("UIListLayout",false)
    v36.FillDirection = Enum.FillDirection.Horizontal
    v36.Padding = UDim.new(0,5)
    v36.SortOrder = Enum.SortOrder.LayoutOrder
    v36.Parent = v35

    local v37 = PhoenixUI:v24("UIPadding",false)
    v37.PaddingLeft = UDim.new(0,10)
    v37.PaddingTop = UDim.new(0,5)
    v37.Parent = v35

    local v38 = PhoenixUI:v24("ScrollingFrame",false)
    v38.BackgroundColor3 = Color3.fromRGB(30,30,30)
    v38.Position = UDim2.new(0,10,0,80)
    v38.Size = UDim2.new(1,-20,1,-90)
    v38.ScrollBarThickness = 6
    v38.ScrollBarImageColor3 = PhoenixUI.Accent
    v38.AutomaticCanvasSize = Enum.AutomaticSize.Y
    v38.Parent = v32

    local v39 = PhoenixUI:v24("Frame",false)
    v39.BackgroundTransparency = 1
    v39.Size = UDim2.new(1,0,0,0)
    v39.BorderSizePixel = 0
    v39.AutomaticSize = Enum.AutomaticSize.Y
    v39.Parent = v38

    local v40 = PhoenixUI:v24("UIListLayout",false)
    v40.Padding = UDim.new(0,10)
    v40.SortOrder = Enum.SortOrder.LayoutOrder
    v40.Parent = v39

    local v41 = PhoenixUI:v24("UIPadding",false)
    v41.PaddingLeft = UDim.new(0,10)
    v41.PaddingTop = UDim.new(0,10)
    v41.PaddingRight = UDim.new(0,10)
    v41.Parent = v39

    v29.Elements = {
        Main = v31,
        TabContainer = v35,
        ContentScroll = v38,
        ContentContainer = v39
    }

    PhoenixUI.Holder = v31

    PhoenixUI:v6(v31.InputBegan,function(v42)
        if v42.UserInputType == Enum.UserInputType.MouseButton1 or v42.UserInputType == Enum.UserInputType.Touch then
            v29.Dragging = true
            local v43 = v42.UserInputType == Enum.UserInputType.MouseButton1 and v4:GetMouseLocation() or v42.Position
            v29.DragOffset = Vector2.new(v43.X - v31.AbsolutePosition.X, v43.Y - v31.AbsolutePosition.Y)
        end
    end)

    PhoenixUI:v6(v4.InputChanged,function(v44)
        if v29.Dragging and (v44.UserInputType == Enum.UserInputType.MouseMovement or v44.UserInputType == Enum.UserInputType.Touch) then
            local v45 = v44.UserInputType == Enum.UserInputType.MouseMovement and v4:GetMouseLocation() or v44.Position
            v31.Position = UDim2.new(0, v45.X - v29.DragOffset.X + (v31.Size.X.Offset * v31.AnchorPoint.X), 0, v45.Y - v29.DragOffset.Y + (v31.Size.Y.Offset * v31.AnchorPoint.Y))
        end
    end)

    PhoenixUI:v6(v4.InputEnded,function(v46)
        if v46.UserInputType == Enum.UserInputType.MouseButton1 or v46.UserInputType == Enum.UserInputType.Touch then
            v29.Dragging = false
        end
    end)

    function v29:Page(v47)
        v47 = v47 or {}
        local v48 = {
            Name = v47.Name or "Page",
            Window = self,
            Open = false,
            Sections = {},
            Elements = {}
        }

        local v49 = PhoenixUI:v24("TextButton",false)
        v49.BackgroundColor3 = Color3.fromRGB(40,40,40)
        v49.Size = UDim2.new(0,100,1,-10)
        v49.Text = v48.Name
        v49.TextColor3 = Color3.fromRGB(200,200,200)
        v49.FontFace = PhoenixUI.UIFont
        v49.TextSize = 12
        v49.AutoButtonColor = false
        v49.Parent = self.Elements.TabContainer

        local v50 = PhoenixUI:v24("Frame",true)
        v50.BackgroundColor3 = PhoenixUI.Accent
        v50.Size = UDim2.new(0,3,1,0)
        v50.Visible = false
        v50.BorderSizePixel = 0
        v50.Parent = v49

        local v51 = PhoenixUI:v24("ScrollingFrame",false)
        v51.BackgroundTransparency = 1
        v51.Size = UDim2.new(1,0,1,0)
        v51.Visible = false
        v51.ScrollBarThickness = 6
        v51.ScrollBarImageColor3 = PhoenixUI.Accent
        v51.AutomaticCanvasSize = Enum.AutomaticSize.Y
        v51.Parent = self.Elements.ContentContainer

        local v52 = PhoenixUI:v24("Frame",false)
        v52.BackgroundTransparency = 1
        v52.Size = UDim2.new(1,0,0,0)
        v52.AutomaticSize = Enum.AutomaticSize.Y
        v52.BorderSizePixel = 0
        v52.Parent = v51

        local v53 = PhoenixUI:v24("UIListLayout",false)
        v53.Padding = UDim.new(0,15)
        v53.SortOrder = Enum.SortOrder.LayoutOrder
        v53.Parent = v52

        local v54 = PhoenixUI:v24("UIPadding",false)
        v54.PaddingLeft = UDim.new(0,5)
        v54.PaddingTop = UDim.new(0,5)
        v54.PaddingRight = UDim.new(0,5)
        v54.Parent = v52

        function v48:SetActive(v55)
            v48.Open = v55
            v51.Visible = v55
            v50.Visible = v55
            if v55 then
                v49.BackgroundColor3 = Color3.fromRGB(50,50,50)
                v49.TextColor3 = Color3.fromRGB(255,255,255)
            else
                v49.BackgroundColor3 = Color3.fromRGB(40,40,40)
                v49.TextColor3 = Color3.fromRGB(200,200,200)
            end
        end

        local function v56()
            PhoenixUI:v6(v49.MouseButton1Click,function()
                for v57,v58 in pairs(v29.Pages) do
                    if v58 ~= v48 then
                        v58:SetActive(false)
                    end
                end
                v48:SetActive(true)
            end)
            
            PhoenixUI:v6(v49.TouchTap,function()
                for v59,v60 in pairs(v29.Pages) do
                    if v60 ~= v48 then
                        v60:SetActive(false)
                    end
                end
                v48:SetActive(true)
            end)
        end
        v56()

        function v48:Section(v61)
                v61 = v61 or {}
                local v62 = {
                    Name = v61.Name or "Section",
                    Page = self,
                    Side = v61.Side or "Left",
                    Elements = {}
                }

                if not self.Elements.LeftContainer then
                    self.Elements.LeftContainer = PhoenixUI:v24("Frame",false)
                    self.Elements.LeftContainer.BackgroundTransparency = 1
                    self.Elements.LeftContainer.Size = UDim2.new(0.48,0,0,0)
                    self.Elements.LeftContainer.AutomaticSize = Enum.AutomaticSize.Y
                    self.Elements.LeftContainer.LayoutOrder = 1
                    self.Elements.LeftContainer.Parent = v52
                    
                    local v200 = PhoenixUI:v24("UIListLayout",false)
                    v200.Padding = UDim.new(0,15)
                    v200.SortOrder = Enum.SortOrder.LayoutOrder
                    v200.Parent = self.Elements.LeftContainer
                    
                    local v201 = PhoenixUI:v24("UIPadding",false)
                    v201.PaddingBottom = UDim.new(0,5)
                    v201.Parent = self.Elements.LeftContainer
                end
                
                if not self.Elements.RightContainer then
                    self.Elements.RightContainer = PhoenixUI:v24("Frame",false)
                    self.Elements.RightContainer.BackgroundTransparency = 1
                    self.Elements.RightContainer.Size = UDim2.new(0.48,0,0,0)
                    self.Elements.RightContainer.AutomaticSize = Enum.AutomaticSize.Y
                    self.Elements.RightContainer.LayoutOrder = 2
                    self.Elements.RightContainer.Parent = v52
                    
                    local v202 = PhoenixUI:v24("UIListLayout",false)
                    v202.Padding = UDim.new(0,15)
                    v202.SortOrder = Enum.SortOrder.LayoutOrder
                    v202.Parent = self.Elements.RightContainer
                    
                    local v203 = PhoenixUI:v24("UIPadding",false)
                    v203.PaddingBottom = UDim.new(0,5)
                    v203.Parent = self.Elements.RightContainer
                end

                if not v52:FindFirstChild("PageLayout") then
                    local v204 = PhoenixUI:v24("UIListLayout",false)
                    v204.Name = "PageLayout"
                    v204.FillDirection = Enum.FillDirection.Horizontal
                    v204.Padding = UDim.new(0,10)
                    v204.SortOrder = Enum.SortOrder.LayoutOrder
                    v204.HorizontalAlignment = Enum.HorizontalAlignment.Center
                    v204.VerticalAlignment = Enum.VerticalAlignment.Top
                    v204.Parent = v52
                end

                local v63 = PhoenixUI:v24("Frame",false)
                v63.BackgroundColor3 = Color3.fromRGB(35,35,35)
                v63.Size = UDim2.new(1,0,0,0)
                v63.AutomaticSize = Enum.AutomaticSize.Y
                v63.BorderSizePixel = 0

                if v62.Side == "Right" then
                    v63.Parent = self.Elements.RightContainer
                else
                    v63.Parent = self.Elements.LeftContainer
                end

                local v64 = PhoenixUI:v24("TextLabel",false)
                v64.Text = v62.Name
                v64.TextColor3 = Color3.fromRGB(255,255,255)
                v64.FontFace = PhoenixUI.UIFont
                v64.TextSize = 14
                v64.BackgroundTransparency = 1
                v64.Size = UDim2.new(1,-10,0,25)
                v64.Position = UDim2.new(0,5,0,5)
                v64.TextXAlignment = Enum.TextXAlignment.Left
                v64.Parent = v63

                local v65 = PhoenixUI:v24("Frame",true)
                v65.BackgroundColor3 = PhoenixUI.Accent
                v65.Size = UDim2.new(1,0,0,1)
                v65.Position = UDim2.new(0,0,0,30)
                v65.BorderSizePixel = 0
                v65.Parent = v63

                local v66 = PhoenixUI:v24("Frame",false)
                v66.BackgroundTransparency = 1
                v66.Size = UDim2.new(1,0,0,0)
                v66.Position = UDim2.new(0,0,0,35)
                v66.AutomaticSize = Enum.AutomaticSize.Y
                v66.BorderSizePixel = 0
                v66.Parent = v63

                local v68 = PhoenixUI:v24("UIListLayout",false)
                v68.Padding = UDim.new(0,8)
                v68.SortOrder = Enum.SortOrder.LayoutOrder
                v68.Parent = v66

                local v69 = PhoenixUI:v24("UIPadding",false)
                v69.PaddingLeft = UDim.new(0,5)
                v69.PaddingTop = UDim.new(0,5)
                v69.PaddingBottom = UDim.new(0,5)
                v69.Parent = v66

                v62.Elements = {
                    Main = v63,
                    Content = v66
                }

                return v62

            function v62:Checkbox(v69)
                v69 = v69 or {}
                local v70 = {
                    Text = v69.Text or "Checkbox",
                    Default = v69.Default or false,
                    Flag = v69.Flag,
                    Callback = v69.Callback or function() end,
                    Value = v69.Default or false
                }

                local v71 = PhoenixUI:v24("TextButton",false)
                v71.BackgroundColor3 = Color3.fromRGB(45,45,45)
                v71.BorderSizePixel = 0  
                v71.Size = UDim2.new(1,-10,0,25)
                v71.Text = ""
                v71.AutoButtonColor = false
                v71.Parent = v66

                local v72 = PhoenixUI:v24("TextButton",false)
                v72.BackgroundColor3 = v70.Value and PhoenixUI.Accent or Color3.fromRGB(100,100,100)
                v72.BorderSizePixel = 0 
                v72.Position = UDim2.new(0,5,0,5)
                v72.Size = UDim2.new(0,15,0,15)
                v72.Text = ""
                v72.AutoButtonColor = false
                v72.Parent = v71

                local v73 = PhoenixUI:v24("TextLabel",false)
                v73.Text = v70.Text
                v73.TextColor3 = Color3.fromRGB(255,255,255)
                v73.FontFace = PhoenixUI.UIFont
                v73.TextSize = 12
                v73.BackgroundTransparency = 1
                v73.Position = UDim2.new(0,25,0,0)
                v73.Size = UDim2.new(1,-25,1,0)
                v73.TextXAlignment = Enum.TextXAlignment.Left
                v73.Parent = v71

                function v70:Toggle()
                    v70.Value = not v70.Value
                    if v70.Value then
                        v72.BackgroundColor3 = PhoenixUI.Accent
                    else
                        v72.BackgroundColor3 = Color3.fromRGB(100,100,100)
                    end
                    if v70.Flag then
                        PhoenixUI.Flags[v70.Flag] = v70.Value
                    end
                    v70.Callback(v70.Value)
                end

                PhoenixUI:v6(v72.MouseButton1Click,function()
                    v70:Toggle()
                end)

                if v70.Flag then
                    PhoenixUI.Flags[v70.Flag] = v70.Value
                end

                return v70
            end
            function v62:Button(v77)
                v77 = v77 or {}
                local v78 = {
                    Text = v77.Text or "Button",
                    Callback = v77.Callback or function() end
                }

                local v79 = PhoenixUI:v24("TextButton",true)
                v79.BackgroundColor3 = PhoenixUI.Accent
                v79.Size = UDim2.new(1,-10,0,30)
                v79.Text = v78.Text
                v79.TextColor3 = Color3.fromRGB(255,255,255)
                v79.FontFace = PhoenixUI.UIFont
                v79.TextSize = 12
                v79.AutoButtonColor = false
                v79.Parent = v66

                local function v80()
                    PhoenixUI:v6(v79.MouseButton1Click,function()
                        v78.Callback()
                    end)
                    PhoenixUI:v6(v79.TouchTap,function()
                        v78.Callback()
                    end)
                end
                v80()

                return v78
            end

            function v62:Textbox(v81)
                v81 = v81 or {}
                local v82 = {
                    Text = v81.Text or "",
                    Placeholder = v81.Placeholder or "Enter text...",
                    Flag = v81.Flag,
                    Callback = v81.Callback or function() end
                }

                local v83 = PhoenixUI:v24("Frame",false)
                v83.BackgroundColor3 = Color3.fromRGB(45,45,45)
                v83.Size = UDim2.new(1,-10,0,30)
                v83.Parent = v66

                local v84 = PhoenixUI:v24("TextBox",false)
                v84.BackgroundTransparency = 1
                v84.Size = UDim2.new(1,-10,1,0)
                v84.Position = UDim2.new(0,5,0,0)
                v84.Text = v82.Text
                v84.PlaceholderText = v82.Placeholder
                v84.TextColor3 = Color3.fromRGB(255,255,255)
                v84.FontFace = PhoenixUI.UIFont
                v84.TextSize = 12
                v84.TextXAlignment = Enum.TextXAlignment.Left
                v84.ClearTextOnFocus = false
                v84.Parent = v83

                local v85 = PhoenixUI:v24("Frame",true)
                v85.BackgroundColor3 = PhoenixUI.Accent
                v85.Size = UDim2.new(1,0,0,1)
                v85.Position = UDim2.new(0,0,1,0)
                v85.Parent = v83

                function v82:Set(v86)
                    v84.Text = v86
                    if v82.Flag then
                        PhoenixUI.Flags[v82.Flag] = v86
                    end
                    v82.Callback(v86)
                end

                PhoenixUI:v6(v84.FocusLost,function()
                    v82:Set(v84.Text)
                end)

                if v82.Flag then
                    PhoenixUI.Flags[v82.Flag] = v82.Text
                end

                return v82
            end

            function v62:Label(v87)
                v87 = v87 or {}
                local v88 = {
                    Text = v87.Text or "Label"
                }

                local v89 = PhoenixUI:v24("TextLabel",false)
                v89.BackgroundTransparency = 1
                v89.Size = UDim2.new(1,-10,0,20)
                v89.Text = v88.Text
                v89.TextColor3 = Color3.fromRGB(255,255,255)
                v89.FontFace = PhoenixUI.UIFont
                v89.TextSize = 12
                v89.TextXAlignment = Enum.TextXAlignment.Left
                v89.Parent = v66

                function v88:Set(v90)
                    v89.Text = v90
                end

                return v88
            end
            function v62:Slider(v69)
                v69 = v69 or {}
                local v100 = {
                    Text = v69.Text or "Slider",
                    Min = v69.Min or 0,
                    Max = v69.Max or 100,
                    Default = v69.Default or 0,
                    Flag = v69.Flag,
                    Callback = v69.Callback or function() end,
                    Value = v69.Default or 0
                }

                local v101 = PhoenixUI:v24("Frame",false)
                v101.BackgroundTransparency = 1
                v101.Size = UDim2.new(1,-10,0,40)
                v101.Parent = v66

                local v102 = PhoenixUI:v24("TextLabel",false)
                v102.Text = v100.Text
                v102.TextColor3 = Color3.fromRGB(255,255,255)
                v102.FontFace = PhoenixUI.UIFont
                v102.TextSize = 12
                v102.BackgroundTransparency = 1
                v102.Position = UDim2.new(0,0,0,0)
                v102.Size = UDim2.new(1,0,0,15)
                v102.TextXAlignment = Enum.TextXAlignment.Left
                v102.Parent = v101

                local v103 = PhoenixUI:v24("TextLabel",false)
                v103.Text = tostring(v100.Value)
                v103.TextColor3 = Color3.fromRGB(255,255,255)
                v103.FontFace = PhoenixUI.UIFont
                v103.TextSize = 12
                v103.BackgroundTransparency = 1
                v103.AnchorPoint = Vector2.new(1,0)
                v103.Position = UDim2.new(1,0,0,0)
                v103.Size = UDim2.new(0,50,0,15)
                v103.TextXAlignment = Enum.TextXAlignment.Right
                v103.Parent = v101

                local v104 = PhoenixUI:v24("Frame",false)
                v104.BackgroundColor3 = Color3.fromRGB(45,45,45)
                v104.BorderSizePixel = 0
                v104.Size = UDim2.new(1,0,0,8)
                v104.Position = UDim2.new(0,0,0,25)
                v104.Parent = v101

                local v105 = PhoenixUI:v24("Frame",false)
                v105.BackgroundColor3 = PhoenixUI.Accent or Color3.fromRGB(0,170,255)
                v105.BorderSizePixel = 0
                v105.Size = UDim2.new((v100.Value - v100.Min) / (v100.Max - v100.Min),0,1,0)
                v105.Parent = v104

                local v106 = PhoenixUI:v24("Frame",false)
                v106.BackgroundColor3 = Color3.fromRGB(255,255,255)
                v106.BorderSizePixel = 0
                v106.Size = UDim2.new(0,10,0,10)
                v106.Position = UDim2.new((v100.Value - v100.Min) / (v100.Max - v100.Min),-5,0.5,-5)
                v106.Parent = v104

                local v107 = false

                local function v108(v109)
                    local v110 = math.clamp(v109.X, v104.AbsolutePosition.X, v104.AbsolutePosition.X + v104.AbsoluteSize.X)
                    local v111 = v110 - v104.AbsolutePosition.X
                    local v112 = (v111 / v104.AbsoluteSize.X) * (v100.Max - v100.Min) + v100.Min
                    v100.Value = math.clamp(math.floor(v112 * 100) / 100, v100.Min, v100.Max)
                    v105.Size = UDim2.new((v100.Value - v100.Min) / (v100.Max - v100.Min),0,1,0)
                    v106.Position = UDim2.new((v100.Value - v100.Min) / (v100.Max - v100.Min),-5,0.5,-5)
                    v103.Text = tostring(v100.Value)
                    if v100.Flag then
                        PhoenixUI.Flags[v100.Flag] = v100.Value
                    end
                    v100.Callback(v100.Value)
                end

                PhoenixUI:v6(v106.InputBegan,function(v113)
                    if v113.UserInputType == Enum.UserInputType.MouseButton1 or v113.UserInputType == Enum.UserInputType.Touch then
                        v107 = true
                    end
                end)

                PhoenixUI:v6(v4.InputChanged,function(v114)
                    if v107 and (v114.UserInputType == Enum.UserInputType.MouseMovement or v114.UserInputType == Enum.UserInputType.Touch) then
                        v108(v114.Position)
                    end
                end)

                PhoenixUI:v6(v4.InputEnded,function(v115)
                    if v115.UserInputType == Enum.UserInputType.MouseButton1 or v115.UserInputType == Enum.UserInputType.Touch then
                        v107 = false
                    end
                end)

                PhoenixUI:v6(v104.InputBegan,function(v116)
                    if v116.UserInputType == Enum.UserInputType.MouseButton1 or v116.UserInputType == Enum.UserInputType.Touch then
                        v108(v116.Position)
                        v107 = true
                    end
                end)

                function v100:Set(v117)
                    v100.Value = math.clamp(math.floor(v117 * 100) / 100, v100.Min, v100.Max)
                    v105.Size = UDim2.new((v100.Value - v100.Min) / (v100.Max - v100.Min),0,1,0)
                    v106.Position = UDim2.new((v100.Value - v100.Min) / (v100.Max - v100.Min),-5,0.5,-5)
                    v103.Text = tostring(v100.Value)
                    if v100.Flag then
                        PhoenixUI.Flags[v100.Flag] = v100.Value
                    end
                    v100.Callback(v100.Value)
                end

                if v100.Flag then
                    PhoenixUI.Flags[v100.Flag] = v100.Value
                end

                return v100
            end
            function v62:Dropdown(v69)
                v69 = v69 or {}
                local v100 = {
                    Text = v69.Text or "Dropdown",
                    Options = v69.Options or {},
                    Multi = v69.Multi or false,
                    Default = v69.Default,
                    Flag = v69.Flag,
                    Callback = v69.Callback or function() end,
                    Value = v69.Multi and {} or nil,
                    Open = false
                }

                local v101 = PhoenixUI:v24("Frame",false)
                v101.BackgroundTransparency = 1
                v101.Size = UDim2.new(1,-10,0,30)
                v101.Parent = v66

                local v102 = PhoenixUI:v24("TextButton",false)
                v102.BackgroundColor3 = Color3.fromRGB(45,45,45)
                v102.BorderSizePixel = 0
                v102.Size = UDim2.new(1,0,0,25)
                v102.Text = ""
                v102.AutoButtonColor = false
                v102.Parent = v101

                local v103 = PhoenixUI:v24("TextLabel",false)
                v103.Text = v100.Text
                v103.TextColor3 = Color3.fromRGB(255,255,255)
                v103.FontFace = PhoenixUI.UIFont
                v103.TextSize = 12
                v103.BackgroundTransparency = 1
                v103.Position = UDim2.new(0,5,0,0)
                v103.Size = UDim2.new(1,-25,1,0)
                v103.TextXAlignment = Enum.TextXAlignment.Left
                v103.Parent = v102

                local v104 = PhoenixUI:v24("Frame",false)
                v104.BackgroundColor3 = Color3.fromRGB(35,35,35)
                v104.BorderSizePixel = 0
                v104.Position = UDim2.new(0,0,1,0)
                v104.Size = UDim2.new(1,0,0,0)
                v104.Visible = false
                v104.AutomaticSize = Enum.AutomaticSize.Y
                v104.Parent = v102

                local v105 = PhoenixUI:v24("UIListLayout",false)
                v105.Padding = UDim.new(0,2)
                v105.SortOrder = Enum.SortOrder.LayoutOrder
                v105.Parent = v104

                local function UpdateDisplay()
                    if v100.Multi then
                        local texts = {}
                        for _,val in pairs(v100.Value) do
                            table.insert(texts,tostring(val))
                        end
                        v103.Text = v100.Text.." : "..table.concat(texts,", ")
                    else
                        v103.Text = v100.Text.." : "..tostring(v100.Value or "")
                    end
                end

                local function SelectOption(option)
                    if v100.Multi then
                        if table.find(v100.Value,option) then
                            for i,v in ipairs(v100.Value) do
                                if v == option then
                                    table.remove(v100.Value,i)
                                    break
                                end
                            end
                        else
                            table.insert(v100.Value,option)
                        end
                    else
                        v100.Value = option
                        v100.Open = false
                        v104.Visible = false
                        v101.Size = UDim2.new(1,-10,0,30)
                    end
                    if v100.Flag then
                        PhoenixUI.Flags[v100.Flag] = v100.Value
                    end
                    UpdateDisplay()
                    v100.Callback(v100.Value)
                end

                for _,opt in ipairs(v100.Options) do
                    local v106 = PhoenixUI:v24("TextButton",false)
                    v106.BackgroundColor3 = Color3.fromRGB(55,55,55)
                    v106.BorderSizePixel = 0
                    v106.Size = UDim2.new(1,0,0,20)
                    v106.TextColor3 = Color3.fromRGB(255,255,255)
                    v106.Text = tostring(opt)
                    v106.FontFace = PhoenixUI.UIFont
                    v106.TextSize = 12
                    v106.Parent = v104

                    PhoenixUI:v6(v106.MouseButton1Click,function()
                        SelectOption(opt)
                    end)
                end

                PhoenixUI:v6(v102.MouseButton1Click,function()
                    v100.Open = not v100.Open
                    v104.Visible = v100.Open
                    if v100.Open then
                        v101.Size = UDim2.new(1,-10,0,30 + v104.AbsoluteSize.Y)
                    else
                        v101.Size = UDim2.new(1,-10,0,30)
                    end
                end)

            
                if v100.Multi and type(v100.Default) == "table" then
                    v100.Value = v100.Default
                elseif not v100.Multi then
                    v100.Value = v100.Default
                end
                if v100.Flag then
                    PhoenixUI.Flags[v100.Flag] = v100.Value
                end
                UpdateDisplay()

                return v100
            end
                 
            v48.Sections[#v48.Sections + 1] = v62
            return v62
        end

        if #v29.Pages == 0 then
            v48:SetActive(true)
        end

        v29.Pages[#v29.Pages + 1] = v48
        return v48
    end

    function v29:Watermark(v91)
        v91 = v91 or {}
        local v92 = {
            Text = v91.Text or "PhoenixUI",
            Visible = true
        }

        local v93 = PhoenixUI:v24("Frame",false)
        v93.BackgroundColor3 = Color3.fromRGB(50,50,50)
        v93.Position = UDim2.new(0,10,0,10)
        v93.Size = UDim2.new(0,0,0,25)
        v93.AutomaticSize = Enum.AutomaticSize.X
        v93.Parent = PhoenixUI.ScreenGUI

        local v94 = PhoenixUI:v24("Frame",false)
        v94.BackgroundColor3 = Color3.fromRGB(20,20,20)
        v94.Position = UDim2.new(0,1,0,1)
        v94.Size = UDim2.new(1,-2,1,-2)
        v94.Parent = v93

        local v95 = PhoenixUI:v24("TextLabel",false)
        v95.Text = v92.Text
        v95.TextColor3 = Color3.fromRGB(255,255,255)
        v95.FontFace = PhoenixUI.UIFont
        v95.TextSize = 12
        v95.BackgroundTransparency = 1
        v95.Size = UDim2.new(1,0,1,0)
        v95.TextXAlignment = Enum.TextXAlignment.Center
        v95.Parent = v94

        local v96 = PhoenixUI:v24("Frame",true)
        v96.BackgroundColor3 = PhoenixUI.Accent
        v96.Size = UDim2.new(1,0,0,2)
        v96.Parent = v93

        function v92:SetText(v97)
            v95.Text = v97
        end

        function v92:SetVisible(v98)
            v93.Visible = v98
        end

        table.insert(PhoenixUI.Watermarks,v92)
        return v92
    end

    return v29
end

return PhoenixUI
