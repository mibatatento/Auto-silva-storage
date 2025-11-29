-- AUTO SILVA METHOD - Hosted on GitHub

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

local pl = Players.LocalPlayer
local pg = pl:WaitForChild("PlayerGui")

-- GLOBAL STORAGE
if not _G.SilvaStorage then _G.SilvaStorage = {Links = {}} end
local Storage = _G.SilvaStorage

---------------------------------------------------------------------
-- GUI
---------------------------------------------------------------------
local sg = Instance.new("ScreenGui", pg)
sg.Name = "AutoSilvaMethod"
sg.ResetOnSpawn = false

local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0,360,0,160)
main.Position = UDim2.new(0.5,-180,0.4,-80)
main.BackgroundColor3 = Color3.fromRGB(45,45,45)
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,10)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,34)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Text = "Auto Silva Method"

local open = Instance.new("TextButton", main)
open.Size = UDim2.new(0.8,0,0,45)
open.Position = UDim2.new(0.1,0,0.45,0)
open.BackgroundColor3 = Color3.fromRGB(25,25,25)
open.TextColor3 = Color3.fromRGB(255,255,255)
open.TextScaled = true
open.Font = Enum.Font.GothamBold
open.Text = "Abrir Auto Silva"
Instance.new("UICorner", open)

---------------------------------------------------------------------
-- SEGUNDA JANELA
---------------------------------------------------------------------
local second = Instance.new("Frame", sg)
second.Size = UDim2.new(0,330,0,150)
second.Position = UDim2.new(0.5,-165,0.4,-75)
second.BackgroundColor3 = Color3.fromRGB(35,35,35)
second.Active = true
second.Draggable = true
second.Visible = false
Instance.new("UICorner", second).CornerRadius = UDim.new(0,10)

local sTitle = Instance.new("TextLabel", second)
sTitle.Size = UDim2.new(1,0,0.3,0)
sTitle.BackgroundTransparency = 1
sTitle.Font = Enum.Font.GothamBold
sTitle.TextColor3 = Color3.fromRGB(255,255,255)
sTitle.TextScaled = true
sTitle.Text = "Auto Silva Method"

local input = Instance.new("TextBox", second)
input.Size = UDim2.new(0.9,0,0.25,0)
input.Position = UDim2.new(0.05,0,0.32,0)
input.BackgroundColor3 = Color3.fromRGB(25,25,25)
input.PlaceholderText = "Cole o link aqui"
input.TextScaled = true
input.Text = ""
input.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", input)

local continuar = Instance.new("TextButton", second)
continuar.Size = UDim2.new(0.6,0,0,40)
continuar.Position = UDim2.new(0.2,0,0.63,0)
continuar.BackgroundColor3 = Color3.fromRGB(0,140,255)
continuar.TextColor3 = Color3.fromRGB(255,255,255)
continuar.TextScaled = true
continuar.Font = Enum.Font.GothamBold
continuar.Text = "Continue"
Instance.new("UICorner", continuar)

local msg = Instance.new("TextLabel", second)
msg.Size = UDim2.new(1,0,0,20)
msg.Position = UDim2.new(0,0,0.85,0)
msg.BackgroundTransparency = 1
msg.Font = Enum.Font.Gotham
msg.TextScaled = true
msg.TextColor3 = Color3.fromRGB(255,255,255)

local back = Instance.new("TextButton", second)
back.Size = UDim2.new(0,25,0,25)
back.Position = UDim2.new(0,5,0,5)
back.Text = "<"
back.TextColor3 = Color3.fromRGB(255,255,255)
back.BackgroundTransparency = 1
back.TextScaled = true

---------------------------------------------------------------------
-- LÓGICA
---------------------------------------------------------------------
open.MouseButton1Click:Connect(function()
	main.Visible = false
	second.Visible = true
end)

back.MouseButton1Click:Connect(function()
	second.Visible = false
	main.Visible = true
end)

local function freeze(on)
	local char = pl.Character
	if not char then return end
	local hum = char:FindFirstChildWhichIsA("Humanoid")

	if hum then
		hum.WalkSpeed = on and 0 or 16
		hum.JumpPower = on and 0 or 50
	end

	UIS.MouseBehavior = on and Enum.MouseBehavior.LockCenter or Enum.MouseBehavior.Default
end

local function showProgress()
	local prog = Instance.new("ScreenGui", pg)
	local bg = Instance.new("Frame", prog)
	bg.Size = UDim2.new(1,0,1,0)
	bg.BackgroundColor3 = Color3.new(0,0,0)

	local lbl = Instance.new("TextLabel", bg)
	lbl.Size = UDim2.new(1,0,1,0)
	lbl.BackgroundTransparency = 1
	lbl.Font = Enum.Font.GothamBold
	lbl.TextColor3 = Color3.new(1,1,1)
	lbl.TextScaled = true

	task.spawn(function()
		for i = 0,100 do
			lbl.Text = "Auto Silva Method: "..i.."%"
			task.wait(0.1)
		end
		while true do
			lbl.Text = "Auto Silva Method: 100%"
			task.wait(1)
		end
	end)
end

continuar.MouseButton1Click:Connect(function()
	local txt = input.Text

	if string.sub(txt,1,6) ~= "https:" then
		msg.Text = "Link inválido ❌"
		msg.TextColor3 = Color3.fromRGB(255,0,0)
		return
	end

	msg.Text = "Link válido ✔"
	msg.TextColor3 = Color3.fromRGB(0,255,0)

	table.insert(Storage.Links, txt)

	task.wait(0.5)

	freeze(true)
	showProgress()
end)
