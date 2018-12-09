nLog = require('nLog')()
require('faker')
require('xxtsp')
require('name')
require('alz')

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
--		vpnx()
		local appbids = app.front_bid()
		if appbids ~= "com.apple.springboard" then
--			app.quit(appbids)
			--closeX(appbids)
		end
		sys.msleep(500)
	end)

bid={}
bid.无忧行 = "com.cmi.jegotrip"


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
	idfalist.ip = '192.168.1.1'
	idfalist.ip = get_ip() or '192.168.1.1'
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


apparr={}
apparr.right={{{462,666,0x007aff},{225,666,0x007aff},}, 85, 54, 394, 590, 809}

web={}
web.open={{{526,632,0x007aff},{396,622,0x3897ff},{393,623,0xffffff},},85}
web.findbox ={{{213,614,0xffffff},{118,827,0xff6d39},{563,823,0xff6d39},}, 85, 16, 140, 625, 912}
web.subimt = {{{270,813,0xffffff},{41,820,0xff6d39},{292,791,0xff6d39},{603,821,0xff6d39},{304,860,0xff6d39},}, 85, 0, 0, 0, 0}
--融360
--urls = "http://m.rong360.com/app/osdown/?ios=https://itunes.apple.com/cn/app/id1026689855?mt=8&android=https://campaign.rong360.com/applanding/rongapp/landing_22.html?&weixin=&from=zckj_xgxyk_ceshi01"
--全日空海淘
urls = "https://sjh.baidu.com/site/1c1j888.com/e486a93a-9f89-42a5-a9a4-8af342fcb44d"
function open(urls)
	openUrl(urls)
	delay(3)
	local timeline = os.time()
	local outtimes = 60
	while os.time()-timeline < outtimes do
		os.exit()
		if d(web.findbox,"web.findbox",true)then
			delay(1)
			input(random_name())
			click(126, 590)
			if GET_Phone()then
				input(phone)
				delay(2)
			end
			d(web.subimt,"web.subimt",true)
			delay(5)
			return true
		else
			moveTo(300,900,300,700,20)
		end
		delay(1)
	end
	log("open time ",true)
end

function sts()
	vpnx()
	delay(3)
	vpn()
--
	XXTfakerNewPhone('com.apple.mobilesafari')
	delay(2)
	open(urls)
end



function last()
	input(random_name())
	click(126, 590)
	if GET_Phone()then
		input(phone)
		delay(2)
	end
	d(web.subimt,"web.subimt",true)
	screen.image():save_to_album()
	delay(5)
end

if d(web.subimt,"web.subimt",false) then
	key = false
else
	key = true
end

if key then
	sts()
else
	last()
end
















