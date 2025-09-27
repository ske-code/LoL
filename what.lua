local PhoenixUI = {}
PhoenixUI.Open = true
PhoenixUI.Accent = Color3.fromRGB(85,170,255)
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

function PhoenixUI:v5(v6,v7)
    return v6:Connect(v7)
end

function PhoenixUI:v8(v9,v10,v11)
    return Color3.fromRGB(v9,v10,v11)
end

function PhoenixUI:v12(v13)
    if typeof(v13) == 'boolean' then
        PhoenixUI.Open = v13
        if PhoenixUI.Holder then
            PhoenixUI.Holder.Visible = v13
        end
    end
end

function PhoenixUI:v14(v15)
    local v16,v17 = v15.AbsolutePosition,v15.AbsoluteSize
    if v2.X >= v16.X and v2.X <= v16.X + v17.X and v2.Y >= v16.Y and v2.Y <= v16.Y + v17.Y then
        return true
    end
    return false
end

function PhoenixUI:v18(v19)
    PhoenixUI.Accent = v19
    for v20,v21 in next,PhoenixUI.ThemeObjects do
        if v21:IsA("Frame") or v21:IsA("TextButton") then
            v21.BackgroundColor3 = v19
        elseif v21:IsA("TextLabel") then
            v21.TextColor3 = v19
        elseif v21:IsA("ImageLabel") or v21:IsA("ImageButton") then
            v21.ImageColor3 = v19
        elseif v21:IsA("UIStroke") then
            v21.Color = v19
        end
    end
end

function PhoenixUI:v22(v23,v24)
    local v25 = Instance.new(v23)
    if v24 then
        table.insert(PhoenixUI.ThemeObjects,v25)
        if v25:IsA("Frame") or v25:IsA("TextButton") then
            v25.BackgroundColor3 = PhoenixUI.Accent
        elseif v25:IsA("TextLabel") then
            v25.TextColor3 = PhoenixUI.Accent
        elseif v25:IsA("ImageLabel") then
            v25.ImageColor3 = PhoenixUI.Accent
        elseif v25:IsA("UIStroke") then
            v25.Color = PhoenixUI.Accent
        end
    end
    return v25
end

