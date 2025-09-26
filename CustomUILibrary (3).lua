local Library = {}
Library.Open = true
Library.Accent = Color3.fromRGB(85,170,255)
Library.PageAmount = 0
Library.Pages = {}
Library.Sections = {}
Library.Flags = {}
Library.UnNamedFlags = 0
Library.ThemeObjects = {}
Library.Holder = nil
Library.Keys = {
	[Enum.KeyCode.LeftShift] = "LShift",
	[Enum.KeyCode.RightShift] = "RShift",
	[Enum.KeyCode.LeftControl] = "LCtrl",
	[Enum.KeyCode.RightControl] = "RCtrl",
	[Enum.KeyCode.LeftAlt] = "LAlt",
	[Enum.KeyCode.RightAlt] = "RAlt",
	[Enum.KeyCode.CapsLock] = "Caps",
	[Enum.KeyCode.One] = "1",
	[Enum.KeyCode.Two] = "2",
	[Enum.KeyCode.Three] = "3",
	[Enum.KeyCode.Four] = "4",
	[Enum.KeyCode.Five] = "5",
	[Enum.KeyCode.Six] = "6",
	[Enum.KeyCode.Seven] = "7",
	[Enum.KeyCode.Eight] = "8",
	[Enum.KeyCode.Nine] = "9",
	[Enum.KeyCode.Zero] = "0",
	[Enum.KeyCode.KeypadOne] = "Num1",
	[Enum.KeyCode.KeypadTwo] = "Num2",
	[Enum.KeyCode.KeypadThree] = "Num3",
	[Enum.KeyCode.KeypadFour] = "Num4",
	[Enum.KeyCode.KeypadFive] = "Num5",
	[Enum.KeyCode.KeypadSix] = "Num6",
	[Enum.KeyCode.KeypadSeven] = "Num7",
	[Enum.KeyCode.KeypadEight] = "Num8",
	[Enum.KeyCode.KeypadNine] = "Num9",
	[Enum.KeyCode.KeypadZero] = "Num0",
	[Enum.KeyCode.Minus] = "-",
	[Enum.KeyCode.Equals] = "=",
	[Enum.KeyCode.Tilde] = "~",
	[Enum.KeyCode.LeftBracket] = "[",
	[Enum.KeyCode.RightBracket] = "]",
	[Enum.KeyCode.RightParenthesis] = ")",
	[Enum.KeyCode.LeftParenthesis] = "(",
	[Enum.KeyCode.Semicolon] = ",",
	[Enum.KeyCode.Quote] = "'",
	[Enum.KeyCode.BackSlash] = "\\",
	[Enum.KeyCode.Comma] = ",",
	[Enum.KeyCode.Period] = ".",
	[Enum.KeyCode.Slash] = "/",
	[Enum.KeyCode.Asterisk] = "*",
	[Enum.KeyCode.Plus] = "+",
	[Enum.KeyCode.Period] = ".",
	[Enum.KeyCode.Backquote] = "`",
	[Enum.UserInputType.MouseButton1 or Enum.UserInputType.Touch ] = "MB1",
	[Enum.UserInputType.MouseButton2] = "MB2",
	[Enum.UserInputType.MouseButton3] = "MB3"
}
Library.Connections = {}
Library.UIKey = Enum.KeyCode.End
Library.ScreenGUI = nil
Library.FSize = 12
Library.UIFont = Font.new("rbxassetid://12187371840")
Library.SettingsPage = nil
Library.VisValues = {}
Library.Cooldown = false
Library.Friends = {}
Library.Priorities = {}
Library.KeyList = nil
Library.Notifs = {}

local Flags = {}

Library.__index = Library
Library.Pages.__index = Library.Pages
Library.Sections.__index = Library.Sections
local LocalPlayer = game:GetService('Players').LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

