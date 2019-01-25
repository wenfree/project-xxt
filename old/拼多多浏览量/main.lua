nLog = require('nLog')()
require('faker')
require('xxtsp')





function GET_message(phone)
	local get ={}
	get.sid = kfy.id
	get.action = 'getMessage'
	get.phone = phone
	get.token = token
	local res = post(kfy.url,get)
	if res ~= nil then
		smslist = string.split(res,'|')
		if smslist[1] == '1' then
			sms = smslist[2]
			local i,j = string.find(sms,"%d+")
			sms = string.sub(sms,i,j)
			nLog(sms)
			return true
		else
			sys.toast(res)
		end
	end
end

function GET_message_a(phone)
	local get ={}
	get.sid = kfy.id
	get.action = 'getMessage'
	get.phone = phone
	get.token = token
	local res = post(kfy.url,get)
	if res ~= nil then
		smslist = string.split(res,'|')
		if smslist[1] == '1' then
			sms = smslist[2]
			local i,j = string.find(sms,"验证码：%d+")
			sms = string.sub(sms,i,j)
			local i,j = string.find(sms,"%d+")
			sms = string.sub(sms,i,j)
			nLog(sms)
			return true
		end
	end
end


function GET_Phone()
	local get ={}
	get.sid = kfy.id
	get.action = 'getPhone'
	get.token = token
--	get.vno = '0'
	--get.locationMatching='include&locationLevel=c&location=江苏'
	local res = post(kfy.url,get)
	if res ~= nil then
		phone_list = string.split(res,'|')
		if phone_list[1] == '1' then
			phone = phone_list[2]
			phoneheader = string.sub(phone,1,3)
			if phoneheader == '171' or phoneheader == '170' then
				return false
			end
			return phone
		else
			log(phone_list[2],true)
		end
	end
end

function GET_Phone_a(phone)
	local get ={}
	get.sid = kfy.id
	get.action = 'getPhone'
	get.token = token
	get.phone = phone
	get.vno = '0'
	--get.locationMatching='include&locationLevel=c&location=江苏'
	local res = post(kfy.url,get)
	if res ~= nil then
		phone_list = string.split(res,'|')
		if phone_list[1] == '1' then
			phone = phone_list[2]
			return phone
		end
	end
end

--高德 地址转换api------
function GET_local(lo,lt)
	local gaode = {}
	gaode.location = lo..','..lt
	gaode.key = 'aebbbe9fbc1ab12bdfb4bca79621f494'
	gaode.poitype = '%E5%B0%8F%E5%8C%BA'
	gaode.radius = 1000
	gaode.extensions = base
	gaode.batch = 'false'
	gaode.roadlevel = 0
	local gaodeurl = 'http://restapi.amap.com/v3/geocode/regeo'
	local res = json.decode(post(gaodeurl,gaode))
	if res.regeocode.formatted_address then
		return res.regeocode.formatted_address
	end
end

require("name")
--require("LuaDemo")


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
--			app.quit(appbids)
--			closeX(appbids)
		end
		sys.msleep(500)
	end)

bid={}
bid.app = 'com.baihe.online'

phonenamelist = {}

for i=1,40 do
	key = "iPhone"..i
	phonenamelist[key]="nj"..i
end

--[[]]
local appbids = app.front_bid()
if appbids ~= "com.apple.springboard" then
--	app.quit(appbids)
--	vpnx()
--	closeX(appbids)
end
--]]

--[[

local success = vpnconf.create{
    dispName = 'nj-'..device.name(),       -- VPN 的显示名
    VPNType = "L2TP",              -- VPN 的类型，支持 PPTP、L2TP、IPSec、IKEv2
    server = 'yhtip.com',    -- 服务器地址
    authorization = phonenamelist[device.name()],      -- 账号
    password = 'Aa112211',           -- 密码
    secret = '1',            -- 密钥，PPTP 可不填
    encrypLevel = 1,               -- 加密级别，选填，默认 1
    group = '',                    -- 群组名称，选填，默认 ""
    VPNSendAllTraffic = 1,         -- 是否发送所有流量，选填，默认 1
}
if success then
    sys.alert('创建成功')
else
    sys.alert('创建失败，确定人品没有问题？')
end
os.exit()
--]]


screen.init(0)
var = {}
var.lun = 0

--全局变量
function get_local()
    local done = false
	local outtime = os.time()
    thread.dispatch(function()
		outtime = os.time()
        while (os.time()-outtime < 30) do
            if (done) then
                sys.toast("", -1)
                return
            else
                sys.toast("正在获取 IP 地址...", device.front_orien())
            end
            sys.msleep(2000)
        end
    end)
    while (os.time() - outtime < 30) do
