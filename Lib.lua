local PhoenixUI = {}
PhoenixUI.Open = true
PhoenixUI.Accent = Color3.fromRGB(85,170,255)
PhoenixUI.ThemeObjects = {}
PhoenixUI.Flags = {}
PhoenixUI.Holder = nil
PhoenixUI.ScreenGUI = nil
PhoenixUI.UIFont = Font.new("rbxassetid://12187371840")
PhoenixUI.Watermarks = {}
PhoenixUI.Notifications = {}

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
    local v28 = {
        Pages = {},
        Elements = {},
        Name = v27.Name or "PhoenixUI Window"
    }
    
    local v29 = Instance.new("ScreenGui")
    v29.Name = "PhoenixUIMain"
    v29.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    v29.Parent = game:GetService("RunService"):IsStudio() and v1.PlayerGui or game.CoreGui
    PhoenixUI.ScreenGUI = v29

    local v30 = PhoenixUI:v23("TextButton",true)
    v30.Name = "MainFrame"
    v30.AnchorPoint = Vector2.new(0.5,0.5)
    v30.Position = UDim2.new(0.5,0,0.5,0)
    v30.Size = UDim2.new(0,600,0,700)
    v30.Text = ""
    v30.AutoButtonColor = false
    v30.Parent = v29

    local v31 = PhoenixUI:v23("Frame",false)
    v31.BackgroundColor3 = Color3.fromRGB(15,15,15)
    v31.Size = UDim2.new(1,0,1,0)
    v31.Parent = v30

    local v32 = PhoenixUI:v23("Frame",true)
    v32.BackgroundColor3 = PhoenixUI.Accent
    v32.Size = UDim2.new(1,0,0,2)
    v32.Parent = v31

    local v33 = PhoenixUI:v23("TextLabel",false)
    v33.Text = v28.Name
    v33.TextColor3 = Color3.fromRGB(255,255,255)
    v33.FontFace = PhoenixUI.UIFont
    v33.TextSize = 14
    v33.BackgroundTransparency = 1
    v33.Position = UDim2.new(0,10,0,5)
    v33.Size = UDim2.new(1,-20,0,20)
    v33.Parent = v31

    local v34 = PhoenixUI:v23("Frame",false)
    v34.BackgroundColor3 = Color3.fromRGB(25,25,25)
    v34.Position = UDim2.new(0,10,0,30)
    v34.Size = UDim2.new(1,-20,1,-40)
    v34.Parent = v31

    local v35 = PhoenixUI:v23("Frame",false)
    v35.BackgroundColor3 = Color3.fromRGB(35,35,35)
    v35.Position = UDim2.new(0,5,0,5)
    v35.Size = UDim2.new(0,120,1,-10)
    v35.Parent = v34

    local v36 = PhoenixUI:v23("UIListLayout",false)
    v36.Padding = UDim.new(0,5)
    v36.SortOrder = Enum.SortOrder.LayoutOrder
    v36.Parent = v35

    local v37 = PhoenixUI:v23("Frame",false)
    v37.BackgroundColor3 = Color3.fromRGB(30,30,30)
    v37.Position = UDim2.new(0,130,0,5)
    v37.Size = UDim2.new(1,-135,1,-10)
    v37.Parent = v34

    local v38 = PhoenixUI:v23("UIListLayout",false)
    v38.Padding = UDim.new(0,8)
    v38.SortOrder = Enum.SortOrder.LayoutOrder
    v38.Parent = v37

    local v39 = PhoenixUI:v23("UIPadding",false)
    v39.PaddingLeft = UDim.new(0,10)
    v39.PaddingTop = UDim.new(0,10)
    v39.Parent = v37

    v28.Elements = {
        Main = v30,
        TabContainer = v35,
        ContentContainer = v37,
        TabsLayout = v36,
        ContentLayout = v38
    }

    PhoenixUI.Holder = v30

    function v28:Page(v40)
        v40 = v40 or {}
        local v41 = {
            Name = v40.Name or "Page",
            Window = self,
            Open = false,
            Elements = {}
        }

        local v42 = PhoenixUI:v23("TextButton",false)
        v42.BackgroundColor3 = Color3.fromRGB(40,40,40)
        v42.Size = UDim2.new(1,0,0,30)
        v42.Text = v41.Name
        v42.TextColor3 = Color3.fromRGB(200,200,200)
        v42.FontFace = PhoenixUI.UIFont
        v42.TextSize = 12
        v42.AutoButtonColor = false
        v42.Parent = self.Elements.TabContainer

        local v43 = PhoenixUI:v23("Frame",true)
        v43.BackgroundColor3 = PhoenixUI.Accent
        v43.Size = UDim2.new(0,3,1,0)
        v43.Visible = false
        v43.Parent = v42

        local v44 = PhoenixUI:v23("ScrollingFrame",false)
        v44.BackgroundTransparency = 1
        v44.Size = UDim2.new(1,0,1,0)
        v44.Visible = false
        v44.ScrollBarThickness = 4
        v44.ScrollBarImageColor3 = PhoenixUI.Accent
        v44.Parent = self.Elements.ContentContainer

        local v45 = PhoenixUI:v23("UIListLayout",false)
        v45.Padding = UDim.new(0,10)
        v45.SortOrder = Enum.SortOrder.LayoutOrder
        v45.Parent = v44

        local v46 = PhoenixUI:v23("UIPadding",false)
        v46.PaddingLeft = UDim.new(0,5)
        v46.PaddingTop = UDim.new(0,5)
        v46.Parent = v44

        function v41:SetActive(v47)
            v41.Open = v47
            v44.Visible = v47
            v43.Visible = v47
            if v47 then
                v42.BackgroundColor3 = Color3.fromRGB(50,50,50)
                v42.TextColor3 = Color3.fromRGB(255,255,255)
            else
                v42.BackgroundColor3 = Color3.fromRGB(40,40,40)
                v42.TextColor3 = Color3.fromRGB(200,200,200)
            end
        end

        PhoenixUI:v6(v42.MouseButton1Click,function()
            for v48,v49 in pairs(v28.Pages) do
                if v49 ~= v41 then
                    v49:SetActive(false)
                end
            end
            v41:SetActive(true)
        end)

        v41.Elements = {
            TabButton = v42,
            ContentFrame = v44,
            ContentLayout = v45
        }

        if #v28.Pages == 0 then
            v41:SetActive(true)
        end

        v28.Pages[#v28.Pages + 1] = v41

        function v41:Checkbox(v50)
            v50 = v50 or {}
            local v51 = {
                Text = v50.Text or "Checkbox",
                Default = v50.Default or false,
                Flag = v50.Flag,
                Callback = v50.Callback or function() end
            }

            local v52 = PhoenixUI:v23("Frame",false)
            v52.BackgroundColor3 = Color3.fromRGB(45,45,45)
            v52.Size = UDim2.new(1,-20,0,25)
            v52.Parent = v44

            local v53 = PhoenixUI:v23("TextButton",false)
            v53.BackgroundColor3 = Color3.fromRGB(60,60,60)
            v53.Position = UDim2.new(0,5,0,5)
            v53.Size = UDim2.new(0,15,0,15)
            v53.Text = ""
            v53.AutoButtonColor = false
            v53.Parent = v52

            local v54 = PhoenixUI:v23("Frame",true)
            v54.BackgroundColor3 = PhoenixUI.Accent
            v54.Position = UDim2.new(0,2,0,2)
            v54.Size = UDim2.new(1,-4,1,-4)
            v54.Visible = v51.Default
            v54.Parent = v53

            local v55 = PhoenixUI:v23("TextLabel",false)
            v55.Text = v51.Text
            v55.TextColor3 = Color3.fromRGB(255,255,255)
            v55.FontFace = PhoenixUI.UIFont
            v55.TextSize = 12
            v55.BackgroundTransparency = 1
            v55.Position = UDim2.new(0,25,0,0)
            v55.Size = UDim2.new(1,-25,1,0)
            v55.TextXAlignment = Enum.TextXAlignment.Left
            v55.Parent = v52

            function v51:Set(v56)
                v54.Visible = v56
                if v51.Flag then
                    PhoenixUI.Flags[v51.Flag] = v56
                end
                v51.Callback(v56)
            end

            function v51:Toggle()
                v51:Set(not v54.Visible)
            end

            PhoenixUI:v6(v53.MouseButton1Click,function()
                v51:Toggle()
            end)

            if v51.Flag then
                PhoenixUI.Flags[v51.Flag] = v51.Default
            end

            return v51
        end

        function v41:Button(v57)
            v57 = v57 or {}
            local v58 = {
                Text = v57.Text or "Button",
                Callback = v57.Callback or function() end
            }

            local v59 = PhoenixUI:v23("TextButton",true)
            v59.BackgroundColor3 = PhoenixUI.Accent
            v59.Size = UDim2.new(1,-20,0,35)
            v59.Text = v58.Text
            v59.TextColor3 = Color3.fromRGB(255,255,255)
            v59.FontFace = PhoenixUI.UIFont
            v59.TextSize = 12
            v59.AutoButtonColor = false
            v59.Parent = v44

            local v60 = false

            PhoenixUI:v6(v59.MouseButton1Down,function()
                v60 = true
                v59.BackgroundColor3 = PhoenixUI.Accent:Lerp(Color3.new(0,0,0),0.3)
            end)

            PhoenixUI:v6(v59.MouseButton1Down,function()
                v60 = true
                v59.BackgroundColor3 = PhoenixUI.Accent:Lerp(Color3.new(0,0,0),0.3)
            end)

            PhoenixUI:v6(v59.MouseButton1Up,function()
                if v60 then
                    v60 = false
                    v59.BackgroundColor3 = PhoenixUI.Accent
                    v58.Callback()
                end
            end)

            PhoenixUI:v6(v59.MouseLeave,function()
                if v60 then
                    v60 = false
                    v59.BackgroundColor3 = PhoenixUI.Accent
                end
            end)

            return v58
        end

        function v41:Textbox(v61)
            v61 = v61 or {}
            local v62 = {
                Text = v61.Text or "",
                Placeholder = v61.Placeholder or "Enter text...",
                Flag = v61.Flag,
                Callback = v61.Callback or function() end
            }

            local v63 = PhoenixUI:v23("Frame",false)
            v63.BackgroundColor3 = Color3.fromRGB(45,45,45)
            v63.Size = UDim2.new(1,-20,0,30)
            v63.Parent = v44

            local v64 = PhoenixUI:v23("TextBox",false)
            v64.BackgroundTransparency = 1
            v64.Size = UDim2.new(1,-10,1,0)
            v64.Position = UDim2.new(0,5,0,0)
            v64.Text = v62.Text
            v64.PlaceholderText = v62.Placeholder
            v64.TextColor3 = Color3.fromRGB(255,255,255)
            v64.FontFace = PhoenixUI.UIFont
            v64.TextSize = 12
            v64.TextXAlignment = Enum.TextXAlignment.Left
            v64.ClearTextOnFocus = false
            v64.Parent = v63

            local v65 = PhoenixUI:v23("Frame",true)
            v65.BackgroundColor3 = PhoenixUI.Accent
            v65.Size = UDim2.new(1,0,0,1)
            v65.Position = UDim2.new(0,0,1,0)
            v65.Parent = v63

            function v62:Set(v66)
                v64.Text = v66
                if v62.Flag then
                    PhoenixUI.Flags[v62.Flag] = v66
                end
                v62.Callback(v66)
            end

            PhoenixUI:v6(v64.FocusLost,function()
                v62:Set(v64.Text)
            end)

            if v62.Flag then
                PhoenixUI.Flags[v62.Flag] = v62.Text
            end

            return v62
        end

        function v41:Colorpicker(v67)
            v67 = v67 or {}
            local v68 = {
                Color = v67.Color or PhoenixUI.Accent,
                Flag = v67.Flag,
                Callback = v67.Callback or function() end
            }

            local v69 = PhoenixUI:v23("Frame",false)
            v69.BackgroundColor3 = Color3.fromRGB(45,45,45)
            v69.Size = UDim2.new(1,-20,0,25)
            v69.Parent = v44

            local v70 = PhoenixUI:v23("TextLabel",false)
            v70.Text = "Color"
            v70.TextColor3 = Color3.fromRGB(255,255,255)
            v70.FontFace = PhoenixUI.UIFont
            v70.TextSize = 12
            v70.BackgroundTransparency = 1
            v70.Position = UDim2.new(0,5,0,0)
            v70.Size = UDim2.new(0,40,1,0)
            v70.TextXAlignment = Enum.TextXAlignment.Left
            v70.Parent = v69

            local v71 = PhoenixUI:v23("TextButton",false)
            v71.BackgroundColor3 = v68.Color
            v71.BorderSizePixel = 0
            v71.Position = UDim2.new(0,50,0,5)
            v71.Size = UDim2.new(0,80,0,15)
            v71.Text = ""
            v71.AutoButtonColor = false
            v71.Parent = v69

            local v72 = PhoenixUI:v23("Frame",false)
            v72.BackgroundColor3 = Color3.fromRGB(50,50,50)
            v72.Position = UDim2.new(0,135,0,30)
            v72.Size = UDim2.new(0,200,0,180)
            v72.ZIndex = 10
            v72.Visible = false
            v72.Parent = v69

            local v73 = PhoenixUI:v23("Frame",false)
            v73.BackgroundColor3 = Color3.fromRGB(25,25,25)
            v73.Position = UDim2.new(0,1,0,1)
            v73.Size = UDim2.new(1,-2,1,-2)
            v73.Parent = v72

            local v74 = PhoenixUI:v23("TextButton",false)
            v74.BackgroundColor3 = v68.Color
            v74.BorderSizePixel = 0
            v74.Position = UDim2.new(0,5,0,5)
            v74.Size = UDim2.new(1,-40,1,-10)
            v74.Text = ""
            v74.AutoButtonColor = false
            v74.Parent = v73

            local v75 = PhoenixUI:v23("ImageLabel",false)
            v75.Image = "rbxassetid://14204231522"
            v75.BackgroundTransparency = 1
            v75.Size = UDim2.new(1,0,1,0)
            v75.Parent = v74

            local v76 = PhoenixUI:v23("ImageButton",false)
            v76.Image = "rbxassetid://14204232622"
            v76.BackgroundTransparency = 1
            v76.Position = UDim2.new(1,-25,0,5)
            v76.Size = UDim2.new(0,15,1,-10)
            v76.AutoButtonColor = false
            v76.Parent = v73

            local v77 = false
            local v78 = false
            local v79,v80,v81 = v68.Color:ToHSV()

            local function v82()
                local v83 = Color3.fromHSV(v79,v80,v81)
                v71.BackgroundColor3 = v83
                v74.BackgroundColor3 = Color3.fromHSV(v79,1,1)
                if v68.Flag then
                    PhoenixUI.Flags[v68.Flag] = v83
                end
                v68.Callback(v83)
            end

            function v68:Set(v84)
                v79,v80,v81 = v84:ToHSV()
                v82()
            end

            PhoenixUI:v6(v71.MouseButton1Click,function()
                v72.Visible = not v72.Visible
            end)

            PhoenixUI:v6(v74.InputBegan,function(v85)
                if v85.UserInputType == Enum.UserInputType.MouseButton1 then
                    v77 = true
                end
            end)

            PhoenixUI:v6(v74.InputEnded,function(v86)
                if v86.UserInputType == Enum.UserInputType.MouseButton1 then
                    v77 = false
                end
            end)

            PhoenixUI:v6(v76.InputBegan,function(v87)
                if v87.UserInputType == Enum.UserInputType.MouseButton1 then
                    v78 = true
                end
            end)

            PhoenixUI:v6(v76.InputEnded,function(v88)
                if v88.UserInputType == Enum.UserInputType.MouseButton1 then
                    v78 = false
                end
            end)

            PhoenixUI:v6(v4.InputChanged,function(v89)
                if v89.UserInputType == Enum.UserInputType.MouseMovement then
                    if v77 then
                        local v90 = v89.Position
                        local v91 = v90 - v74.AbsolutePosition
                        v80 = math.clamp(v91.X / v74.AbsoluteSize.X,0,1)
                        v81 = math.clamp(v91.Y / v74.AbsoluteSize.Y,0,1)
                        v82()
                    elseif v78 then
                        local v92 = v89.Position
                        local v93 = v92 - v76.AbsolutePosition
                        v79 = math.clamp(v93.Y / v76.AbsoluteSize.Y,0,1)
                        v82()
                    end
                end
            end)

            PhoenixUI:v6(v4.InputBegan,function(v94)
                if v94.UserInputType == Enum.UserInputType.MouseButton1 and v72.Visible then
                    if not PhoenixUI:v15(v72) and not PhoenixUI:v15(v71) then
                        v72.Visible = false
                    end
                end
            end)

            if v68.Flag then
                PhoenixUI.Flags[v68.Flag] = v68.Color
            end

            return v68
        end

        function v41:Label(v95)
            v95 = v95 or {}
            local v96 = {
                Text = v95.Text or "Label"
            }

            local v97 = PhoenixUI:v23("TextLabel",false)
            v97.BackgroundTransparency = 1
            v97.Size = UDim2.new(1,-20,0,20)
            v97.Text = v96.Text
            v97.TextColor3 = Color3.fromRGB(255,255,255)
            v97.FontFace = PhoenixUI.UIFont
            v97.TextSize = 12
            v97.TextXAlignment = Enum.TextXAlignment.Left
            v97.Parent = v44

            function v96:Set(v98)
                v97.Text = v98
            end

            return v96
        end

        return v41
    end

    function v28:Watermark(v99)
        v99 = v99 or {}
        local v100 = {
            Text = v99.Text or "PhoenixUI",
            Visible = true
        }

        local v101 = PhoenixUI:v23("Frame",false)
        v101.BackgroundColor3 = Color3.fromRGB(50,50,50)
        v101.Position = UDim2.new(0,10,0,10)
        v101.Size = UDim2.new(0,0,0,25)
        v101.AutomaticSize = Enum.AutomaticSize.X
        v101.Parent = PhoenixUI.ScreenGUI

        local v102 = PhoenixUI:v23("Frame",false)
        v102.BackgroundColor3 = Color3.fromRGB(20,20,20)
        v102.Position = UDim2.new(0,1,0,1)
        v102.Size = UDim2.new(1,-2,1,-2)
        v102.Parent = v101

        local v103 = PhoenixUI:v23("TextLabel",false)
        v103.Text = v100.Text
        v103.TextColor3 = Color3.fromRGB(255,255,255)
        v103.FontFace = PhoenixUI.UIFont
        v103.TextSize = 12
        v103.BackgroundTransparency = 1
        v103.Size = UDim2.new(1,0,1,0)
        v103.TextXAlignment = Enum.TextXAlignment.Center
        v103.Parent = v102

        local v104 = PhoenixUI:v23("Frame",true)
        v104.BackgroundColor3 = PhoenixUI.Accent
        v104.Size = UDim2.new(1,0,0,2)
        v104.Parent = v101

        function v100:SetText(v105)
            v103.Text = v105
        end

        function v100:SetVisible(v106)
            v101.Visible = v106
        end

        table.insert(PhoenixUI.Watermarks,v100)

        return v100
    end

    return v28
end

return PhoenixUI
          