do
	function Library:Connection(Signal, Callback)
		local Con = Signal:Connect(Callback)
		return Con
	end
	function Library:Disconnect(Connection)
		Connection:Disconnect()
	end
	function Library.NextFlag()
		Library.UnNamedFlags = Library.UnNamedFlags + 1
		return string.format("%.14g", Library.UnNamedFlags)
	end
	function Library:RGBA(r,g,b)
		return Color3.fromRGB(r,g,b)
	end
	function Library:SetOpen(bool)
		if typeof(bool) == 'boolean' then
			Library.Open = bool
			if Library.Holder then
				Library.Holder.Visible = bool
			end
		end
	end
	function Library:IsMouseOverFrame(Frame)
		local AbsPos, AbsSize = Frame.AbsolutePosition, Frame.AbsoluteSize
		if Mouse.X >= AbsPos.X and Mouse.X <= AbsPos.X + AbsSize.X and Mouse.Y >= AbsPos.Y and Mouse.Y <= AbsPos.Y + AbsSize.Y then
			return true
		end
	end
	function Library:ChangeAccent(Color)
		Library.Accent = Color
		for _, obj in next, Library.ThemeObjects do
			if obj:IsA("Frame") or obj:IsA("TextButton") or obj:IsA("TextLabel") then
				if obj:IsA("Frame") or obj:IsA("TextButton") then
					obj.BackgroundColor3 = Color
				else
					obj.TextColor3 = Color
				end
			elseif obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
				obj.ImageColor3 = Color
			elseif obj:IsA("ScrollingFrame") then
				obj.ScrollBarImageColor3 = Library.Accent
			elseif obj:IsA("UIStroke") then
				if obj.Color then obj.Color = Color end
			end
		end
	end
	function Library:NewInstance(Inst, Theme)
		local Obj = Instance.new(Inst)
		if Theme then
			table.insert(Library.ThemeObjects, Obj)
			if Obj:IsA("Frame") or Obj:IsA("TextButton") then
				Obj.BackgroundColor3 = Library.Accent
				if Obj:IsA("ScrollingFrame") then Obj.ScrollBarImageColor3 = Library.Accent end
			elseif Obj:IsA("TextLabel") or Obj:IsA("TextBox") then
				Obj.TextColor3 = Library.Accent
			elseif Obj:IsA("ImageLabel") or Obj:IsA("ImageButton") then
				Obj.ImageColor3 = Library.Accent
			elseif Obj:IsA("UIStroke") then
				Obj.Color = Library.Accent
			end
		end
		return Obj
	end
	function Library:Resize(object, background)
		local dragging = false
		Library:Connection(object.InputBegan, function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
			end
		end)
		Library:Connection(UserInputService.InputChanged, function(input)
			if dragging then
				local MouseLocation = UserInputService:GetMouseLocation()
				local X = math.clamp(MouseLocation.X - background.AbsolutePosition.X, 550, 9999)
				local Y = math.clamp((MouseLocation.Y - 36) - background.AbsolutePosition.Y, 600, 9999)
				background.Size = UDim2.new(0,X,0,Y)
				for Index, Page in pairs(Library.Pages) do
					if Page.Elements and Page.Elements.Button then
						Page.Elements.Button.Size = UDim2.new(0, Library.PageAmount and ((((background.Size.X.Offset - 35) - ((Library.PageAmount - 1) * 2)) / Library.PageAmount)) - 3 or 65, 1, 0)
					end
				end
			end
		end)
		Library:Connection(UserInputService.InputEnded, function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = false
			end
		end)
	end
end