function PhoenixUI:Window(v26)
    local v27 = {
        Pages = {},
        Sections = {},
        Elements = {},
        Name = v26.Name or "PhoenixUI"
    }
    
    local v28 = Instance.new("ScreenGui")
    v28.Name = "PhoenixUIMain"
    v28.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    v28.Parent = game:GetService("RunService"):IsStudio() and v1.PlayerGui or game.CoreGui
    PhoenixUI.ScreenGUI = v28

    local v29 = PhoenixUI:v22("TextButton",true)
    v29.Name = "MainFrame"
    v29.AnchorPoint = Vector2.new(0.5,0.5)
    v29.Position = UDim2.new(0.5,0,0.5,0)
    v29.Size = UDim2.new(0,650,0,500)
    v29.Text = ""
    v29.AutoButtonColor = false
    v29.Parent = v28

    local v30 = PhoenixUI:v22("Frame",false)
    v30.BackgroundColor3 = Color3.fromRGB(15,15,15)
    v30.Size = UDim2.new(1,0,1,0)
    v30.Parent = v29

    local v31 = PhoenixUI:v22("Frame",true)
    v31.BackgroundColor3 = PhoenixUI.Accent
    v31.Size = UDim2.new(1,0,0,2)
    v31.Parent = v30

    local v32 = PhoenixUI:v22("TextLabel",false)
    v32.Text = v27.Name
    v32.TextColor3 = Color3.fromRGB(255,255,255)
    v32.FontFace = PhoenixUI.UIFont
    v32.TextSize = 16
    v32.BackgroundTransparency = 1
    v32.Position = UDim2.new(0,15,0,8)
    v32.Size = UDim2.new(1,-30,0,25)
    v32.TextXAlignment = Enum.TextXAlignment.Left
    v32.Parent = v30

    local v33 = PhoenixUI:v22("Frame",false)
    v33.BackgroundColor3 = Color3.fromRGB(25,25,25)
    v33.Position = UDim2.new(0,10,0,40)
    v33.Size = UDim2.new(1,-20,0,30)
    v33.Parent = v30

    local v34 = PhoenixUI:v22("UIListLayout",false)
    v34.FillDirection = Enum.FillDirection.Horizontal
    v34.Padding = UDim.new(0,5)
    v34.SortOrder = Enum.SortOrder.LayoutOrder
    v34.Parent = v33

    local v35 = PhoenixUI:v22("UIPadding",false)
    v35.PaddingLeft = UDim.new(0,10)
    v35.PaddingTop = UDim.new(0,5)
    v35.Parent = v33

    local v36 = PhoenixUI:v22("Frame",false)
    v36.BackgroundColor3 = Color3.fromRGB(30,30,30)
    v36.Position = UDim2.new(0,10,0,80)
    v36.Size = UDim2.new(1,-20,1,-90)
    v36.Parent = v30

    local v37 = PhoenixUI:v22("Frame",false)
    v37.BackgroundTransparency = 1
    v37.Size = UDim2.new(0.5,-5,1,0)
    v37.Parent = v36

    local v38 = PhoenixUI:v22("UIListLayout",false)
    v38.Padding = UDim.new(0,10)
    v38.SortOrder = Enum.SortOrder.LayoutOrder
    v38.Parent = v37

    local v39 = PhoenixUI:v22("UIPadding",false)
    v39.PaddingLeft = UDim.new(0,10)
    v39.PaddingTop = UDim.new(0,10)
    v39.Parent = v37

    local v40 = PhoenixUI:v22("Frame",false)
    v40.BackgroundTransparency = 1
    v40.Position = UDim2.new(0.5,5,0,0)
    v40.Size = UDim2.new(0.5,-5,1,0)
    v40.Parent = v36

    local v41 = PhoenixUI:v22("UIListLayout",false)
    v41.Padding = UDim.new(0,10)
    v41.SortOrder = Enum.SortOrder.LayoutOrder
    v41.Parent = v40

    local v42 = PhoenixUI:v22("UIPadding",false)
    v42.PaddingLeft = UDim.new(0,10)
    v42.PaddingTop = UDim.new(0,10)
    v42.Parent = v40

    v27.Elements = {
        Main = v29,
        TabContainer = v33,
        LeftContainer = v37,
        RightContainer = v40,
        ContentArea = v36
    }

    PhoenixUI.Holder = v29

    function v27:Page(v43)
        v43 = v43 or {}
        local v44 = {
            Name = v43.Name or "Page",
            Window = self,
            Open = false,
            Sections = {},
            Elements = {}
        }

        local v45 = PhoenixUI:v22("TextButton",false)
        v45.BackgroundColor3 = Color3.fromRGB(40,40,40)
        v45.Size = UDim2.new(0,100,1,-10)
        v45.Text = v44.Name
        v45.TextColor3 = Color3.fromRGB(200,200,200)
        v45.FontFace = PhoenixUI.UIFont
        v45.TextSize = 12
        v45.AutoButtonColor = false
        v45.Parent = self.Elements.TabContainer

        local v46 = PhoenixUI:v22("Frame",true)
        v46.BackgroundColor3 = PhoenixUI.Accent
        v46.Size = UDim2.new(0,3,1,0)
        v46.Visible = false
        v46.Parent = v45

        function v44:SetActive(v47)
            v44.Open = v47
            v46.Visible = v47
            if v47 then
                v45.BackgroundColor3 = Color3.fromRGB(50,50,50)
                v45.TextColor3 = Color3.fromRGB(255,255,255)
            else
                v45.BackgroundColor3 = Color3.fromRGB(40,40,40)
                v45.TextColor3 = Color3.fromRGB(200,200,200)
            end
        end

        PhoenixUI:v5(v45.MouseButton1Click,function()
            for v48,v49 in pairs(v27.Pages) do
                if v49 ~= v44 then
                    v49:SetActive(false)
                end
            end
            v44:SetActive(true)
        end)

        function v44:Section(v50)
            v50 = v50 or {}
            local v51 = {
                Name = v50.Name or "Section",
                Page = self,
                Side = v50.Side or "Left",
                Elements = {}
            }

            local v52 = PhoenixUI:v22("Frame",false)
            v52.BackgroundColor3 = Color3.fromRGB(35,35,35)
            v52.Size = UDim2.new(1,0,0,0)
            v52.AutomaticSize = Enum.AutomaticSize.Y
            v52.Parent = v51.Side == "Left" and self.Window.Elements.LeftContainer or self.Window.Elements.RightContainer

            local v53 = PhoenixUI:v22("TextLabel",false)
            v53.Text = v51.Name
            v53.TextColor3 = Color3.fromRGB(255,255,255)
            v53.FontFace = PhoenixUI.UIFont
            v53.TextSize = 14
            v53.BackgroundTransparency = 1
            v53.Size = UDim2.new(1,-10,0,25)
            v53.Position = UDim2.new(0,5,0,5)
            v53.TextXAlignment = Enum.TextXAlignment.Left
            v53.Parent = v52

            local v54 = PhoenixUI:v22("Frame",true)
            v54.BackgroundColor3 = PhoenixUI.Accent
            v54.Size = UDim2.new(1,0,0,1)
            v54.Position = UDim2.new(0,0,0,30)
            v54.Parent = v52

            local v55 = PhoenixUI:v22("Frame",false)
            v55.BackgroundTransparency = 1
            v55.Size = UDim2.new(1,0,0,0)
            v55.Position = UDim2.new(0,0,0,35)
            v55.AutomaticSize = Enum.AutomaticSize.Y
            v55.Parent = v52

            local v56 = PhoenixUI:v22("UIListLayout",false)
            v56.Padding = UDim.new(0,8)
            v56.SortOrder = Enum.SortOrder.LayoutOrder
            v56.Parent = v55

            local v57 = PhoenixUI:v22("UIPadding",false)
            v57.PaddingLeft = UDim.new(0,5)
            v57.PaddingTop = UDim.new(0,5)
            v57.PaddingBottom = UDim.new(0,5)
            v57.Parent = v55

            v51.Elements = {
                Main = v52,
                Content = v55
            }

            function v51:Checkbox(v58)
                v58 = v58 or {}
                local v59 = {
                    Text = v58.Text or "Checkbox",
                    Default = v58.Default or false,
                    Flag = v58.Flag,
                    Callback = v58.Callback or function() end
                }

                local v60 = PhoenixUI:v22("Frame",false)
                v60.BackgroundColor3 = Color3.fromRGB(45,45,45)
                v60.Size = UDim2.new(1,-10,0,25)
                v60.Parent = v55

                local v61 = PhoenixUI:v22("TextButton",false)
                v61.BackgroundColor3 = Color3.fromRGB(60,60,60)
                v61.Position = UDim2.new(0,5,0,5)
                v61.Size = UDim2.new(0,15,0,15)
                v61.Text = ""
                v61.AutoButtonColor = false
                v61.Parent = v60

                local v62 = PhoenixUI:v22("Frame",true)
                v62.BackgroundColor3 = PhoenixUI.Accent
                v62.Position = UDim2.new(0,2,0,2)
                v62.Size = UDim2.new(1,-4,1,-4)
                v62.Visible = v59.Default
                v62.Parent = v61

                local v63 = PhoenixUI:v22("TextLabel",false)
                v63.Text = v59.Text
                v63.TextColor3 = Color3.fromRGB(255,255,255)
                v63.FontFace = PhoenixUI.UIFont
                v63.TextSize = 12
                v63.BackgroundTransparency = 1
                v63.Position = UDim2.new(0,25,0,0)
                v63.Size = UDim2.new(1,-25,1,0)
                v63.TextXAlignment = Enum.TextXAlignment.Left
                v63.Parent = v60

                function v59:Set(v64)
                    v62.Visible = v64
                    if v59.Flag then
                        PhoenixUI.Flags[v59.Flag] = v64
                    end
                    v59.Callback(v64)
                end

                PhoenixUI:v5(v61.MouseButton1Click,function()
                    v59:Set(not v62.Visible)
                end)

                if v59.Flag then
                    PhoenixUI.Flags[v59.Flag] = v59.Default
                end

                return v59
            end

            function v51:Button(v65)
                v65 = v65 or {}
                local v66 = {
                    Text = v65.Text or "Button",
                    Callback = v65.Callback or function() end
                }

                local v67 = PhoenixUI:v22("TextButton",true)
                v67.BackgroundColor3 = PhoenixUI.Accent
                v67.Size = UDim2.new(1,-10,0,30)
                v67.Text = v66.Text
                v67.TextColor3 = Color3.fromRGB(255,255,255)
                v67.FontFace = PhoenixUI.UIFont
                v67.TextSize = 12
                v67.AutoButtonColor = false
                v67.Parent = v55

                PhoenixUI:v5(v67.MouseButton1Click,function()
                    v66.Callback()
                end)

                return v66
            end

            function v51:Textbox(v68)
                v68 = v68 or {}
                local v69 = {
                    Text = v68.Text or "",
                    Placeholder = v68.Placeholder or "Enter text...",
                    Flag = v68.Flag,
                    Callback = v68.Callback or function() end
                }

                local v70 = PhoenixUI:v22("Frame",false)
                v70.BackgroundColor3 = Color3.fromRGB(45,45,45)
                v70.Size = UDim2.new(1,-10,0,30)
                v70.Parent = v55

                local v71 = PhoenixUI:v22("TextBox",false)
                v71.BackgroundTransparency = 1
                v71.Size = UDim2.new(1,-10,1,0)
                v71.Position = UDim2.new(0,5,0,0)
                v71.Text = v69.Text
                v71.PlaceholderText = v69.Placeholder
                v71.TextColor3 = Color3.fromRGB(255,255,255)
                v71.FontFace = PhoenixUI.UIFont
                v71.TextSize = 12
                v71.TextXAlignment = Enum.TextXAlignment.Left
                v71.ClearTextOnFocus = false
                v71.Parent = v70

                local v72 = PhoenixUI:v22("Frame",true)
                v72.BackgroundColor3 = PhoenixUI.Accent
                v72.Size = UDim2.new(1,0,0,1)
                v72.Position = UDim2.new(0,0,1,0)
                v72.Parent = v70

                function v69:Set(v73)
                    v71.Text = v73
                    if v69.Flag then
                        PhoenixUI.Flags[v69.Flag] = v73
                    end
                    v69.Callback(v73)
                end

                PhoenixUI:v5(v71.FocusLost,function()
                    v69:Set(v71.Text)
                end)

                if v69.Flag then
                    PhoenixUI.Flags[v69.Flag] = v69.Text
                end

                return v69
            end

            function v51:Colorpicker(v74)
                v74 = v74 or {}
                local v75 = {
                    Color = v74.Color or PhoenixUI.Accent,
                    Flag = v74.Flag,
                    Callback = v74.Callback or function() end
                }

                local v76 = PhoenixUI:v22("Frame",false)
                v76.BackgroundColor3 = Color3.fromRGB(45,45,45)
                v76.Size = UDim2.new(1,-10,0,25)
                v76.Parent = v55

                local v77 = PhoenixUI:v22("TextLabel",false)
                v77.Text = "Color"
                v77.TextColor3 = Color3.fromRGB(255,255,255)
                v77.FontFace = PhoenixUI.UIFont
                v77.TextSize = 12
                v77.BackgroundTransparency = 1
                v77.Position = UDim2.new(0,5,0,0)
                v77.Size = UDim2.new(0,40,1,0)
                v77.TextXAlignment = Enum.TextXAlignment.Left
                v77.Parent = v76

                local v78 = PhoenixUI:v22("TextButton",false)
                v78.BackgroundColor3 = v75.Color
                v78.BorderSizePixel = 0
                v78.Position = UDim2.new(0,50,0,5)
                v78.Size = UDim2.new(0,60,0,15)
                v78.Text = ""
                v78.AutoButtonColor = false
                v78.Parent = v76

                PhoenixUI:v5(v78.MouseButton1Click,function()
                    v75.Callback(v75.Color)
                end)

                function v75:Set(v79)
                    v75.Color = v79
                    v78.BackgroundColor3 = v79
                    if v75.Flag then
                        PhoenixUI.Flags[v75.Flag] = v79
                    end
                end

                if v75.Flag then
                    PhoenixUI.Flags[v75.Flag] = v75.Color
                end

                return v75
            end

            function v51:Label(v80)
                v80 = v80 or {}
                local v81 = {
                    Text = v80.Text or "Label"
                }

                local v82 = PhoenixUI:v22("TextLabel",false)
                v82.BackgroundTransparency = 1
                v82.Size = UDim2.new(1,-10,0,20)
                v82.Text = v81.Text
                v82.TextColor3 = Color3.fromRGB(255,255,255)
                v82.FontFace = PhoenixUI.UIFont
                v82.TextSize = 12
                v82.TextXAlignment = Enum.TextXAlignment.Left
                v82.Parent = v55

                function v81:Set(v83)
                    v82.Text = v83
                end

                return v81
            end

            v44.Sections[#v44.Sections + 1] = v51
            return v51
        end

        if #v27.Pages == 0 then
            v44:SetActive(true)
        end

        v27.Pages[#v27.Pages + 1] = v44
        return v44
    end

    function v27:Watermark(v84)
        v84 = v84 or {}
        local v85 = {
            Text = v84.Text or "PhoenixUI",
            Visible = true
        }

        local v86 = PhoenixUI:v22("Frame",false)
        v86.BackgroundColor3 = Color3.fromRGB(50,50,50)
        v86.Position = UDim2.new(0,10,0,10)
        v86.Size = UDim2.new(0,0,0,25)
        v86.AutomaticSize = Enum.AutomaticSize.X
        v86.Parent = PhoenixUI.ScreenGUI

        local v87 = PhoenixUI:v22("Frame",false)
        v87.BackgroundColor3 = Color3.fromRGB(20,20,20)
        v87.Position = UDim2.new(0,1,0,1)
        v87.Size = UDim2.new(1,-2,1,-2)
        v87.Parent = v86

        local v88 = PhoenixUI:v22("TextLabel",false)
        v88.Text = v85.Text
        v88.TextColor3 = Color3.fromRGB(255,255,255)
        v88.FontFace = PhoenixUI.UIFont
        v88.TextSize = 12
        v88.BackgroundTransparency = 1
        v88.Size = UDim2.new(1,0,1,0)
        v88.TextXAlignment = Enum.TextXAlignment.Center
        v88.Parent = v87

        local v89 = PhoenixUI:v22("Frame",true)
        v89.BackgroundColor3 = PhoenixUI.Accent
        v89.Size = UDim2.new(1,0,0,2)
        v89.Parent = v86

        function v85:SetText(v90)
            v88.Text = v90
        end

        function v85:SetVisible(v91)
            v86.Visible = v91
        end

        table.insert(PhoenixUI.Watermarks,v85)
        return v85
    end

    return v27
end

return PhoenixUI
