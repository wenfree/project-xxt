
--[[
local cloud_cc = require("cloud_cc")(
	"2BA695C9633E1E712764746FFD90649C",
	{
		"/lua/scripts/faker.lua",
		"/lua/scripts/xxtsp.lua",
		"/lua/scripts/nLog.xxt",
	}
)

]]


nLog = require('nLog')()
require('faker')
require('xxtsp')

local bid = "com.tencent.xin"
local XXTFaker = require("XXTFaker")()
if not XXTFaker.exists() then  XXTFaker.install() end
XXTFaker.filter_app({bid})
XXTFaker.set_config(                        --[[进行伪装iPad]]
    bid,
    {
        DeviceName = "iPad",
        ProductType = "iPad2,1"
    },
    false
)