do
	function Library:NewPicker(name, default, defaultalpha, parent, count, flag, callback)
		local Icon = Instance.new("TextButton", parent)
		Icon.Name = "Icon"
		Icon.AnchorPoint = Vector2.new(0,0.5)
		Icon.BackgroundColor3 = default
		Icon.BorderColor3 = Color3.fromRGB(50,50,50)
		Icon.BorderSizePixel = 1
		if count == 1 then
			Icon.Position = UDim2.new(1, - (count * 21),0.5,0)
		else
			Icon.Position = UDim2.new(1, - (count * 21) - (count * 4),0.5,0)
		end
		Icon.Size = UDim2.new(0,20,0,8)
		Icon.Text = ""
		Icon.AutoButtonColor = false

		local Outline4 = Instance.new("Frame", Icon)
		Outline4.Name = "Outline"
		Outline4.BackgroundTransparency = 1
		Outline4.BorderSizePixel = 0
		Outline4.Position = UDim2.new(0, -1, 0, -1)
		Outline4.Size = UDim2.new(1,2,1,2)
		local UIStroke = Instance.new("UIStroke", Outline4)
		UIStroke.LineJoinMode = Enum.LineJoinMode.Miter

		local ColorWindow = Instance.new("Frame", Icon)
		ColorWindow.Name = "ColorWindow"
		ColorWindow.AnchorPoint = Vector2.new(1,0)
		ColorWindow.BackgroundColor3 = Color3.fromRGB(50,50,50)
		ColorWindow.Position = UDim2.new(1,0,1,2)
		ColorWindow.Size = UDim2.new(0,170,0,150)
		ColorWindow.ZIndex = 2
		ColorWindow.Visible = false

		local ColorInline = Instance.new("Frame", ColorWindow)
		ColorInline.Name = "ColorInline"
		ColorInline.BackgroundColor3 = Color3.fromRGB(25,25,25)
		ColorInline.Position = UDim2.new(0,1,0,1)
		ColorInline.Size = UDim2.new(1,-2,1,-2)

		local Color = Instance.new("TextButton", ColorInline)
		Color.Name = "Color"
		Color.FontFace = Library.UIFont
		Color.Text = ""
		Color.TextSize = 14
		Color.AutoButtonColor = false
		Color.BackgroundColor3 = default
		Color.BorderColor3 = Color3.fromRGB(50,50,50)
		Color.Position = UDim2.new(0,6,0,6)
		Color.Size = UDim2.new(1,-30,1,-12)

		local Sat = Instance.new("ImageLabel", Color)
		Sat.Name = "Sat"
		Sat.Image = "http://www.roblox.com/asset/?id=14684562507"
		Sat.BackgroundTransparency = 1
		Sat.Size = UDim2.new(1,0,1,0)

		local Val = Instance.new("ImageLabel", Color)
		Val.Name = "Val"
		Val.Image = "http://www.roblox.com/asset/?id=14684563800"
		Val.BackgroundTransparency = 1
		Val.Size = UDim2.new(1,0,1,0)

		local Hue = Instance.new("ImageButton", ColorInline)
		Hue.Name = "Hue"
		Hue.Image = "http://www.roblox.com/asset/?id=14684557999"
		Hue.AutoButtonColor = false
		Hue.BackgroundColor3 = Color3.fromRGB(255,255,255)
		Hue.BorderColor3 = Color3.fromRGB(50,50,50)
		Hue.Position = UDim2.new(1,-16,0,6)
		Hue.Size = UDim2.new(0,10,1,-12)

		local mouseover = false
		local hue, sat, val = default:ToHSV()
		local hsv = default:ToHSV()
		local alpha = defaultalpha
		local slidingsaturation = false
		local slidinghue = false

		local function update()
			local real_pos = UserInputService:GetMouseLocation()
			local mouse_position = Vector2.new(real_pos.X - 5, real_pos.Y - 30)
			local relative_palette = (mouse_position - Color.AbsolutePosition)
			local relative_hue = (mouse_position - Hue.AbsolutePosition)
			if slidingsaturation then
				sat = math.clamp(1 - relative_palette.X / Color.AbsoluteSize.X, 0, 1)
				val = math.clamp(1 - relative_palette.Y / Color.AbsoluteSize.Y, 0, 1)
			elseif slidinghue then
				hue = math.clamp(relative_hue.Y / Hue.AbsoluteSize.Y, 0, 1)
			end
			hsv = Color3.fromHSV(hue, sat, val)
			Color.BackgroundColor3 = Color3.fromHSV(hue,1,1)
			Icon.BackgroundColor3 = hsv
			if flag then
				Library.Flags[flag] = Library:RGBA(hsv.r*255, hsv.g*255, hsv.b*255)
			end
			callback(Library:RGBA(hsv.r*255, hsv.g*255, hsv.b*255))
		end

		local function set(color, a)
			if type(color) == "table" then
				a = color[4]
				color = Color3.fromHSV(color[1], color[2], color[3])
			end
			if type(color) == "string" then
				color = Color3.fromHex(color)
			end
			hue, sat, val = color:ToHSV()
			alpha = a or 1
			hsv = Color3.fromHSV(hue, sat, val)
			Icon.BackgroundColor3 = hsv
			Color.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
			if flag then
				Library.Flags[flag] = Library:RGBA(hsv.r*255, hsv.g*255, hsv.b*255)
			end
			callback(Library:RGBA(hsv.r*255, hsv.g*255, hsv.b*255))
		end

		Flags[flag] = set

		set(default, defaultalpha)

		Sat.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				slidingsaturation = true
				update()
			end
		end)
		Sat.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				slidingsaturation = false
				update()
			end
		end)
		Hue.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				slidinghue = true
				update()
			end
		end)
		Hue.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				slidinghue = false
				update()
			end
		end)
		Library:Connection(UserInputService.InputChanged, function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				if slidinghue then update() end
				if slidingsaturation then update() end
			end
		end)

		Library:Connection(UserInputService.InputBegan, function(Input)
			if ColorWindow.Visible and (Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch) then
				if not Library:IsMouseOverFrame(ColorWindow) and not Library:IsMouseOverFrame(Icon) and not Library:IsMouseOverFrame(parent) then
					ColorWindow.Visible = false
					parent.ZIndex = 1
				end
			end
		end)

		Icon.MouseButton1Down:Connect(function()
			ColorWindow.Visible = true
			parent.ZIndex = 5
		end)

		return { Set = set }, ColorWindow
	end
