-- 此处为nLog功能实现操作
nLog = require('nLog')()
require('faker')
require('xxtsp')



bid = "com.tencent.wok"

if not(xxtinstall())then
	log("伪装失效")
	os.exit()
else
	XXTFaker = require("XXTFaker")()
end

--[[]]
XXTFaker.filter_app({bid})
XXTFaker.set_config(                        
    bid,
    {
        DeviceName = "iPad",
        ProductType = "iPad2,1"
    },
    false
)
--]]