nLog = require('nLog')()
require('faker')
require('xxtsp')

local curl = require('lcurl')
local e = curl.easy()

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
			--closeX(appbids)
		end
		sys.msleep(500)
	end)

function rd(n,k)
	return math.random(n,k)
end

function appname(bid)
	return app.localized_name(bid) or '未安装'
end

-- 总的脚本, 用渠道名来区分脚本
function get_task()
	local url = 'http://wenfree.cn/api/Public/tjj/?service=Tjj.gettask'
	local postArr = {}
	postArr.phonename = phonename or device.name()
	postArr.imei = phoneimei or sys.mgcopyanswer("SerialNumber")
	local taskData = post(url,postArr)
	
	if taskData ~= nil then
		taskData = json.decode(taskData)
		log(taskData)
		
		if taskData.data == "新增手机" or taskData.data == "暂无任务" then
			log(taskData.data,true)
			delay(30)
			return false
		else
			return taskData.data
		end
	end
end

function task_callback(task_id,success)
	local url = 'http://wenfree.cn/api/Public/idfa/?service=Task.Task_callback'
	local postarr_ = {}
	postarr_['idfa'] = idfa
	local postArr = {}
	postArr.id = task_id
	postArr.success = success
	postArr.arr = json.encode(postarr_)
	log("wenfree")
	post(url,postArr)
	log("上传一次")
end

function checkip()
	local url = 'http://wenfree.cn/api/Public/idfa/?service=ip.checkip'
	local getdata = get(url)
	if getdata ~= nil then
		local data = json.decode(getdata)
		log(data or "nil")
		if data.data.state == "ok" then
			ip = data.data.ip or get_ip()
			log("ip可以用:OK.",true)
			return true
		else
			log("ip, 排重失败",true)
		end
	else
		log("ip服务器故障")
	end
end

function ends()
	for _,bid in ipairs(app.bundles()) do
		app.quit(bid)
	end
	vpnx()
	sys.msleep(2000)
end



function open_url()
	local url = "https://young.chinaso.com/m/wap/index.html?utm_campaign=%E6%B4%BB%E5%8A%A8%E6%8E%A8%E5%B9%BF&utm_medium=hdtg00001&utm_source=%E5%85%AD%E4%B8%80"
	app.open_url(url)
	delay(3)
end
	
t={}
t["立即下载"]={{
	{371, 769, 0xffd46c},
	{206, 780, 0xffd46c},
	{442, 733, 0xffd46c},
	{401, 777, 0x705d2f},
}, 85, 180, 713, 484, 825}
t["取消"]={{
	{353, 632, 0x1f8aff},
	{350, 628, 0x007aff},
	{290, 634, 0xffffff},
}, 85, 210, 600, 435, 665}
--open_url()
				osList = {
					"12.4",	"12.4",	"12.4","12.4","12.4","12.4","12.4",
					"12.3.1","12.3.1","12.3.1",
					"12.3","12.3",
					"12.2","12.1.4",
					"11.4","11.4","11.4","11.4","11.4","11.4","11.4","11.4",
					"11.4.1","11.4.1","11.4.1","11.4.1","11.4.1","11.4.1","11.4.1",
					"11.3.1","11.3.1",
					"11.3",
				}
				
apparr={}
apparr.right={{{462,666,0x007aff},{225,666,0x007aff},}, 85, 54, 394, 590, 809}
function newidfa(bid)
	local TIMEline = os.time()
	local OUTtime = rd(60,180)
	if XXTfakerNewPhone(bid)then
		while os.time()- TIMEline < OUTtime do
			if active(bid,4)then
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
			delay(2)
		end
	end
end

local lun = 1
while true do
	if vpn()then
		open_url()
		delay(5)
		d(t["取消"],"取消",true)
		if lun%4 ~= 0 then
			if d(t["立即下载"],"立即下载",true)then
				delay(10)
				if lun%2 == 0 then
					newidfa("com.chinaso.search")
				end
			end
		end
	end
	ends()
	delay(3)
	lun=lun + 1
end

























