end

do
	local Pages = Library.Pages
	local Sections = Library.Sections

	function Library:Window(Options)
		local Window = {
			Pages = {},
			Sections = {},
			Elements = {},
			PageAmount = Options.Amount or Options.amount or 5,
			Dragging = { false, UDim2.new(0, 0, 0, 0) },
			Name = (Options.Name or Options.name or "Name")
		}
		local UI = Instance.new("ScreenGui", game:GetService("RunService"):IsStudio() and game.Players.LocalPlayer.PlayerGui or game.CoreGui)
		UI.Name = "UI"
		UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		Library.ScreenGUI = UI

		local AccentOutline = Instance.new("TextButton", UI)
		AccentOutline.Name = "AccentOutline"
		AccentOutline.AnchorPoint = Vector2.new(0,0)
		AccentOutline.BackgroundColor3 = Library.Accent
		AccentOutline.BorderColor3 = Color3.fromRGB(0,0,0)
		AccentOutline.Position = UDim2.new(0,200,0,200)
		AccentOutline.Size = UDim2.new(0,550,0,600)
		AccentOutline.ZIndex = 2
		AccentOutline.Text = ""
		AccentOutline.RichText = true
		AccentOutline.AutoButtonColor = false

		local Inline = Instance.new("Frame", AccentOutline)
		Inline.Name = "Inline"
		Inline.BackgroundColor3 = Color3.fromRGB(20,20,20)
		Inline.Position = UDim2.new(0,1,0,1)
		Inline.Size = UDim2.new(1,-2,1,-2)
		Inline.ZIndex = 2

		local HolderOutline = Instance.new("Frame", Inline)
		HolderOutline.Name = "HolderOutline"
		HolderOutline.BackgroundColor3 = Color3.fromRGB(50,50,50)
		HolderOutline.Position = UDim2.new(0,6,0,22)
		HolderOutline.Size = UDim2.new(1,-12,1,-28)

		local HolderInline = Instance.new("Frame", HolderOutline)
		HolderInline.Name = "HolderInline"
		HolderInline.BackgroundColor3 = Color3.fromRGB(20,20,20)
		HolderInline.Position = UDim2.new(0,1,0,1)
		HolderInline.Size = UDim2.new(1,-2,1,-2)

		local PageOutline = Instance.new("Frame", HolderInline)
		PageOutline.Name = "PageOutline"
		PageOutline.BackgroundColor3 = Color3.fromRGB(50,50,50)
		PageOutline.Position = UDim2.new(0,4,0,26)
		PageOutline.Size = UDim2.new(1,-8,1,-30)
		PageOutline.ZIndex = 6

		local PageInline = Instance.new("Frame", PageOutline)
		PageInline.Name = "PageInline"
		PageInline.BackgroundColor3 = Color3.fromRGB(30,30,30)
		PageInline.Position = UDim2.new(0,1,0,1)
		PageInline.Size = UDim2.new(1,-2,1,-2)

		local Tabs = Instance.new("Frame", HolderInline)
		Tabs.Name = "Tabs"
		Tabs.BackgroundTransparency = 1
		Tabs.Position = UDim2.new(0,4,0,5)
		Tabs.Size = UDim2.new(1,-8,0,20)
		Tabs.ZIndex = 6
		local UIListLayout = Instance.new("UIListLayout", Tabs)
		UIListLayout.Padding = UDim.new(0,8)
		UIListLayout.FillDirection = Enum.FillDirection.Horizontal
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		Tabs.Visible = false

		HolderInline.Parent = HolderOutline
		HolderOutline.Parent = Inline

		local Resize = Instance.new("TextButton", Inline)
		Resize.Name = "Resize"
		Resize.FontFace = Library.UIFont
		Resize.Text = ""
		Resize.AutoButtonColor = false
		Resize.BackgroundTransparency = 1
		Resize.Position = UDim2.new(1,-15,1,-15)
		Resize.Size = UDim2.new(0,20,0,20)
		Resize.ZIndex = 100

		local ImageLabel = Instance.new("ImageLabel", Inline)
		ImageLabel.Name = "ImageLabel"
		ImageLabel.Image = "rbxassetid://9052792535"
		ImageLabel.ImageColor3 = Color3.fromRGB(50,50,50)
		ImageLabel.ScaleType = Enum.ScaleType.Tile
		ImageLabel.BackgroundTransparency = 1
		ImageLabel.Size = UDim2.new(0,14,0,14)
		ImageLabel.Position = UDim2.new(1,-14,1,-14)

		Window.Elements = {
			TabHolder = Tabs,
			Holder = PageInline,
			Base = AccentOutline
		}

		Library:Connection(AccentOutline.InputBegan, function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				local Location = UserInputService:GetMouseLocation()
				Window.Dragging[1] = true
				Window.Dragging[2] = UDim2.new(0, Location.X - AccentOutline.AbsolutePosition.X, 0, Location.Y - AccentOutline.AbsolutePosition.Y)
			end
		end)
		Library:Connection(UserInputService.InputEnded, function(Input)
			if (Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch) and Window.Dragging[1] then
				Window.Dragging[1] = false
				Window.Dragging[2] = UDim2.new(0,0,0,0)
			end
		end)
		Library:Connection(UserInputService.InputChanged, function(Input)
			local Location = UserInputService:GetMouseLocation()
			if Window.Dragging[1] then
				AccentOutline.Position = UDim2.new(0, Location.X - Window.Dragging[2].X.Offset + (AccentOutline.Size.X.Offset * AccentOutline.AnchorPoint.X), 0, Location.Y - Window.Dragging[2].Y.Offset + (AccentOutline.Size.Y.Offset * AccentOutline.AnchorPoint.Y))
			end
		end)
		Library:Connection(UserInputService.InputBegan, function(Input)
			if Input.KeyCode == Library.UIKey then
				Library:SetOpen(not Library.Open)
			end
		end)
		Library:Resize(Resize, AccentOutline)

		Library.Holder = AccentOutline
		Library.PageAmount = Window.PageAmount
		return setmetatable(Window, Library)
	end

	function Library:Page(Properties)
		Properties = Properties or {}
		local Page = {
			Name = Properties.Name or Properties.name or "Page",
			Window = self,
			Open = false,
			Sections = {},
			Pages = {},
			Elements = {},
			Weapons = {},
			Size = Properties.Size or 65,
			Icons = Properties.Weapons or Properties.weapons or false
		}
		local NewButton = Instance.new("TextButton")
		NewButton.Name = "NewButton"
		NewButton.FontFace = Library.UIFont
		NewButton.Text = ""
		NewButton.AutoButtonColor = false
		NewButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
		NewButton.BorderColor3 = Color3.fromRGB(0,0,0)
		NewButton.Size = UDim2.new(0, Page.Window.PageAmount and ((((Page.Window.Elements.Base.Size.X.Offset - 35) - ((Page.Window.PageAmount - 1) * 2)) / Page.Window.PageAmount)) - 3 or Page.Size, 1, 0)

		local ButtonInline = Instance.new("Frame", NewButton)
		ButtonInline.Name = "ButtonInline"
		ButtonInline.BackgroundColor3 = Color3.fromRGB(20,20,20)
		ButtonInline.Position = UDim2.new(0,1,0,1)
		ButtonInline.Size = UDim2.new(1,-2,1,-2)
		ButtonInline.ZIndex = 5

		local Accent = Library:NewInstance("Frame", true)
		Accent.Name = "Accent"
		Accent.BackgroundColor3 = Library.Accent
		Accent.Size = UDim2.new(1,0,0,1)
		Accent.Parent = ButtonInline
		Accent.Visible = false

		local PageName = Instance.new("TextLabel", ButtonInline)
		PageName.Name = "PageName"
		PageName.FontFace = Library.UIFont
		PageName.TextColor3 = Color3.fromRGB(145,145,145)
		PageName.TextSize = 12
		PageName.Text = Page.Name
		PageName.BackgroundTransparency = 1
		PageName.Position = UDim2.new(0,0,0,1)
		PageName.Size = UDim2.new(1,0,1,0)

		local Line = Instance.new("Frame", NewButton)
		Line.Name = "Line"
		Line.BackgroundColor3 = Color3.fromRGB(30,30,30)
		Line.Position = UDim2.new(0,1,1,-2)
		Line.Size = UDim2.new(1,-2,0,3)
		Line.ZIndex = 7

		NewButton.Parent = Page.Window.Elements.TabHolder

		local NewPage = Instance.new("Frame", Page.Window.Elements.Holder)
		NewPage.Name = "NewPage"
		NewPage.BackgroundTransparency = 1
		NewPage.Position = UDim2.new(0,6,0,6)
		NewPage.Size = UDim2.new(1,-12,1,-12)
		NewPage.Visible = false

		local Left = Instance.new("Frame", NewPage)
		Left.Name = "Left"
		Left.BackgroundTransparency = 1
		Left.Size = UDim2.new(0.5, -4, 1, 0)
		Left.ZIndex = 2
		local UIListLayout = Instance.new("UIListLayout", Left)
		UIListLayout.Padding = UDim.new(0,6)
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

		local Right = Instance.new("Frame", NewPage)
		Right.Name = "Right"
		Right.BackgroundTransparency = 1
		Right.Position = UDim2.new(0.5,4,0,0)
		Right.Size = UDim2.new(0.5,-4,1,0)
		local UIListLayout1 = Instance.new("UIListLayout", Right)
		UIListLayout1.Padding = UDim.new(0,6)
		UIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder

		local Weapons = Instance.new("Frame", Page.Window.Elements.Holder)
		Weapons.Name = "Weapons"
		Weapons.BackgroundColor3 = Color3.fromRGB(50,50,50)
		Weapons.Position = UDim2.new(0,6,0,6)
		Weapons.Size = UDim2.new(1,-12,0,50)
		Weapons.Visible = false

		local WeaponInline = Instance.new("Frame", Weapons)
		WeaponInline.Name = "WeaponInline"
		WeaponInline.BackgroundColor3 = Color3.fromRGB(20,20,20)
		WeaponInline.Position = UDim2.new(0,1,0,1)
		WeaponInline.Size = UDim2.new(1,-2,1,-2)

		local WAccent = Library:NewInstance("Frame", true)
		WAccent.Name = "WAccent"
		WAccent.BackgroundColor3 = Library.Accent
		WAccent.Size = UDim2.new(1,0,0,1)
		WAccent.Parent = WeaponInline

		local Holder = Instance.new("Frame", WeaponInline)
		Holder.Name = "Holder"
		Holder.BackgroundTransparency = 1
		Holder.Position = UDim2.new(0,0,0,2)
		Holder.Size = UDim2.new(1,0,1,-2)
		local UIListLayout2 = Instance.new("UIListLayout", Holder)
		UIListLayout2.FillDirection = Enum.FillDirection.Horizontal
		UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder

		function Page:Turn(bool)
			Page.Open = bool
			if not Page.Icons then
				NewPage.Visible = Page.Open
			else
				Weapons.Visible = Page.Open
				for Index, Weapon in pairs(Page.Weapons) do
					Weapon:Turn(Weapon.Open)
				end
			end
			ButtonInline.BackgroundColor3 = Page.Open and Color3.fromRGB(30,30,30) or Color3.fromRGB(20,20,20)
			PageName.TextColor3 = Page.Open and Color3.fromRGB(255,255,255) or Color3.fromRGB(145,145,145)
			Line.Size = Page.Open and UDim2.new(1,-2,0,4) or UDim2.new(1,-2,0,3)
			Line.BackgroundColor3 = Page.Open and Color3.fromRGB(30,30,30) or Color3.fromRGB(20,20,20)
			Accent.Visible = Page.Open
		end

		Library:Connection(NewButton.MouseButton1Down, function()
			if not Page.Open then
				for _, Pages in pairs(Page.Window.Pages) do
					if Pages.Open and Pages ~= Page then
						Pages:Turn(false)
					end
				end
				Page:Turn(true)
			end
		end)

		function Page:UpdateWeapons()
			for Index, Weapon in pairs(Page.Weapons) do
				Weapon.Elements.Button.Size = UDim2.new(1/#Page.Weapons,0,1,0)
				Weapon:Turn(Weapon.Open)
			end
		end

		Page.Elements = {
			Left = Page.Icons and nil or Left,
			Right = Page.Icons and nil or Right,
			Main = NewPage,
			Button = NewButton,
			WeaponOutline = Weapons,
			WeaponInline = Holder
		}

		if #Page.Window.Pages == 0 then
			Page:Turn(true)
		end
		Page.Window.Pages[#Page.Window.Pages + 1] = Page
		Library.Pages[#Library.Pages + 1] = Page
		Page.Window:UpdateTabs()
		return setmetatable(Page, Library.Pages)
	end

	function Library:Watermark(Properties)
		local Watermark = { Name = (Properties.Name or Properties.name or "watermark text | placeholder") }
		local Outline = Instance.new("Frame", Library.ScreenGUI)
		Outline.Name = "Outline"
		Outline.AutomaticSize = Enum.AutomaticSize.X
		Outline.BackgroundColor3 = Color3.fromRGB(50,50,50)
		Outline.Position = UDim2.new(0.01,0,0.02,0)
		Outline.Size = UDim2.new(0,0,0,16)
		Outline.Visible = true

		local Inline = Instance.new("Frame", Outline)
		Inline.Name = "Inline"
		Inline.BackgroundColor3 = Color3.fromRGB(20,20,20)
		Inline.Position = UDim2.new(0,1,0,1)
		Inline.Size = UDim2.new(1,-2,1,-2)

		local Value = Instance.new("TextLabel", Inline)
		Value.Name = "Value"
		Value.FontFace = Library.UIFont
		Value.Text = Watermark.Name
		Value.TextColor3 = Color3.fromRGB(255,255,255)
		Value.TextSize = 12
		Value.TextXAlignment = Enum.TextXAlignment.Left
		Value.AutomaticSize = Enum.AutomaticSize.X
		Value.BackgroundTransparency = 1
		Value.Size = UDim2.new(0,0,1,0)

		local UIPadding = Instance.new("UIPadding", Value)
		UIPadding.PaddingLeft = UDim.new(0,5)
		UIPadding.PaddingRight = UDim.new(0,5)
		UIPadding.PaddingTop = UDim.new(0,1)

		local Accent = Library:NewInstance("Frame", true)
		Accent.Name = "Accent"
		Accent.BackgroundColor3 = Library.Accent
		Accent.Size = UDim2.new(1,0,0,1)
		Accent.Parent = Outline

		function Watermark:UpdateText(NewText)
			Value.Text = NewText
		end
		function Watermark:SetVisible(State)
			Outline.Visible = State
		end
		return Watermark
	end
end

function Library:Notification(message, duration, color)
	local notification = { Container = nil, Objects = {} }
	local Position = Vector2.new(20,20)
	local NotifContainer = Instance.new('Frame', Library.ScreenGUI)
	NotifContainer.Name = "NotifContainer"
	NotifContainer.Position = UDim2.new(0,Position.X,0,Position.Y)
	NotifContainer.AutomaticSize = Enum.AutomaticSize.X
	NotifContainer.Size = UDim2.new(0,0,0,16)
	NotifContainer.BackgroundTransparency = 1
	NotifContainer.ZIndex = 99999999
	notification.Container = NotifContainer

	local Outline = Instance.new("Frame", NotifContainer)
	Outline.Name = "Outline"
	Outline.AutomaticSize = Enum.AutomaticSize.X
	Outline.BackgroundTransparency = 1
	Outline.Position = UDim2.new(0.01,0,0.02,0)
	Outline.Size = UDim2.new(0,0,0,16)
	table.insert(notification.Objects, Outline)

	local Inline = Instance.new("Frame", Outline)
	Inline.Name = "Inline"
	Inline.BackgroundTransparency = 1
	Inline.Position = UDim2.new(0,1,0,1)
	Inline.Size = UDim2.new(1,-2,1,-2)
	table.insert(notification.Objects, Inline)

	local Value = Instance.new("TextLabel", Inline)
	Value.Name = "Value"
	Value.FontFace = Library.UIFont
	Value.Text = message
	Value.RichText = true
	Value.TextColor3 = Color3.fromRGB(255,255,255)
	Value.TextSize = 12
	Value.TextStrokeTransparency = 0
	Value.TextXAlignment = Enum.TextXAlignment.Left
	Value.AutomaticSize = Enum.AutomaticSize.X
	Value.BackgroundTransparency = 1
	Value.Size = UDim2.new(0,0,1,0)
	table.insert(notification.Objects, Value)

	local UIPadding = Instance.new("UIPadding", Value)
	UIPadding.PaddingLeft = UDim.new(0,5)
	UIPadding.PaddingRight = UDim.new(0,5)
	UIPadding.PaddingTop = UDim.new(0,1)

	local Accent = Instance.new("Frame", Outline)
	Accent.Name = "Accent"
	Accent.BackgroundColor3 = color ~= nil and color or Library.Accent
	Accent.Size = UDim2.new(1,0,0,1)
	Accent.BackgroundTransparency = 1
	table.insert(notification.Objects, Accent)

	function notification:remove()
		for i,v in pairs(Library.Notifs) do
			if v == notification then
				table.remove(Library.Notifs, i)
				break
			end
		end
		task.wait(0.5)
		notification.Container:Destroy()
	end

	task.spawn(function()
		Outline.AnchorPoint = Vector2.new(1,0)
		for i,v in next, notification.Objects do
			if v:IsA("Frame") then
				TweenService:Create(v, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
			elseif v:IsA("UIStroke") then
				TweenService:Create(v, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Transparency = 0.8}):Play()
			end
		end
		TweenService:Create(Outline, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {AnchorPoint = Vector2.new(0,0)}):Play()
		TweenService:Create(Value, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
		task.wait(duration or 3)
		TweenService:Create(Outline, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {AnchorPoint = Vector2.new(1,0)}):Play()
		for i,v in next, notification.Objects do
			if v:IsA("Frame") then
				TweenService:Create(v, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
			elseif v:IsA("UIStroke") then
				TweenService:Create(v, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Transparency = 1}):Play()
			end
		end
		TweenService:Create(Value, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
	end)

	task.delay(duration or 3, function()
		notification:remove()
	end)

	table.insert(Library.Notifs, notification)
	NotifContainer.Position = UDim2.new(0,Position.X,0,Position.Y + (#Library.Notifs * 25))
	return notification
end

return Library
