---@diagnostic disable: undefined-global

--[[
_G.Hub = "Proxima Hub" -- Replace By Your Hub Name
_G.DiscordInvite = "TT3y4gkJtq" -- Replace By Your Discord Invite [REMOVE DISCORD.GG]
_G.HubLogo = "rbxassetid://10352990634" -- Replace By Your Hub Logo
--]]

local gui = game.Players.LocalPlayer.PlayerGui

---@diagnostic disable-next-line: trailing-space
for i,v in pairs(gui:GetChildren()) do 
    if v:IsA("ScreenGui") and v.Name == "DiscordInviteGui" then
        v:Destroy()
    end
end

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Frame_2 = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local UICorner_2 = Instance.new("UICorner")
local InviteText = Instance.new("TextLabel")
local HubName = Instance.new("TextLabel")
local Join = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local No = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local UICorner_5 = Instance.new("UICorner")

local Config = {
    Colors = {
        White = Color3.fromRGB(255,255,255),
        Gray = Color3.fromRGB(152, 149, 148),
        Blue = Color3.fromRGB(90, 101, 240),
	GrayFrame = Color3.fromRGB(30, 30, 30),
    },
    Font = {
        Nunito = Enum.Font.Nunito,
        Unk = Enum.Font.Unknown,
    },
    Texts = {
        Inv =  "You've been invited to join",
---@diagnostic disable-next-line: undefined-field
        Join = "Join "..tostring(_G.Hub),
        No = "No, thanks",
        Gui = "DiscordInviteGui"
    },
    TweenSpeed = {
        Sp1 = 0.1,
        Sp2 = 0.5,
        Sp3 = 0.6
    },
}

function Join_Discord_Server(inv)
	local req = request or http_request or (syn and syn.request)
	if req ~= nil then
		local http = game:GetService("HttpService")
		local t = {
			cmd = "INVITE_BROWSER",
			args = {
				code = inv
			},
			nonce = string.lower(http:GenerateGUID(false))
		}
		local post = http:JSONEncode(t)
		for port=6463, 6472, 1 do
			req({
				Url = "http://127.0.0.1:" .. tostring(port) .. "/rpc?v=1",
				Method = "POST",
				Body = post,
				Headers = {
					["Content-Type"] = "application/json",
					["Origin"] = "https://discord.com"
				}
			})
		end
	end
end

function JoinOrNoButton(jn,val,boolean)
    jn.MouseButton1Click:Connect(function()
            local bol = boolean
	                Frame:TweenPosition(UDim2.new(0.395, 0,1.3, 0),val,"Quint",Config.TweenSpeed.Sp2)
                if bol then Join_Discord_Server() end
	        task.wait(Config.TweenSpeed.Sp2)
        Frame.Visible = false
    end)
end

ScreenGui.Name = Config.Texts.Gui
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Config.Colors.GrayFrame
Frame.BackgroundTransparency = 0.500
Frame.Position = UDim2.new(0.395, 0,0.3, 0)
Frame.Size = UDim2.new(0, 350, 0, 377)

UICorner.Parent = Frame

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(57, 57, 59)
Frame_2.Position = UDim2.new(0, 0, -0.00400000019, 0)
Frame_2.Size = UDim2.new(0, 350, 0, 376)

ImageLabel.Parent = Frame_2
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.Position = UDim2.new(0.356296301, 0, 1.0518798381, 0)
ImageLabel.Size = UDim2.new(0, 100, 0, 100)
---@diagnostic disable-next-line: undefined-field
ImageLabel.Image = _G.HubLogo

UICorner_2.Parent = ImageLabel
UICorner_2.CornerRadius = UDim.new(0, 20)

InviteText.Name = "InviteText"
InviteText.Parent = Frame_2
InviteText.BackgroundTransparency = 1.000
InviteText.Position = UDim2.new(0.174285725, 0, 0.333333343, 0)
InviteText.Size = UDim2.new(0, 231, 0, 38)
InviteText.Font = Config.Font.Nunito
InviteText.Text = Config.Texts.Inv
InviteText.TextColor3 = Config.Colors.Gray
InviteText.TextSize = 20.000

HubName.Name = "HubName"
HubName.Parent = Frame_2
HubName.BackgroundTransparency = 1.000
HubName.Position = UDim2.new(0.208571434, 0, 0.407407433, 0)
HubName.Size = UDim2.new(0, 200, 0, 50)
HubName.Font = Config.Font.Unk
---@diagnostic disable-next-line: undefined-field
HubName.Text = _G.Hub
HubName.TextColor3 = Config.Colors.White
HubName.TextSize = 15.000

Join.Name = "Join"
Join.Parent = Frame_2
Join.BackgroundColor3 = Config.Colors.Blue
Join.Position = UDim2.new(0.165714279, 0, 0.716931224, 0)
Join.Size = UDim2.new(0, 232, 0, 45)
Join.Font = Config.Font.Unk
Join.Text = Config.Texts.Join
Join.TextColor3 = Config.Colors.White
Join.TextSize = 10.000
Join.MouseEnter:Connect(function()
	Join:TweenSize(UDim2.new(0, 240, 0, 50), "InOut", "Quint", Config.TweenSpeed.Sp1, true)
end)
Join.MouseLeave:Connect(function()
	Join:TweenSize(UDim2.new(0, 238, 0, 48), "InOut", "Quint", Config.TweenSpeed.Sp1, true)
end)
JoinOrNoButton(Join,"In",true)

UICorner_3.Parent = Join

No.Name = "No"
No.Parent = Frame_2
No.BackgroundTransparency = 1.000
No.Position = UDim2.new(0.214285702, 0, 0.835978866, 0)
No.Size = UDim2.new(0, 203, 0, 32)
No.Font = Config.Font.Nunito
No.Text = Config.Texts.No
No.TextColor3 = Config.Colors.Gray
No.TextSize = 14.000
JoinOrNoButton(No,"Out",false)

UICorner_4.Parent = No
UICorner_5.Parent = Frame_2

ImageLabel:TweenPosition(UDim2.new(0.356296301, 0, 0.0518798381, 0),"Out","Quint",Config.TweenSpeed.Sp3)
Frame:TweenPosition(UDim2.new(0.395, 0,0.3, 0),"Out","Quint",Config.TweenSpeed.Sp2)


