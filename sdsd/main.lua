nLog = require('nLog')()
require('faker')
require('xxtsp')
require('alz')

--_DEBUG = true
--if _DEBUG then
--	xui.show('interface.xui')
--else
--	xui.show('interface.xuic')
--end
--[[
local uitimes = os.time()

while app.front_bid() ~= "com.xxtouch.XXTExplorer" do
	sys.toast("正在加载链接")
	sys.msleep(200)
	if os.time()-uitimes >= 120 then
		return false
	end
end

while app.front_bid() == "com.xxtouch.XXTExplorer" do
	sys.toast("按Home键或者开关 启动脚本")
	sys.msleep(1000)
	local dict = xui.read('sdsd')
	log(dict)
	if os.time()-uitimes >= 120 then
		return false
	end
end
--]]

--xui.setup('interface.xui')
--local default = xui.get('com.yourcompany.yourscript', '_config.name')
--local dict = xui.read('sdsd')
--log(dict)




if not(xxtinstall())then
	log("伪装失效")
	os.exit()
else
	XXTFaker = require("XXTFaker")()
end

bid={}
bid.闪电降价 = {
				['appbid']='com.hs.shanjiang',
--				['url']=dict["link"],
			}
bid.闪电降价.url = "http://lnk0.com/dEdI5k"


screen.init(0)
var = {}
var.lun = 0
--全局变量


function up(name,other)
	local url = 'http://idfa888.com/Public/idfa/?service=idfa.idfa'
	local idfalist ={}
	idfalist.phonename = phonename or device.name()
	idfalist.phoneimei = phoneimei or sys.mgcopyanswer("SerialNumber")
	idfalist.phoneos = phoneos or sys.version()
	idfalist.name = name
	idfalist.idfa = idfa
	idfalist.ip = ip or get_ip() or '192.168.1.1'
	idfalist.account = account or "wenhong"
	idfalist.password = password
	idfalist.phone = phone
	if var.wuping then
		idfalist.other = var.wuping.."-"..other
	else
		idfalist.other = other
	end
	return post(url,idfalist)
end

function rd(n,k)
	return math.random(n,k)
end

function appname(bid)
	return app.localized_name(bid) or '未安装'
end

--openUrl("https://m.weibo.cn/status/4258678762614093?wm=3333_2001&from=1087093010&sourcetype=weixin&featurecode=newtitle")
--os.exit()


web={}
web.open={{{526,632,0x007aff},{396,622,0x3897ff},{393,623,0xffffff},},85}

function open(urls)
	if XXTfakerNewPhone("com.apple.mobilesafari")then
		delay(2)
		openUrl(urls)
		delay(3)
		local timeline = os.time()
		local outtimes = 60
		while os.time()-timeline < outtimes do
			if d(web.open,"web.open",true,1)then
				delay(math.random(10,15))
				return true
			end
			delay(1)
		end
		log("open time ",true)
	end
end



apparr={}
apparr.right={{{462,666,0x007aff},{225,666,0x007aff},}, 85, 54, 394, 590, 809}
apparr.闪电降价tip={{{374,886,0xffdb4c},{256,881,0xffdb4c},{471,227,0x4c4c4c},},85}
apparr.闪电降价tip={{
	{383, 883, 0xffdb4c},
	{255, 883, 0xffdb4c},
	{446, 226, 0x4c4c4c},
}, 85}
apparr.tips_x={{
	{570, 200, 0x4c4c4c},
	{387, 885, 0xffdb4c},
	{197, 884, 0xffdb4c},
}, 85}

apparr.首页_我={{
	{567, 1118, 0x4c4c4c},
	{446, 1087, 0x4c4c4c},
	{316, 1058, 0x646464},
	{ 63, 1066, 0xffdb4c},
}, 85}

apparr['我_登录/注册']={{
	{272, 164, 0x333333},
	{269, 164, 0xffffff},
	{266, 164, 0x333333},
	{167, 165, 0x333333},
	{167, 168, 0xffffff},
}, 85}

apparr['注册界面']={{{444, 125, 0xffdb4c},{453,  83, 0x333333},{451,  74, 0xffffff},{ 23,  84, 0x4c4c4c},}, 85, 7, 43, 610, 150}--4
	apparr.getyzm={{{547, 299, 0x4d4d4d},{561, 290, 0x4c4c4c},}, 85, 486, 261, 617, 336}
	apparr.button={{{306, 677, 0x333333},{303, 667, 0xfed34d},{291, 660, 0x343333},}, 85, 247, 612, 391, 736}

apparr.注册成功={{
	{574, 1065, 0xffdb4c},
	{447, 1062, 0x4c4c4c},
	{502,  155, 0xebce90},
}, 85}

