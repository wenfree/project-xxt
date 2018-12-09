-- 此处为nLog功能实现操作
nLog = require('nLog')()

local bid = "com.tencent.xin"
local XXTFaker = require("XXTFaker")()
if not XXTFaker.exists() then  XXTFaker.install() end
XXTFaker.filter_app({bid})
XXTFaker.set_config(                        --[[进行伪装iPad]]
    bid,
    {
        DeviceName = "iPad",
        ProductType = "iPad2,1"
    },
    false
)