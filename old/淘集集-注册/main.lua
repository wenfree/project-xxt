nLog = require('nLog')()
require('faker')
require('xxtsp')
require('alz')
require('name')
--xui.show("xui-sub")


left = 40.0102612206
righ = 116.2188720703


left2 = 39.8066898614
right2 = 116.6226196289

function newlocation()
	newleft = math.random(math.ceil(righ*10000),math.ceil(right2*10000))
	log("newleft" .. newleft)
	newleft = newleft /10000
	newright = math.random(math.ceil(left2*10000),math.ceil(left*10000))
	log("newright" .. newright)
	newright = newright /10000
	return newleft..","..newright
end


function getlocal()
	local gdurl = 'https://restapi.amap.com/v3/geocode/regeo?parameters'
	local gd={}
	gd.key='aebbbe9fbc1ab12bdfb4bca79621f494'
	gd.location= newlocation() or "115.481488,39.990464"
	gd.poitype = '小区'
	gd.radius = 1000
	gd.extensions = "base"
	gd.batch = "false"
	gd.roadlevel=0
	
	local gdlocal = post(gdurl,gd)
	if gdlocal ~= nil then
		return json.decode(gdlocal)
	end
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

if not(xxtinstall())then
	log("伪装失效")
	os.exit()
else
	XXTFaker = require("XXTFaker")()
end

bid={}
bid.支付宝 = "com.alipay.iphoneclient"
bid.淘集集 = "com.huanshou.taojiji"
			





screen.init(0)
var = {}
var.lun = 0
var.phonename = device.name()
var.phoneimei = sys.mgcopyanswer("SerialNumber")
var.tag = 'A10-20'
var.phone = phone
var.pwd = "520000"
var.bank = nil
var.bankphone = nil
var.address = nil
var.money = nil
var.pay = nil
var.sheng = 0
var.diqu = 0



--全局变量


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

function up_wenfree()
	local url = 'http://wenfree.cn/api/Public/user/?service=Tjj.paystate'
	local idfalist ={}
	idfalist.phonename = var.phonename or device.name()
	idfalist.imei = var.phoneimei or sys.mgcopyanswer("SerialNumber")
	idfalist.name = name
	idfalist.idfa = idfa or phone
	idfalist.ip = ip or get_ip() or  '192.168.1.1'
	idfalist.account = var.account or phone
	idfalist.pwd = var.pwd
--	idfalist.tag = tagtb[var.phonename]
	idfalist.phone = phone
	idfalist.bank = var.sheng.."-"..var.diqu
	idfalist.bankphone = var.phone
	idfalist.address = var.address
	idfalist.money = var.money
	idfalist.pay = var.pay
	idfalist.whos = "ym"
	log(idfalist)
	return post(url,idfalist)
end

function up(name,other)
	local url = 'http://idfa888.com/Public/idfa/?service=idfa.idfa'
	local idfalist ={}
	idfalist.phonename = phonename or device.name()
	idfalist.phoneimei = phoneimei or sys.mgcopyanswer("SerialNumber")
	idfalist.phoneos = phoneos or sys.version()
	idfalist.name = name
	idfalist.idfa = idfa or phone
	idfalist.ip = ip or get_ip() or '192.168.1.1'
	idfalist.account = account 
	idfalist.password = password
	idfalist.phone = phone
	idfalist.other = other
	return post(url,idfalist)
end

function rd(n,k)
	return math.random(n,k)
end

function appname(bid)
	return app.localized_name(bid) or '未安装'
end

