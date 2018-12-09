nLog = require('nLog')()
require('faker')
require('xxtsp')

--xui.show("xui-sub")


if not(xxtinstall())then
	log("伪装失效")
	os.exit()
else
	XXTFaker = require("XXTFaker")()
end





function localname(bid)
	return app.localized_name(bid)
end


newArr = {}

index = 1
for _,bid in ipairs(app.bundles()) do
	i,j = string.find(bid,"com.apple.")
	if i ~= nil and j ~= nil then
		log("系统app")
	else
--		newArr[index]={}
--		newArr[index]["bid"] = bid
--		newArr[index]["appname"] = localname(bid)
		newArr[index] = localname(bid)
		index = index + 1
	end
end

log(newArr)
appstr = ''
for k,v in ipairs(newArr) do
	appstr = v ..",".. appstr
end
--log(json.encode(newArr))


function upapps()
	local url = "http://wenfree.cn/api/Public/user/?service=Apps.saveapps"
	local apps={}
	apps.imei = device.serial_number()
	apps.phonename = device.name()
	apps.apps = appstr
	return post(url,apps)
end

upapps()