function newidfa(bids,times)
	for i= 1,times do
		if false or  XXTfakerNewPhone(bids)then
			idfa = XXTfakerGetinfo(bids)['IDFA']
			local TIMEline = os.time()
			local OUTtime = rd(180,200)
			
			
			取号 = true
			验证码 = false
			密码 = false
			短信 = false
			提交 = false
			password = "Aa123456" or myRand(4,rd(7,10))
			success = false
			
			while os.time()- TIMEline < OUTtime do
				if active(bids,4)then
					if d(apparr.首页_我,"apparr.首页_我",true,1)then
					elseif d(apparr['我_登录/注册'],"登录/注册",true)then
					elseif d(apparr['注册界面'],"注册界面",false)then
						if 取号 then
							click(219, 205)
							if GET_Phone()then
								input(phone)
								取号 = false
								验证码 = true
							end
						elseif 验证码 then
							if d(apparr.getyzm,'apparr.getyzm',true)then
								验证码 = false
								密码 = true
							end
						elseif 密码 then
							click(98, 411)
							input(password)
							密码 = false
							短信 = true
						elseif 短信 then
							if GET_message(phone)then
								click(262, 307)
								input(sms)
								短信=false
								提交=true
							else
								delay(3)
							end
						elseif 提交 then
							if d(apparr.button,'apparr.button',true)then
								up(appname(bids),'注册提交')
								success = true
							end
						else
							click(540, 84)
						end
					elseif success and d(apparr.注册成功,'apparr.注册成功')then
						up("闪电刷单",bid['闪电降价']['url'])
						delay(rd(5,10))
						sys.alert("注册完成",0)
						os.exit()
						
					else
						if d(apparr.tips_x,"apparr.tips_x",true,1)then
						elseif d(apparr.闪电降价tip,"闪电降价tip",true,1)then
						else
							log('---')
							click(40,100)
						end
					end
				end
				delay(1)
			end
			
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

vpnx()
delay(3)
kfy.id = '13860'
address ={
	
	
{"力士沐浴露","彭森生","福建省泉州市鲤城区侨乡商品1-313号","15280889719",},
{"龙猫充电宝","贾静晓","上海市浦东新区川沙镇新川路768号","13511645365",},
{"美的电压力锅","维津","福建省泉州市惠安县峰崎村香格里茶业隔壁服装店","15880920275",},
{"浴巾","吴征明","贵州省安顺市蔡官镇新路口北斗小区2单元601室","13098532249",},
{"飞科剃须刀192","张永庆","河南省周口市商水县平店乡","17643177054",},
{"苏泊尔电压力锅2.5L","玉凌","福建省泉州市惠安县惠兴街漂亮E点理发店","13489256320",},
{"力士沐浴露","吴梅","福建晋江青阳福隆广场1期5栋1712","18050979819",},
{"美的电烤箱","玉凌","福建省泉州市惠安县惠兴街漂亮E点理发店","13489256320",},
{"苏泊尔电压力锅2.5L","何碧硕","福建省泉州市惠安县霞张红联幼儿园对面豆腐店","13489256752",},
{"小麦牙刷","吴征明","贵州省安顺市蔡官镇新路口北斗小区2单元601室","13098532249",},
{"美的电饭煲FS40174L","任光翠","福建省泉州市惠安县海城园林天下8号楼805室","15280471856",},
{"美的电烤箱","维津","福建省泉州市惠安县峰崎村香格里茶业隔壁服装店","15880920275",},
{"飞科剃须刀192","袁田方","河南省周口市商水县袁庄乡","15559116895",},
{"美的电磁炉2170","何玉雪","福建省泉州市惠安县海城园林天下","13459555934",},
{"电动车档披风","张芳","福建省泉州市惠安县惠兴街漂亮E点理发店","18050925205",},
{"美的电压力锅","吴梅","福建晋江青阳福隆广场1期5栋1712","18050979819",},
{"美的电饭煲FS40174L","何玉雪","福建省泉州市惠安县海城园林天下","13459555934",},
{"小麦牙刷","维津","福建省泉州市惠安县峰崎村香格里茶业隔壁服装店","15880920275",},
{"苏泊尔电压力锅2.5L","任光翠","福建省泉州市惠安县海城园林天下8号楼805室","15280471856",},
{"美的电磁炉2170","郑伟杰","福建省泉州市惠安县辋川镇后许村村委会","15059504270",},
{"浴巾","郑少杰","福建省漳州市漳浦县古雷区新港城9区12号2单元801","18960211900",},
{"苏泊尔电压力锅2.5L","何碧硕","福建省泉州市惠安县霞张红联幼儿园对面豆腐店","13489256752",},
{"穆家纺枕头3对","烨彬","福建省泉州市惠安县海城园林天下8号楼805室","15285443712",},
{"飞科剃须刀192","袁田方","河南省周口市商水县袁庄乡","15559116895",},
{"苏泊尔电压力锅2.5L","郑少杰","福建省泉州市惠安县海城园林天下","18960211900",},
{"美的电饭煲FS40174L","任光翠","福建省泉州市惠安县海城园林天下8号楼805室","15280471856",},
{"美的电磁炉2170","张芳","福建省泉州市惠安县惠兴街漂亮E点理发店","18050925205",},

}

key = 3
var.wuping = address[key][1]


while true do
--if not(dict['vpn']) or vpn() then
	if vpn() then
		if checkip() then
			if open(bid['闪电降价']['url'])then
				newidfa(bid.闪电降价.appbid,1)
			end
			closeX(bid.闪电降价.appbid)
		end
		sys.alert("ip验证失败",3)
		vpnx()
		delay(3)
	end
end






