function lastlocal()
	地址 = getlocal()
	last = string.split(地址.regeocode.formatted_address,"区")
	log(last[#last]..math.random(1,5).."号街"..math.random(1,10).."号楼")
	return last[#last]..math.random(1,5).."号街"..math.random(1,10).."号楼"
end

--openUrl("https://m.weibo.cn/status/4258678762614093?wm=3333_2001&from=1087093010&sourcetype=weixin&featurecode=newtitle")
--os.exit()


web={}
web.open={{{526,632,0x007aff},{396,622,0x3897ff},{393,623,0xffffff},},85}
web['ios10链接打开成功']={{{ 63, 176, 0xff6632},{187, 185, 0xff6632},{ 49, 233, 0xfff8ff},{207, 339, 0xff6632},}, 85, 17, 88, 403, 599}

function open(urls)
	if XXTfakerNewPhone('com.apple.mobilesafari') then
		delay(1)
		openUrl(urls)
	end	
	delay(3)
	local timeline = os.time()
	local outtimes = 60
	while os.time()-timeline < outtimes do
		if d(web.open,"web.open",true,1) or d(web['ios10链接打开成功'],"web['ios10链接打开成功']",false) then
			delay(math.random(10,15))
			return true
		end
		delay(1)
	end
	log("open time ",true)
end

--open(bid['淘集集注册']['url'][device.name()])
--XXTfakerNewPhone(bid.淘集集注册.appbid)
--os.exit()
apptjj = {}
apptjj.存入账户 = {{{284, 902, 0xf8411c},{ 68, 872, 0xfe6230},{ 69, 931, 0xff6232},{582, 934, 0xed1500},{588, 944, 0xffffff},}, 85, 45, 851, 602, 958}
apptjj.提现红包 = {{{489, 799, 0xfecd99},{363, 797, 0xa05900},{436, 878, 0xec3433},{548, 882, 0xf6acad},{546, 428, 0xfff9ed},}, 85, 55, 783, 594, 986}
apptjj.选择其他登录方式 = {{{283, 434, 0x59b7f3},{419, 435, 0x179aee},{152, 280, 0x4ad70e},{494, 327, 0x3dc003},}, 85, 122, 250, 544, 492}
apptjj.选择手机号登录 = {{{ 76,  934, 0x404040},{102, 1027, 0xe0e0e0},{601,  838, 0x818181},{601,  837, 0xdedede},{224,  838, 0xe3e3e3},}, 85, 9, 813, 639, 1082}
apptjj.手机号登录界面 ={{
	{ 44, 84, 0x333333},
	{365, 83, 0xfbfbfb},
	{365, 81, 0x191919},
	{369, 74, 0xfcfcfc},
	{369, 76, 0x191919},
}, 85}
apptjj.点击获取验证码 = {{{504, 327, 0xff845a},{532, 339, 0xff9773},{576, 358, 0xffa88a},{605, 366, 0xff6733},}, 85, 494, 306, 622, 398}
apptjj.点击登陆 = {{{291, 581, 0xf7401b},{ 36, 558, 0xffb49c},{592, 627, 0xee1601},{605, 632, 0xffffff},}, 85, 28, 549, 618, 642}
apptjj.正在获取验证码 = {{{504, 327, 0xadadad},{605, 328, 0xd0d0d0},{603, 371, 0xadadad},}, 85, 497, 318, 618, 381}
apptjj['ios10选择手机号登录'] = {{{ 28, 935, 0x515151},{ 30, 954, 0x757575},{613, 942, 0xbebebe},}, 85, 23, 912, 629, 985}
apptjj.请输入手机号 = {{{101, 239, 0xa6a6a6},{ 37, 231, 0xededed},{ 39, 254, 0xd1d1d1},{191, 255, 0xdbdbdb},{194, 231, 0xe9e9e9},}, 85, 30, 220, 212, 266}
apptjj.请输入验证码 = {{{138, 354, 0x999999},{ 37, 341, 0xededed},{ 39, 364, 0xd1d1d1},{251, 342, 0x999999},{250, 365, 0xe4e4e4},}, 85, 27, 322, 277, 368}

apptjj.我的界面 = {{{538, 1084, 0xd8d8d8},{531, 1057, 0xd8d8d8},{323, 1062, 0xd8d8d8},{100, 1073, 0xff6431},}, 85, 70, 1042, 591, 1133}
apptjj.我的界面_资产十元 = {{{ 39, 238, 0xff8f46},{601, 348, 0xf73716},{ 76, 261, 0xffc9a8},{124, 317, 0xffebe0},}, 85, 26, 229, 619, 363}

apptjj.app主界面={{{ 54, 1079, 0xff6832},{ 49, 1122, 0xff6632},{189, 1072, 0xffffff},{202, 1121, 0x999999},}, 85, 33, 1056, 224, 1130}
apptjj.要后退={{{ 47, 83, 0x333333},{121, 84, 0xffffff},{125, 84, 0x373737},{153, 85, 0x373737},}, 85, 19, 46, 182, 119}

function Tjj_reg(url)
	取号 = true
	验证码 = false
	取短信 = false
	提交 = false
	success = false
	timeline = os.time()
	outtime = rd(10,20)
	取短信次数 = 0
	
	if XXTfakerNewPhone(bid.淘集集) then
		idfa = XXTfakerGetinfo(bid.淘集集)['IDFA']
		while os.time() - timeline < outtime do
			if active(bid.淘集集,5) then
				if success and d(apptjj.app主界面,"apptjj.app主界面") then
					up("淘集集注册",url..'->注册完成')
					return true
--				elseif d(apptjj.app主界面,"apptjj.app主界面") then	
--					click(185,1086)
				elseif d(apptjj.存入账户,"apptjj.存入账户",true) then	
				elseif d(apptjj.提现红包,"apptjj.提现红包",true) then	
				elseif d(apptjj.选择其他登录方式,"apptjj.选择其他登录方式",true) then	
				elseif d(apptjj.选择手机号登录,"apptjj.选择手机号登录",true) or d(apptjj['ios10选择手机号登录'],"apptjj['ios10选择手机号登录']",true) then	
				elseif d(apptjj.手机号登录界面,"apptjj.手机号登录界面") then
					if 取号 then
						if GET_Phone() then
							click(122,248)
							delay(2)
							input(phone)
							取号 = false
							验证码 = true
						end
					elseif 验证码 then
						if d(apptjj.点击获取验证码,"apptjj.点击获取验证码",true) then
							验证码 = false
							取短信 = true
						end
					elseif 取短信 then
						if GET_message(phone) then
							delay(1)
							click(157,359)
							input(sms)
							取短信 = false
							提交 = true
						elseif d(apptjj.点击获取验证码,"apptjj.点击获取验证码",true) then
						else
							取短信次数 = 取短信次数 + 1
							if 取短信次数 > 25 then
								return false
							end
							delay(2)
						end
					elseif 提交 then
						if d(apptjj.点击登陆,"apptjj.点击登陆",true) then
							up('淘集集注册',url..'->点击登陆')
							success = true
							delay(1)
						end	
					end
				elseif success and d(apptjj.要后退,"apptjj.要后退",true) then
				end
			end
			delay(1)
		end
	end
end


apptjj.right={{{462,666,0x007aff},{225,666,0x007aff},}, 85, 54, 394, 590, 809}
apptjj.弹窗 = {{{575,  88, 0xffffff},{319, 227, 0xffa6a6},{534, 918, 0xf01c05},{538, 950, 0xffffff},}, 85, 86, 47, 621, 969}

function Tjj_active(url)
	取号 = true
	验证码 = false
	取短信 = false
	提交 = false
	success = false
	timeline = os.time()
	outtime = rd(35,40)
	if XXTfakerNewPhone(bid.淘集集) then
		idfa = XXTfakerGetinfo(bid.淘集集)['IDFA']
		while os.time() - timeline < outtime do
			if active(bid.淘集集,5) then
				if d(apptjj.right,"apptjj.right",true)then
				elseif d(apptjj.弹窗,"apptjj.弹窗",true) then
				else
				moveTo(600,300,100,100,30,50)
				delay(1)
				click(321, 978)
				delay(1)
				click(462, 666)
				delay(1)
				end	
			end
			delay(2)
		end
		
		up('淘集集激活',url)
		delay(4)
		return true
	end
end


vpnx()
delay(3)
kfy.id = '14294'

function get_task()
	local url = 'http://wenfree.cn/api/Public/tjj/?service=Tjj.gettask'
	local postArr = {}
	postArr.phonename = device.name()
	postArr.imei = sys.mgcopyanswer("SerialNumber")
	local taskData = post(url,postArr)
	if taskData ~= nil then
		taskData = json.decode(taskData)
		if taskData.data == '任务完成' then
			return false
		else
			return taskData.data
		end
	end
end

function back_pass(task_id,success)
	local url = 'http://wenfree.cn/api/Public/tjj/?service=Tjj.backpass'
	local postArr = {}
	postArr.task_id = task_id
	postArr.success = success
	return post(url,postArr)
end

function task(task_id,url,way) 
	while true do
		if vpn() then
			if checkip() then
				if open(url)then
					if way == 'reg' then
						if Tjj_reg() then
							back_pass(task_id,'ok')
							vpnx()
							return true
						else
							back_pass(task_id,'注册失败')
							vpnx()
							return true
						end
					elseif way == 'active' then
						if Tjj_active() then
							back_pass(task_id,'ok')
							vpnx()
							return true
						else
							back_pass(task_id,'激活失败')
							vpnx()
							return true
						end
					end
				end
			end
			closeX(bid.淘集集)
		end
		vpnx()
		delay(5)
	end
end

while true do
	local taskdata = get_task()
	if type(taskdata) == 'table' then
		for i,v in ipairs(taskdata) do
			log(v)
			task_id = v.task_id
			url = v.work
			way = v.way
			task(task_id,url,way) 
		end
	else
		log("暂无任务",true)
		delay(60)
	end
end





















