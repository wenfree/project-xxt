-- 此处为nLog功能实现操作
nLog = require('nLog')()

local getUnreadCount = function()
	proc_put('unread', '')
	local starttm = os.time()
	app.eval{
lua = [==[dispatch_sync(dispatch_get_main_queue(), function()
	local num = objc.class.CAppViewControllerManager.getAppViewControllerManager().getTopViewController().getTotalUnreadCount()
	num = num
	proc_put('unread', num)
end)]==]
	}
	while (os.time() - starttm < 3) do
		local r = proc_put('unread', '555')
		if r ~= "" then return r end
	end
	return
end
nLog(getUnreadCount())


