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

            local v63 = PhoenixUI:v24("Frame",false)
            v63.BackgroundColor3 = Color3.fromRGB(35,35,35)
            v63.Size = UDim2.new(0.48,0,0,0)
            v63.AutomaticSize = Enum.AutomaticSize.Y
            v63.BorderSizePixel = 0
            v63.Parent = v52

            local v67 = PhoenixUI:v24("UIListLayout",false)
            v67.FillDirection = Enum.FillDirection.Horizontal
            v67.Padding = UDim.new(0,10)
            v67.SortOrder = Enum.SortOrder.LayoutOrder
            v67.Parent = v52

            if v62.Side == "Right" then
                v63.LayoutOrder = 2
            else
                v63.LayoutOrder = 1
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
function v62:Slider(v99)
    v99 = v99 or {}
    local v100 = {
        Text = v99.Text or "Slider",
        Min = v99.Min or 0,
        Max = v99.Max or 100,
        Default = v99.Default or 50,
        Precise = v99.Precise or false,
        Flag = v99.Flag,
        Callback = v99.Callback or function() end,
        Value = v99.Default or 50
    }

    local v101 = PhoenixUI:v24("Frame",false)
    v101.BackgroundColor3 = Color3.fromRGB(45,45,45)
    v101.Size = UDim2.new(1,-10,0,50)
    v101.Parent = v66

    local v102 = PhoenixUI:v24("TextLabel",false)
    v102.Text = v100.Text
    v102.TextColor3 = Color3.fromRGB(255,255,255)
    v102.FontFace = PhoenixUI.UIFont
    v102.TextSize = 12
    v102.BackgroundTransparency = 1
    v102.Size = UDim2.new(1,-10,0,15)
    v102.Position = UDim2.new(0,5,0,5)
    v102.TextXAlignment = Enum.TextXAlignment.Left
    v102.Parent = v101

    local v103 = PhoenixUI:v24("TextLabel",false)
    v103.Text = tostring(v100.Value)
    v103.TextColor3 = Color3.fromRGB(200,200,200)
    v103.FontFace = PhoenixUI.UIFont
    v103.TextSize = 10
    v103.BackgroundTransparency = 1
    v103.Size = UDim2.new(1,-10,0,15)
    v103.Position = UDim2.new(0,5,0,20)
    v103.TextXAlignment = Enum.TextXAlignment.Right
    v103.Parent = v101

    local v104 = PhoenixUI:v24("Frame",false)
    v104.BackgroundColor3 = Color3.fromRGB(60,60,60)
    v104.Size = UDim2.new(1,-10,0,5)
    v104.Position = UDim2.new(0,5,1,-15)
    v104.BorderSizePixel = 0
    v104.Parent = v101

    local v105 = PhoenixUI:v24("Frame",true)
    v105.BackgroundColor3 = PhoenixUI.Accent
    v105.Size = UDim2.new((v100.Value - v100.Min) / (v100.Max - v100.Min),0,1,0)
    v105.BorderSizePixel = 0
    v105.Parent = v104

    local v106 = PhoenixUI:v24("TextButton",false)
    v106.BackgroundColor3 = Color3.fromRGB(255,255,255)
    v106.Size = UDim2.new(0,10,0,10)
    v106.Position = UDim2.new((v100.Value - v100.Min) / (v100.Max - v100.Min),-5,0.5,-5)
    v106.BorderSizePixel = 0
    v106.Text = ""
    v106.AutoButtonColor = false
    v106.Parent = v104

    local v107 = false

    local function v108(v109)
        local v110 = v109.X - v104.AbsolutePosition.X
        local v111 = math.clamp(v110, 0, v104.AbsoluteSize.X)
        local v112 = (v111 / v104.AbsoluteSize.X) * (v100.Max - v100.Min) + v100.Min
        
        if v100.Precise then
            v100.Value = math.floor(v112)
        else
            v100.Value = math.floor(v112 * 100) / 100
        end
        
        v105.Size = UDim2.new((v100.Value - v100.Min) / (v100.Max - v100.Min),0,1,0)
        v106.Position = UDim2.new((v100.Value - v100.Min) / (v100.Max - v100.Min),-5,0.5,-5)
        v103.Text = tostring(v100.Value)
        
        if v100.Flag then
            PhoenixUI.Flags[v100.Flag] = v100.Value
        end
        v100.Callback(v100.Value)
    end

    PhoenixUI:v6(v106.InputBegan,function(v113)
        if v113.UserInputType == Enum.UserInputType.MouseButton1 then
            v107 = true
        end
    end)

    PhoenixUI:v6(v4.InputChanged,function(v114)
        if v107 and v114.UserInputType == Enum.UserInputType.MouseMovement then
            v108(v114.Position)
        end
    end)

    PhoenixUI:v6(v4.InputEnded,function(v115)
        if v115.UserInputType == Enum.UserInputType.MouseButton1 then
            v107 = false
        end
    end)

    PhoenixUI:v6(v104.InputBegan,function(v116)
        if v116.UserInputType == Enum.UserInputType.MouseButton1 then
            v108(v116.Position)
            v107 = true
        end
    end)

    function v100:Set(v117)
        v100.Value = math.clamp(v117, v100.Min, v100.Max)
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

