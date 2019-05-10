
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


--公共函数
local curl = require('lcurl')
local e = curl.easy()
--e:escape('abcd$%^&*()')
--查询ip地址
function checkip()
	local url = 'http://hlj.wenfree.cn/wp-api/Public/idfa/?service=Ip.Checkip'
	local getdata = get(url)
	if getdata ~= nil then
		local data = json.decode(getdata)
		log(data or "nil")
		if data.data.state == "ok" then
			log("ip可以用:OK.",true)
			ip = data.data.ip
			return true
		else
			log("ip, 排重失败",true)
		end
	end
end
--取任务接口
function get_task()
	local url = 'http://hlj.wenfree.cn/wp-api/Public/idfa/'
	local postArr = {}
	postArr.service = "Task.Task_get"
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
--返回任务状态
function task_callback(id,success,arr)
	local url = 'http://hlj.wenfree.cn/wp-api/Public/idfa/'
	local postArr = {}
	postArr.service = "Task.Task_callback"
	postArr.id = id
	postArr.success = success
	postArr.arr = json.encode(arr)
	return post(url,postArr)
end
--结束函数
function ends()
	for _,bid in ipairs(app.bundles()) do
		app.quit(bid)
	end
	vpnx()
	sys.msleep(2000)
end



nLog = require('nLog')()
require('faker')
require('xxtsp')

function all()

	local task_data = get_task()
	if task_data then
		if task_data.channel == "xianyu_qs" then
			package.loaded['qsz'] = nil
			require('qsz')
			main(task_data)
		end
	end
	ends()

end

while (true) do
	local ret,errMessage = pcall(all)
	if ret then
	else
		sys.alert(errMessage, 3)
		delay(1)
	end
end
























