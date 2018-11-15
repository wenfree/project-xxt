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

bid={}
bid.棋金五牛牌 = 'com.qijing.wuniupai'





screen.init(1)
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
	idfalist.ip = ip or get_ip() or rd(1,255)..'.'.. rd(1,255)..'.'.. rd(1,255)..'.'..rd(1,255)
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
apparr.正常界面={{{311,265,0x2afafe},{785,178,0x07d3f8},{785,164,0x2afafe},},85}
apparr.触发更新={{{202,434,0xeebd49},{202,433,0xc59621},}, 85, 177, 399, 951, 456}

function IDFA(bids)
	if XXTfakerNewPhone(bids)then
		idfa = XXTfakerGetinfo(bids)['IDFA']
		local TIMEline = os.time()
		local OUTtime = rd(180,200)

		while os.time()- TIMEline < OUTtime do
			if active(bids,4)then
				if d(apparr.right,"apparr.right",true)then
				elseif d(apparr.正常界面,'apparr.正常界面')then
					if d(apparr.触发更新,'apparr.触发更新')then
						up(appname(bids),'触发更新')
						delay(rd(50,60))
						return true
					end
				end
			end
			delay(1)
		end
		up(appname(bids),'更新超时')
	end
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


while true do
	if vpn() then
		delay(1)
		ip = get_ip()
		if ip ~= "192.168.1.1" and ip~= nil then
			if checkip() then
				IDFA(bid.棋金五牛牌)
			end
		end
	end
	vpnx()
	delay(2)
end































