--		local c, h, b = http.get("http://ip.chinaz.com/getip.aspx?ts="..tostring(sys.rnd()), 30)
		local c, h, b = http.get("http://pv.sohu.com/cityjson?ie=utf-8", 30)
--        local c, h, b = http.get("https://www.ipip.net/",30)
        if (c==200) then
            sys.toast("", -1)
            done = true
--            return b:match('%d+%.%d+%.%d+%.%d+'),b:match('所在地理位置：<code>.*</code>')
            return b:match('%d+%.%d+%.%d+%.%d+'),b:match('cname.*}')
        end
    end
end

function up(name,other)
	local url = 'http://idfa888.com/Public/idfa/?service=idfa.idfa'
	local idfalist ={}
	idfalist.phonename = phonename or device.name()
	idfalist.phoneimei = phoneimei or sys.mgcopyanswer("SerialNumber")
	idfalist.phoneos = phoneos or sys.version()
	idfalist.name = name
	idfalist.idfa = idfa or phone
	idfalist.ip = '192.168.1.1'
	idfalist.ip = ip or '192.168.1.1'
	idfalist.account = account or locals or get_local() or '未知'
	idfalist.password = password
	idfalist.phone = phone
	idfalist.other = other
	return post(url,idfalist)
end

function checkip()
	local url = 'http://idfa888.com/Public/idfa/?service=idfa.checkip&ip='..ip
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

function rd(n,k)
	return math.random(n,k)
end

function appname(bid)
	return app.localized_name(bid) or '未安装'
end

phonekeyArr = {
	{104,  760, 0xffffff},
	{317,  768, 0xffffff},
	{526,  755, 0xffffff},
	{112,  866, 0xffffff},
	{330,  869, 0x696969},
	{522,  874, 0xffffff},
	{115,  977, 0xffffff},
	{322,  978, 0x000000},
	{544,  962, 0x000000},
	[0]={316, 1081, 0xffffff},
}

function phoneKey(phone)
	for i =1,string.len(phone) do
		local phone_mun = tonumber(string.sub(phone,i,i))
		click(phonekeyArr[phone_mun][1],phonekeyArr[phone_mun][2],0.3)
	end
end




local pddUrl = "https://mobile.yangkeduo.com/goods2.html?goods_id=3113234116&ts=1544253878496&page_from=23&refer_share_id=042b7130512344a29399d0842f613916&refer_share_uid=&refer_share_channel=message&from=singlemessage&isappinstalled=0"



function clickM(x,y,m)
	local m = m or 1
	for i=1,m do
		click(x,y,0.5)
	end
end

t={}

t['safari正在加载中']={ {{74,118,0x007aff},{74,116,0x007aff},}, 85, 21, 104, 626, 126}
t['App打开']={ {{546,174,0xff7500},{600,957,0xe02e24},{594,1024,0xe02e24},}, 85, 15, 17, 635, 1042}
t["在拼多多打开"]={ {{518,633,0x007aff},{495,622,0x007aff},{353,643,0x067dff},}, 85, 310, 583, 584, 673}
t["error"]={{{493,529,0xf6a622},{136,520,0xf6a622},}, 85, 41, 326, 614, 687}

t["pddisok"]={{{614,1086,0xe02e24},{255,1068,0xf3aba7},{39,79,0x7b7b7b},{588,90,0x7b7b7c},}, 85, 16, 36, 637, 1131}


function safari()
	local TimeLine = os.time()
	local OutTime = 60*3
	
	XXTfakerNewPhone(bid.safari)
	XXTfakerNewPhone(bid.pdd)
	idfa = XXTfakerGetinfo(bid.pdd)['IDFA']

	openUrl(pddUrl)
	delay(3)
	while true do
		if active(bid.safari,5)then
			if d(t["在拼多多打开"],"在拼多多打开",true,1)then
				delay(5)
				return true
			elseif d(t['safari正在加载中'],"safari正在加载中")then
			elseif d(t['error'],"error")then
				return false
			elseif d(t['App打开'],'App打开',true,1)then
				delay(2)
			end
		end
		delay(1)
	end
end

function pdd()
	local TimeLine = os.time()
	local OutTime = 60*3
	
	while true do
		if active(bid.pdd,5)then
			if d(t["pddisok"],"pddisOK")then
				delay(rd(10,15))
				return true
			end
		end
		delay(1)
	end
end



--XXTfakerNewPhone(bid.app)
--idfa = XXTfakerGetinfo(bid.app)['IDFA']

--nLog(app.front_bid())
bid={}
bid.pdd = 'com.xunmeng.pinduoduo'
bid.safari = 'com.apple.mobilesafari'


while 1 do
	if vpn() then
		if safari()then
			if pdd() then
				up('拼多多浏览','成功')
			end
		end
		vpnx()
		delay(2)
	end
end












































































