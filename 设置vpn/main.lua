-- 此处为nLog功能实现操作
nLog = require('nLog')()

--[[]]

local success = vpnconf.create{
    dispName = 'wenhong',       -- VPN 的显示名
    VPNType = "L2TP",              -- VPN 的类型，支持 PPTP、L2TP、IPSec、IKEv2
    server = 'yhtip.com',    -- 服务器地址
    authorization = 'wenhong',      -- 账号
    password = 'Aa112211',           -- 密码
    secret = '1',            -- 密钥，PPTP 可不填
    encrypLevel = 1,               -- 加密级别，选填，默认 1
    group = '',                    -- 群组名称，选填，默认 ""
    VPNSendAllTraffic = 1,         -- 是否发送所有流量，选填，默认 1
}
if success then
    sys.alert('创建成功',1)
else
    sys.alert('创建失败，确定人品没有问题？',1)
end

local success = vpnconf.select('wenhong')
if success then
    sys.alert('操作成功',1)
else
    sys.alert('操作失败，确认你要选中的 VPN 配置存在？',1)
end


os.exit()
--]]