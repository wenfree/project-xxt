
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

function newPhone(bid)
	XXTFaker.filter_app({bid})
	XXTFaker.set_config(                        --[[进行伪装iPad]]
		bid,
		{
			DeviceName = "iPad",
			ProductType = "iPad2,1"
		},
		false
	)
end


apple = {
	
	['iPhone11']=	{"youshang329842@163.com","Dd112211",       },
	['iPhone16']=	{"changzongnan@163.com","Dd112211",         },
	['iPhone81']=	{"shenyongnan22@163.com","Dd112211",        },
	['iPhone82']=	{"tuhe2584831@163.com","Dd112211",          },
	['iPhone87']=	{"kantuogu551063428@163.com","Dd112211",    },
	['iPhone72']=	{"xianneiqian6152@163.com","Dd112211",      },
	['iPhone78']=	{"wenpuci236418644@163.com","Dd112211",     },
	['iPhone07']=	{"zairao99511835098@163.com","Dd112211",    },
	['iPhone07']=	{"zhulan48083118116@163.com","Dd112211",    },
	['iPhone07']=	{"huanhuan6404284@163.com","Dd112211",      },
	['iPhone82']=	{"qiubi91951963@163.com","Dd112211",        },
	['iPhone17']=	{"baoji77375329784@163.com","Dd112211",     },
	['iPhone07']=	{"fuba4595218540296@163.com","Dd112211",    },
}

--[[
appleid = apple[device.name()][1]
appleidpwd = apple[device.name()][2]

where = {
	{255, 484, 0xeaeaed},
	{ 87, 125, 0xffffff},
	{249, 621, 0xffffff},
}

for i,v in ipairs(where) do
	click(v[1],v[2],2)
	if i == 1 then
		input(appleid)
	end
	if i == 3 then
		input(appleidpwd)
	end
end
--]]

--app.open_url("prefs:root=STORE")
input('Whoami@520')
















