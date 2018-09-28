
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

if not(xxtinstall())then
	log("伪装失效")
	os.exit()
else
	XXTFaker = require("XXTFaker")()
end

function atexit(callback) -- 参数为一个函数，使用 atexit(一个函数) 注册一个函数在脚本结束时执行，建议不要耗时太长
	____atexit_guard____ = ____atexit_guard____ or {}
	if type(____atexit_guard____) == 'table' then
		if not getmetatable(____atexit_guard____) then
			setmetatable(____atexit_guard____, {
					__gc = function(self)
						if type(self.callback) == 'function' then
							pcall(self.callback)
						end
					end
				})
		end
		____atexit_guard____.callback = callback
	else
		error('别用 `____atexit_guard____` 命名你的变量。')
	end
end

atexit(function() 
		sys.toast('脚本结束了！')
		vpnx()
		local appbids = app.front_bid()
		if appbids ~= "com.apple.springboard" then
			app.quit(appbids)
			--closeX(appbids)
		end
		sys.msleep(500)
	end)

local curl = require('lcurl')
local e = curl.easy()

bid={}


bid.NOW直播 = {	["appid"] =  "1097492828", ["appbid"] = "com.tencent.now", ["id"]= 253, ["keyword"]="口碑" }

screen.init(0)
var = {}
var.appid = '29534dea6fa92c'
var.chSource = 'jiamusi'
--全局变量
--[[
NOW排重接口：
http://open.6to.com.cn:8181/check_idfa.php?channel=frog&appid=1097492828&idfa={idfa}
--]]

function up(name,other)
	local url = 'http://hlj.51-gx.com/Public/idfa/?service=idfa.idfa'
	local idfalist ={}
	idfalist.phonename = phonename or device.name()
	idfalist.phoneimei = phoneimei or sys.mgcopyanswer("SerialNumber")
	idfalist.phoneos = phoneos or sys.version()
	idfalist.name = name
	idfalist.idfa = idfa
	idfalist.ip = '192.168.1.1'
	idfalist.ip = get_ip() or '192.168.1.1'
	idfalist.account = account
	idfalist.password = password
	idfalist.phone = phone
	idfalist.other = other
	return post(url,idfalist)
end

function activation(name)
	log("activation")
	local url = "http://api.qingsongzhuan666.com/qszReportIdfa"
	local postarr={}
	postarr.appId = var.appid
	postarr.chSource = var.chSource
	postarr.idfa  = idfa
	postarr.clientIp = ip or get_ip() or "192.168.1.1"
--	postarr.model = model
	postarr.osVersion = sys.version()
	postarr.keyword = e:escape(keyword)
	
	log(postarr)
	
	local getdata = post(url,postarr)
	if getdata ~= nil then
		local data = json.decode(getdata)
		log(data or "nil")
		if data["Remark"] == "Success" then
			return true
		end
	end
end

--[[
NOW点击接口：
http://open.6to.com.cn:8282/capClickApi.php?adid=88&promoter=frog&ip={ip}{ip}&callback={callback}&idfa={idfa}&rtjson=1
--]]

function idfaclick(idfa,callbackUrl)
	log("click")
	
	local postarr={}
	postarr.appId = var.appid
	postarr.chSource = var.chSource
	postarr.idfa  = idfa
	postarr.clientIp = ip or get_ip() or "192.168.1.1"
	local url = "http://open.6to.com.cn:8282/capClickApi.php?adid=88&promoter=frog&ip="..postarr.clientIp.."&callback="..callbackUrl.."&idfa="..idfa.."&rtjson=1"
	
	local getdata = get(url)
	if getdata ~= nil then
		local data = json.decode(getdata)
		log(data or "nil")
		if data["success"] then
			return true
		end
	end
end

function checkidfa(idfa)
	log("checkidfa")
	local url = "http://open.6to.com.cn:8181/check_idfa.php?channel=frog&appid=1097492828&idfa="..idfa
	
	local getdata = get(url)
	if getdata ~= nil then
		local data = json.decode(getdata)
		log(data or "nil")
		if data[idfa] == '0' then
			log('排重成功',true)
			return true
		else
			log('排重失败')
		end
	end
end






function checkip()

	ip = get_ip() or "192.168.1.1"
	local url = 'http://hlj.51-gx.com/Public/idfa/?service=idfa.checkip&ip='..ip
	local getdata = get(url)
	if getdata ~= nil then
		local data = json.decode(getdata)
		log(data or "nil")
		if data.data.state == "ok" then
			log("ip可以用:OK.",true)
			return true
		else
			log("ip, 排重失败",true)
		end
	end
end

--[[
function idfaisok(name)
	if XXTfakerNewPhone(bid[name]["appbid"])then
		idfa = XXTfakerGetinfo(bid[name]["appbid"])['IDFA']
		model = XXTfakerGetinfo(bid[name]["appbid"])['ProductType']
		if checkidfa(idfa,bid[name]["id"],bid[name]["keyword"])then
			return idfaclick(idfa,bid[name]["id"],bid[name]["keyword"])
		end
	end
end
--]]

function idfaisok(name)
	if XXTfakerNewPhone(bid[name]["appbid"])then
		idfa = XXTfakerGetinfo(bid[name]["appbid"])['IDFA']
		model = XXTfakerGetinfo(bid[name]["appbid"])['ProductType']
		return checkidfa(idfa)
	end
end

function callback_(name)
	if XXTfakerNewPhone(bid[name]["appbid"])then
		idfa = XXTfakerGetinfo(bid[name]["appbid"])['IDFA']
		model = XXTfakerGetinfo(bid[name]["appbid"])['ProductType']
		local id_ = json.decode(up(name,"点击上报"))['data']['id']
		local callbackurl_ = 'http://hlj.51-gx.com/Public/idfa/?service=idfa.callback&id='..id_
		if checkidfa(idfa) then
			return idfaclick(idfa,callbackurl_)
		end
	end
end


function rd(n,k)
	return math.random(n,k)
end

function appname(bid)
	return app.localized_name(bid) or '未安装'
end


apparr={}
apparr.right={{{462,666,0x007aff},{225,666,0x007aff},}, 85, 54, 394, 590, 809}

function newidfa(name,times)
	for i= 1,times do

		local TIMEline = os.time()
		local OUTtime = rd(30,40)
		while os.time()- TIMEline < OUTtime do
			log("激活app中")
			if active(bid[name]["appbid"],4)then
				if d(apparr.right,"apparr.right",true)then
				else
					moveTo(600,300,100,100,30,50)
					delay(1)
					click(321, 978)
					delay(1)
					click(462, 666)
					delay(1)
				end
			else
				log("启动一次")
			end
		end
		up(name,'点击成功')
	end
end

--期货掌中宝
function beewallidfa(name)
	if idfaisok(name)then
		newidfa(name,1)
		return true
	end
	delay(1)
end
--期货掌中宝
function callbackidfa(name)
	if callback_(name)then
		newidfa(name,1)
		return true
	end
	delay(1)
end


--[[]]

while true do
	if vpn() then
		if checkip()then
			callbackidfa("NOW直播")
		end
	end
	vpnx()
end
--]]































