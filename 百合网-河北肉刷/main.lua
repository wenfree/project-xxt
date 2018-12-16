nLog = require('nLog')()
require('faker')
require('xxtsp')
kfy={}
kfy.id = '10952'
kfy.action = 'loginIn'
kfy.name = 's-gozqerp3'
kfy.password = 'a135246'
kfy.url = 'http://api.ndd001.com/do.php'
token = 'f8629ece-0246-4eda-935a-224fb45746a1'


function addBlacklist(phone)
	local get ={}
	get.sid = kfy.id
	get.action = 'addBlacklist'
	get.token = token
	get.phone = phone
	--get.locationMatching='include&locationLevel=c&location=江苏'
	local res = post(kfy.url,get)
	if res ~= nil then
		phone_list = string.split(res,'|')
		if phone_list[1] == '1' then
			return true
		end
	end
end

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
			app.quit(appbids)
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
	app.quit(appbids)
	vpnx()
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


kfy.id = '10482'
--全局变量

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




imgUrl = "http://image.baidu.com/channel/listjson?pn=15000&rn=1&tag1=%E7%BE%8E%E5%A5%B3&tag2=%E5%85%A8%E9%83%A8&ftags=%E5%A4%B4%E5%83%8F&ie=utf8"


page={}

page.主菜单={{{578,1096,0x929292},{300,1079,0x9d9d9d},{179,1078,0x929292},{49,1086,0xff425a},}, 85, 22, 1050, 623, 1132}
page.主菜单_我的_资料={{{567,192,0xaaaaaa},{590,83,0x979797},{578,1096,0xff2983},{300,1080,0x9d9d9d},{43,1074,0x929292},}, 85, 0, 0, 0, 0}
page.编辑_编辑_我喜欢谁={{{544,825,0xff5e00},{544,605,0xff5e00},{530,330,0xff5e00},{597,70,0xffffff},{527,356,0xff5e00},}, 85, 445, 45, 629, 875}
page.编辑_编辑_我喜欢谁ios10={{{549,792,0xff5e00},{549,808,0xff5e00},{549,765,0xff5e00},{549,784,0xfff5ef},{530,284,0xff5e00},
					{531,319,0xff5e00},}, 85, 468, 222, 620, 840}
page.编辑资料界面={{{388,80,0x525252},{367,87,0x525252},{300,73,0x525252},{52,83,0xfc6e27},}, 85, 9, 53, 521, 115}
page.infolist={
	{607, 354, 0xd1d1d5},
	{608, 446, 0xcbcbd0},
	{608, 538, 0xcbcbd0},
	{608, 722, 0xcbcbd0},
	{607, 814, 0xd1d1d5},
	{607, 906, 0xd1d1d5},
}
page.滑动确定={{{601,662,0xfd6e27},{603,648,0xfd6e27},}, 85, 588, 493, 622, 877}
page.编辑资料_保存={{{599,89,0xfd6e27},{550,80,0xfd6e27},{367,79,0x525252},{52,83,0xfc6e27},}, 85, 23, 47, 626, 120}
page.编辑_更多资料界面={{{596,72,0xfc6127},{568,85,0xfc6127},{594,98,0xfc6127},{52,84,0xfc6e27},
					{38,82,0xffffff},}, 85, 18, 45, 636, 122}
page.编辑_基本资料={{{547,1074,0xff5e00},{547,1062,0xff5e00},{58,1078,0x333333},{58,1081,0xffffff},
					{58,1083,0x333333},{32,1082,0x333333},{59,1069,0x333333},{59,1096,0x333333},}, 85, 0, 0, 0, 0}



function clickM(x,y,m)
	local m = m or 1
	for i=1,m do
		click(x,y,0.5)
	end
end