function v62:Dropdown(v118)
    v118 = v118 or {}
    local v119 = {
        Text = v118.Text or "Dropdown",
        Options = v118.Options or {"Option 1", "Option 2"},
        Default = v118.Default or 1,
        Flag = v118.Flag,
        Callback = v118.Callback or function() end,
        Value = v118.Options and v118.Options[v118.Default] or "Option 1",
        Open = false
    }

    local v120 = PhoenixUI:v24("Frame",false)
    v120.BackgroundColor3 = Color3.fromRGB(45,45,45)
    v120.Size = UDim2.new(1,-10,0,30)
    v120.ClipsDescendants = true
    v120.Parent = v66

    local v121 = PhoenixUI:v24("TextButton",false)
    v121.BackgroundColor3 = Color3.fromRGB(50,50,50)
    v121.Size = UDim2.new(1,0,0,30)
    v121.Text = v119.Text .. ": " .. v119.Value
    v121.TextColor3 = Color3.fromRGB(255,255,255)
    v121.FontFace = PhoenixUI.UIFont
    v121.TextSize = 12
    v121.AutoButtonColor = false
    v121.Parent = v120

    local v122 = PhoenixUI:v24("ImageLabel",false)
    v122.Image = "rbxassetid://3926305904"
    v122.ImageRectOffset = Vector2.new(284,4)
    v122.ImageRectSize = Vector2.new(24,24)
    v122.ImageColor3 = Color3.fromRGB(200,200,200)
    v122.BackgroundTransparency = 1
    v122.Size = UDim2.new(0,15,0,15)
    v122.Position = UDim2.new(1,-20,0.5,-7.5)
    v122.Parent = v121

    local v123 = PhoenixUI:v24("ScrollingFrame",false)
    v123.BackgroundColor3 = Color3.fromRGB(40,40,40)
    v123.Size = UDim2.new(1,0,0,0)
    v123.Position = UDim2.new(0,0,1,0)
    v123.ScrollBarThickness = 4
    v123.ScrollBarImageColor3 = PhoenixUI.Accent
    v123.AutomaticCanvasSize = Enum.AutomaticSize.Y
    v123.Parent = v120

    local v124 = PhoenixUI:v24("UIListLayout",false)
    v124.SortOrder = Enum.SortOrder.LayoutOrder
    v124.Parent = v123

    for v125,v126 in pairs(v119.Options) do
        local v127 = PhoenixUI:v24("TextButton",false)
        v127.BackgroundColor3 = Color3.fromRGB(45,45,45)
        v127.Size = UDim2.new(1,0,0,25)
        v127.Text = v126
        v127.TextColor3 = Color3.fromRGB(255,255,255)
        v127.FontFace = PhoenixUI.UIFont
        v127.TextSize = 12
        v127.AutoButtonColor = false
        v127.LayoutOrder = v125
        v127.Parent = v123

        PhoenixUI:v6(v127.MouseButton1Click,function()
            v119.Value = v126
            v121.Text = v119.Text .. ": " .. v119.Value
            v119:Close()
            
            if v119.Flag then
                PhoenixUI.Flags[v119.Flag] = v119.Value
            end
            v119.Callback(v119.Value)
        end)
    end

    function v119:Open()
        if v119.Open then return end
        v119.Open = true
        
        local v128 = #v119.Options * 25
        local v129 = math.min(v128, 150)
        
        v123.Size = UDim2.new(1,0,0,v129)
        v120.Size = UDim2.new(1,-10,0,30 + v129)
        
        v122.Rotation = 180
        
        for v130,v131 in pairs(v66:GetChildren()) do
            if v131:IsA("Frame") and v131 ~= v120 then
                local v132 = v131.LayoutOrder or 0
                if v132 > (v120.LayoutOrder or 0) then
                    v131.Position = UDim2.new(0,0,0,v131.Position.Y.Offset + v129)
                end
            end
        end
    end

    function v119:Close()
        if not v119.Open then return end
        v119.Open = false
        
        local v133 = v123.Size.Y.Offset
        
        v123.Size = UDim2.new(1,0,0,0)
        v120.Size = UDim2.new(1,-10,0,30)
        
        v122.Rotation = 0
        
        for v134,v135 in pairs(v66:GetChildren()) do
            if v135:IsA("Frame") and v135 ~= v120 then
                local v136 = v135.LayoutOrder or 0
                if v136 > (v120.LayoutOrder or 0) then
                    v135.Position = UDim2.new(0,0,0,v135.Position.Y.Offset - v133)
                end
            end
        end
    end

    PhoenixUI:v6(v121.MouseButton1Click,function()
        if v119.Open then
            v119:Close()
        else
            v119:Open()
        end
    end)

    function v119:SetOptions(v137)
        v119.Options = v137
        v123:ClearAllChildren()
        
        for v138,v139 in pairs(v137) do
            local v140 = PhoenixUI:v24("TextButton",false)
            v140.BackgroundColor3 = Color3.fromRGB(45,45,45)
            v140.Size = UDim2.new(1,0,0,25)
            v140.Text = v139
            v140.TextColor3 = Color3.fromRGB(255,255,255)
            v140.FontFace = PhoenixUI.UIFont
            v140.TextSize = 12
            v140.AutoButtonColor = false
            v140.LayoutOrder = v138
            v140.Parent = v123

            PhoenixUI:v6(v140.MouseButton1Click,function()
                v119.Value = v139
                v121.Text = v119.Text .. ": " .. v119.Value
                v119:Close()
                
                if v119.Flag then
                    PhoenixUI.Flags[v119.Flag] = v119.Value
                end
                v119.Callback(v119.Value)
            end)
        end
    end

    if v119.Flag then
        PhoenixUI.Flags[v119.Flag] = v119.Value
    end

    return v119