function makeinfo()
	local TimeLine = os.time()
	local OutTime = 60*3
	local sexhight = false
	local makeinfo_ = false

	
	
	while os.time()-TimeLine < OutTime do
		if active(bid.app,5)then
			if d(page.主菜单,"page.主菜单",true)then
			elseif d(page.主菜单_我的_资料,"page.主菜单_我的_资料",true)then
			elseif makeinfo_ and (d(page.编辑_编辑_我喜欢谁,"page.编辑_编辑_我喜欢谁",false)or d(page.编辑_编辑_我喜欢谁ios10,"page.编辑_编辑_我喜欢谁ios10",false))then
				up("婚恋网",sexk.."修改资料")
				sys.alert("注册完成,即将退出",3)
				closeX(appbids)
				return true
			elseif d(page.编辑_编辑_我喜欢谁,"page.编辑_编辑_我喜欢谁",false) or d(page.编辑_编辑_我喜欢谁ios10,"page.编辑_编辑_我喜欢谁ios10",false) then
					if sexhight then
						moveTo(300,700,300,400,5,20)
						moveTo(300,700,300,400,5,20)
					else
						if d(page.编辑_编辑_我喜欢谁,"page.编辑_编辑_我喜欢谁",true)then
						elseif d(page.编辑_编辑_我喜欢谁ios10,"page.编辑_编辑_我喜欢谁ios10",true)then
						end
					end
			elseif d(page.编辑资料界面,"page.编辑资料界面",false)then
					for i,v in ipairs(page.infolist)do
						click(v[1],v[2])
						if i == 1 then
							clickM(168, 809,rd(6,9))
						elseif i == 2 then
							clickM(171, 1035,rd(1,2))					
						elseif i == 3 then
							clickM(171, 1035,rd(1,2))
							clickM(468, 1037,rd(1,3))
						elseif i == 4 then
							local choice = {
								{585,  831, 0xffeade},
								{585,  916, 0xffffff},
								{585, 1003, 0xffffff},
							}
							click(choice[1][1],choice[rd(1,#choice)][2])
						elseif i == 5 then
							local choice = {
								{583,  628, 0xff5e00},
								{584,  717, 0xffffff},
								{590,  811, 0xffffff},
								{589,  892, 0xffffff},
								{585,  979, 0xffffff},
								{590, 1068, 0xffffff},
							}						
							click(choice[1][1],choice[rd(1,#choice)][2])
						elseif i == 6 then
							local choice = {
								{583,  742, 0xff5e00},
								{588,  828, 0xffffff},
								{588,  919, 0xffffff},
								{586, 1001, 0xffffff},
								{587, 1093, 0xffffff},
							}
							click(choice[1][1],choice[rd(1,#choice)][2])
						end
						d(page.滑动确定,"page.滑动确定",true)
					end
					if d(page.编辑资料_保存,"page.编辑资料_保存",true)then
						delay(5)
						makeinfo_ = true
					end

			elseif d(page.编辑_更多资料界面,"page.编辑_更多资料界面") then
				if d(page.编辑_基本资料,"page.编辑_基本资料",true)then
				else
					moveTo(300,700,300,400,5,20)
				end
			else
				if d(page.本地相册,"page.本地相册",true,3)then
					
				end
			end
		end
		delay(0.5)
	end
end






page.基本资料界面={{{380,76,0x000000},{370,72,0xffffff},{368,72,0x000000},{42,83,0x888888},},85}
	page.基本资料界面_请输入={{{444,285,0xc7c7cd},{457,285,0xc7c7cd},{495,285,0xff8432},{501,285,0xffffff},}, 85, 367, 255, 519, 319}
	page.基本资料界面_性别女={ {{541,361,0xe2e2e2},{540,351,0xfbfbfb},{537,343,0xe2e2e2},{536,382,0xe2e2e2},}, 85, 496, 322, 581, 407}
		page.基本资料界面_性别女_选框={{{586,664,0xffffff},{585,644,0xebebeb},{564,665,0xe6e6e6},{607,665,0xe6e6e6},}, 85, 554, 634, 622, 969}
	page.基本资料界面_完成={{{306,1042,0xffffff},{309,1022,0xff645a},{86,1041,0xff7948},{530,1043,0xff4e6b},}, 85, 17, 968, 621, 1125}
page.昵称={{{46,77,0xfd6e27},{306,77,0x525252},{308,72,0xffffff},},85}
	page.昵称完成={{{569,85,0xfd884d},{551,73,0xfd6e27},{545,67,0xffffff},}, 85, 526, 61, 614, 109}
page.我知道了={{{383,840,0xff5962},{369,317,0xffa251},{356,775,0x008eff},},85}
page.本地相册={{{367,860,0xfd6e27},{396,767,0xfd6e27},{569,154,0xffffff},},85}			--3x
page.照片={{{328,78,0x000000},{331,81,0xf9f9f9},{552,80,0x007aff},},85}
page.照片ios10={{{214,210,0x000000},{105,543,0x8e8e93},{309,70,0x000000},{563,77,0x208bff},}, 85,  11, 12, 630, 571}
page.照片_详情={{{21,83,0x007aff},{309,79,0xf9f9f9},{313,79,0x3a3a3a},{552,86,0x007aff},},85}
page.照片_详情ios10={{{23,83,0x007aff},{60,184,0x000000},{313,86,0x3a3a3a},{567,82,0x1e8aff},}, 85, 5, 7, 630, 460}
page.照片_注册成功={{{569,1097,0x43fe85},{62,1086,0xe83c2d},},85}
page.照片_地址未显示={{{596,404,0xc7c7cc},{568,407,0xd9d9d9},{523,404,0xffffff},{530,404,0xd9d9d9},}, 85, 450, 341, 625, 465}
page.照片_地址_确定={{{602,661,0xfd6e27},{581,667,0xfd6e27},}, 85, 535, 626, 628, 697}

page.完善信息_完成注册={{{314,1033,0xffffff},{319,1033,0xff635b},{319,1009,0xff635c},{319,1067,0xff625b},}, 85, 224, 986, 411, 1094}
page.上传头像={{{441,756,0xfd6e27},{356,860,0xfd6e27},{335,345,0xff8000},{568,154,0xffffff},},85}

page.弹出选择确定={{{571,663,0xff5e00},{564,659,0xff5e00},}, 85, 507, 561, 637, 725}

function sjclick(min,max,x,y)
	local sjkey = rd(min,max)
	if sjkey == 0 then
		return true
	end
	for i=1,sjkey do
		click(x,y,0.5)
	end
end

function fix()
	local TimeLine = os.time()
	local OutTime = 60*3
	sex = rd(1,100)
	sex_key = 60
	local manfix_key = true
	local makeinfo__ = true
	--设置这个sex_key的值越大 女的就越少
	if sex > sex_key then
		sexk = "女"
		manfix_key = false
	else
		sexk = "男"
	end
	local other____ = 0
	local makebrithday = true
	
	log("sex-> ".. sex)

	while os.time()-TimeLine < OutTime do
		if active(bid.app,5)then
			if d(page.完善信息,"page.完善信息") then
				if makebrithday then
					click(544, 255,3)
					sjclick(0,5,158 , 857+ rd(0,1)*130)
					sjclick(0,5,314 , 857+ rd(0,1)*130)
					sjclick(0,5,459 , 857+ rd(0,1)*130)
					d(page.弹出选择确定,'page.弹出选择确定',true)
					makebrithday = false
					
				elseif sex > sex_key and d(page.基本资料界面_性别女,"page.基本资料界面_性别女",true)then
				elseif makeinfo__ then
					rd_click(2,6,208,554)
					rd_click(0,1,210+ rd(0,4)*95 ,644)
					rd_click(0,1,207+ rd(0,4)*95,739)
					makeinfo__ = false
				elseif d(page.完善信息_完成注册,"完善信息_完成注册",true)  then
					up("婚恋网",'完成注册->'..sexk)
					delay(3)
				else
					if d(page.我知道了,"page.我知道了",true) then
					elseif d(page.弹出选择确定,'page.弹出选择确定',true) then
					else
						other____ = other____ + 1
						if other____ > 20 then
							click(592, 459)
							sjclick(0,5,165 , 989+ rd(0,1)*55)
							click(576, 666)
							other____ = 0
						end
					end
				end
				
			elseif d(page.上传头像,"page.上传头像",true,4)then
				up("婚恋网",'填过资料->'..sexk)
				delay(3)
				return true
			else
				if d(page.tip_bad,"page.tip_bad",true)then
					return false
				elseif d(page.allow,"page.allow",true)then
				elseif d(page.allow_local,"page.allow_local",true)then
				end
			end
		end
		delay(0.5)
	end
end

function rd_click(min,max,x,y)
	local key = rd(min,max)
	if key == 0 then
		return false
	else
		for i=1,key do
			click(x,y,0.5)
		end
	end
end



page.allow={{{477,665,0x007aff},{187,668,0x007aff},}, 85, 71, 440, 580, 702}
page.allow_local={{{360,594,0x007aff},{347,684,0x007aff},{359,777,0x007aff},}, 85, 324, 565, 373, 797}

page.tip_bad={{{154,635,0x007aff},{164,662,0x007aff},{502,646,0x007aff},}, 85, 111, 613, 533, 681}

page.regUI={ {{209,159,0xff635b},{209,149,0xff625c},{132,159,0xff7e45},{282,159,0xff4971},}, 85, 81, 0, 315, 277}
	page.regUI_up={{{209,35,0xff625c},{283,39,0xff4971},},85}
	page.regUI_login={{{128,231,0xc7c7cd},{131,243,0xd4d4d9},{113,219,0xc7c7cd},}, 85, 61, 194, 291, 292}
	page.regUI_send={ {{498,344,0xff5d5f},{413,338,0xff7b46},{558,344,0xff4871},{484,321,0xff635b},}, 85, 391, 197, 577, 387}
	page.regUI_pwd={ {{323,459,0xd5d5da},{323,449,0xc7c7cd},{318,436,0xc7c7cd},}, 85, 69, 403, 389, 488}
	page.regUI_reg={ {{255,736,0xff6a55},{318,703,0xff635b},{338,766,0xff615d},}, 85, 178, 698, 497, 774}
page.完善信息={{{377,73,0xd0d0d0},{377,74,0xffffff},{377,77,0x161616},{362,92,0xffffff},{364,92,0x000000},{42,84,0x888888},},85}


function reg()
	local TimeLine = os.time()
	local OutTime = 60*3

	local 取号 = true
	local 验证码 = false
	local 短信 = false
	local 提交 = false
	local 后退 = false
--	local 密码 = true
	local 提交过了 = false

	local 取短信次数 = 0
	
	password = myRand(4,rd(8,12))

	while os.time()-TimeLine < OutTime do
		if active(bid.app,10)then
			if d(page.完善信息,"page.完善信息") then
				return true
			elseif d(page.regUI_up,"page.regUI_up")then
				click(26, 282)
			elseif d(page.regUI,"page.regUI") then
				delay(2)
				if 取号 then
					if d(page.regUI_login,"page.regUI_login",true)then
						delay(1)
						if GET_Phone()then
							log(phone,true)
							delay(2.8)
							if type(tonumber(phone)) == "number" then
								phoneKey(phone)
								click(26, 282)
								取号 = false
								验证码 = true
							else
								click(26, 282)
							end
						else
							click(26, 282)
						end
					end
				elseif 验证码 then
					if d(page.regUI_send,"page.regUI_send",true)then
						验证码 = false
						短信 = true
					end
				elseif 短信 then
					if d(page.regUI_pwd,"regUI_pwd",true)then
						input(password)
						click(292,434)
						input(random_name()..myRand(4,rd(2,6)))
						click(26, 282)			--点击空白
						
					elseif GET_message(phone)then
						click(127, 340)
						input(sms)
						click(604, 610)				--点击空白
						短信 = false
						提交 = true
					else
						d(page.regUI_send,"page.regUI_send",true)
						
						取短信次数 = 取短信次数 + 1
						if 取短信次数 > 25 then
							return false
						end
						delay(2.5)
					end
				elseif 提交 then
					if d(page.regUI_reg,"page.regUI_reg",true)then
						up("婚恋网","提交注册")
						delay(3)
					end
				end
			else
				
				if d(page.tip_bad,"page.tip_bad",true)then
					log('注册过的')
					addBlacklist(phone)
					return false
				elseif d(page.allow,"page.allow",true)then
				elseif d(page.allow_local,"page.allow_local",true)then
				end
			end
		end
		delay(0.5)
	end
end


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


--fix()
--os.exit()
--[[]]

while true do
	if false or vpn() then
		ip,locals = get_local()
		
		if ip ~= "192.168.1.1" and ip~= nil then
			if false or checkip()then
				if false or XXTfakerNewPhone(bid.app)then
					idfa = XXTfakerGetinfo(bid.app)['IDFA']
					delay(1)
					if reg()then
						if fix()then
						--	makeinfo()
						end
					end
				end
	
			end
		end
	end
	app.quit(bid.app)
	vpnx()
	delay(2)
end



--]]



--clear.all_photos()














































