end

function v62:Colorpicker(v141)
    v141 = v141 or {}
    local v142 = {
        Text = v141.Text or "Colorpicker",
        Default = v141.Default or Color3.fromRGB(255,255,255),
        Flag = v141.Flag,
        Callback = v141.Callback or function() end,
        Value = v141.Default or Color3.fromRGB(255,255,255),
        Open = false
    }

    local v143 = PhoenixUI:v24("Frame",false)
    v143.BackgroundColor3 = Color3.fromRGB(45,45,45)
    v143.Size = UDim2.new(1,-10,0,30)
    v143.ClipsDescendants = true
    v143.Parent = v66

    local v144 = PhoenixUI:v24("TextButton",false)
    v144.BackgroundColor3 = Color3.fromRGB(50,50,50)
    v144.Size = UDim2.new(1,0,0,30)
    v144.Text = v142.Text
    v144.TextColor3 = Color3.fromRGB(255,255,255)
    v144.FontFace = PhoenixUI.UIFont
    v144.TextSize = 12
    v144.AutoButtonColor = false
    v144.Parent = v143

    local v145 = PhoenixUI:v24("Frame",false)
    v145.BackgroundColor3 = v142.Value
    v145.Size = UDim2.new(0,20,0,20)
    v145.Position = UDim2.new(1,-25,0.5,-10)
    v145.BorderSizePixel = 0
    v145.Parent = v144

    local v146 = PhoenixUI:v24("Frame",true)
    v146.BackgroundColor3 = PhoenixUI.Accent
    v146.Size = UDim2.new(1,2,1,2)
    v146.Position = UDim2.new(0,-1,0,-1)
    v146.BorderSizePixel = 0
    v146.Parent = v145

    local v147 = PhoenixUI:v24("ImageLabel",false)
    v147.Image = "rbxassetid://3926305904"
    v147.ImageRectOffset = Vector2.new(284,4)
    v147.ImageRectSize = Vector2.new(24,24)
    v147.ImageColor3 = Color3.fromRGB(200,200,200)
    v147.BackgroundTransparency = 1
    v147.Size = UDim2.new(0,15,0,15)
    v147.Position = UDim2.new(1,-45,0.5,-7.5)
    v147.Parent = v144

    local v148 = PhoenixUI:v24("Frame",false)
    v148.BackgroundColor3 = Color3.fromRGB(40,40,40)
    v148.Size = UDim2.new(1,0,0,150)
    v148.Position = UDim2.new(0,0,1,0)
    v148.Visible = false
    v148.Parent = v143

    local v149 = PhoenixUI:v24("ImageLabel",false)
    v149.Image = "rbxassetid://14204231522"
    v149.Size = UDim2.new(0,130,0,130)
    v149.Position = UDim2.new(0,10,0,10)
    v149.BorderSizePixel = 0
    v149.Parent = v148

    local v150 = PhoenixUI:v24("Frame",false)
    v150.BackgroundColor3 = Color3.fromRGB(255,255,255)
    v150.Size = UDim2.new(0,5,0,5)
    v150.BorderSizePixel = 0
    v150.Parent = v149

    local v151 = PhoenixUI:v24("UIGradient",false)
    v151.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.new(1,1,1)),
        ColorSequenceKeypoint.new(1, Color3.new(1,1,1))
    }
    v151.Rotation = 90
    v151.Parent = v149

    local v152 = PhoenixUI:v24("UIGradient",false)
    v152.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.new(0,0,0)),
        ColorSequenceKeypoint.new(1, Color3.new(0,0,0))
    }
    v152.Transparency = NumberSequence.new{
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(1, 1)
    }
    v152.Parent = v149

    local v153 = PhoenixUI:v24("Frame",false)
    v153.BackgroundColor3 = v142.Value
    v153.Size = UDim2.new(0,20,0,130)
    v153.Position = UDim2.new(0,150,0,10)
    v153.BorderSizePixel = 0
    v153.Parent = v148

    local v154 = PhoenixUI:v24("UIGradient",false)
    v154.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255,0,0)),
        ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255,255,0)),
        ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0,255,0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0,255,255)),
        ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0,0,255)),
        ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255,0,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255,0,0))
    }
    v154.Rotation = 90
    v154.Parent = v153

    local v155 = PhoenixUI:v24("Frame",false)
    v155.BackgroundColor3 = Color3.fromRGB(255,255,255)
    v155.Size = UDim2.new(1,0,0,2)
    v155.BorderSizePixel = 0
    v155.Parent = v153

    local v156 = false
    local v157 = false

    local function v158(v159,v160)
        local v161 = math.clamp((v159.X - v149.AbsolutePosition.X) / v149.AbsoluteSize.X, 0, 1)
        local v162 = math.clamp((v159.Y - v149.AbsolutePosition.Y) / v149.AbsoluteSize.Y, 0, 1)
        
        local v163 = Color3.fromHSV(1 - v162, v161, 1)
        v142.Value = v163
        v145.BackgroundColor3 = v163
        v150.Position = UDim2.new(v161, -2.5, v162, -2.5)
        
        if v142.Flag then
            PhoenixUI.Flags[v142.Flag] = v142.Value
        end
        v142.Callback(v142.Value)
    end

    local function v164(v165)
        local v166 = math.clamp((v165.Y - v153.AbsolutePosition.Y) / v153.AbsoluteSize.Y, 0, 1)
        
        local v167 = 1 - v166
        v151.Color = ColorSequence.new(Color3.fromHSV(v167, 1, 1))
        v155.Position = UDim2.new(0, 0, v166, -1)
        
        if v156 then
            local v168 = v150.Position.X.Scale
            local v169 = v150.Position.Y.Scale
            local v170 = Color3.fromHSV(v167, v168, 1)
            v142.Value = v170
            v145.BackgroundColor3 = v170
            
            if v142.Flag then
                PhoenixUI.Flags[v142.Flag] = v142.Value
            end
            v142.Callback(v142.Value)
        end
    end

    PhoenixUI:v6(v149.InputBegan,function(v171)
        if v171.UserInputType == Enum.UserInputType.MouseButton1 then
            v156 = true
            v158(v171.Position)
        end
    end)

    PhoenixUI:v6(v4.InputChanged,function(v172)
        if v156 and v172.UserInputType == Enum.UserInputType.MouseMovement then
            v158(v172.Position)
        elseif v157 and v172.UserInputType == Enum.UserInputType.MouseMovement then
            v164(v172.Position)
        end
    end)

    PhoenixUI:v6(v4.InputEnded,function(v173)
        if v173.UserInputType == Enum.UserInputType.MouseButton1 then
            v156 = false
            v157 = false
        end
    end)

    PhoenixUI:v6(v153.InputBegan,function(v174)
        if v174.UserInputType == Enum.UserInputType.MouseButton1 then
            v157 = true
            v164(v174.Position)
        end
    end)

    function v142:Open()
        if v142.Open then return end
        v142.Open = true
        v148.Visible = true
        v143.Size = UDim2.new(1,-10,0,180)
        v147.Rotation = 180
        
        for v175,v176 in pairs(v66:GetChildren()) do
            if v176:IsA("Frame") and v176 ~= v143 then
                local v177 = v176.LayoutOrder or 0
                if v177 > (v143.LayoutOrder or 0) then
                    v176.Position = UDim2.new(0,0,0,v176.Position.Y.Offset + 150)
                end
            end
        end
    end

    function v142:Close()
        if not v142.Open then return end
        v142.Open = false
        v148.Visible = false
        v143.Size = UDim2.new(1,-10,0,30)
        v147.Rotation = 0
        
        for v178,v179 in pairs(v66:GetChildren()) do
            if v179:IsA("Frame") and v179 ~= v143 then
                local v180 = v179.LayoutOrder or 0
                if v180 > (v143.LayoutOrder or 0) then
                    v179.Position = UDim2.new(0,0,0,v179.Position.Y.Offset - 150)
                end
            end
        end
    end

    PhoenixUI:v6(v144.MouseButton1Click,function()
        if v142.Open then
            v142:Close()
        else
            v142:Open()
        end
    end)

    function v142:Set(v181)
        v142.Value = v181
        v145.BackgroundColor3 = v181
        
        local v182,v183,v184 = v181:ToHSV()
        v150.Position = UDim2.new(v183, -2.5, 1 - v182, -2.5)
        v155.Position = UDim2.new(0, 0, 1 - v182, -1)
        v151.Color = ColorSequence.new(Color3.fromHSV(v182, 1, 1))
        
        if v142.Flag then
            PhoenixUI.Flags[v142.Flag] = v142.Value
        end
        v142.Callback(v142.Value)
    end

    if v142.Flag then
        PhoenixUI.Flags[v142.Flag] = v142.Value
    end

    return v142
end


   
return PhoenixUI
