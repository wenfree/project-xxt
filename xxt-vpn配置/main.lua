-- 此处为nLog功能实现操作
nLog = require('nLog')()




var={}
var.dispName = 'vpn'
var.server = 't.yhtip.com'


phone={}
phone.wx1='wx001'
phone.wx2='wx002'
phone.wx4='wx004'
phone.wx5='wx005'

phone.qt01='qt001'
phone.qt02='qt002'
phone.qt03='qt003'
phone.qt04='qt004'
phone.qt05='qt005'

if phone[device.name()] then
	var.authorization = phone[device.name()]
end


local success = vpnconf.create{
    dispName = var.dispName,       -- VPN 的显示名
    VPNType = "L2TP",              -- VPN 的类型，支持 PPTP、L2TP、IPSec、IKEv2
    server = var.server,    -- 服务器地址
    authorization = var.authorization,      -- 账号
    password = 'Aa112211',           -- 密码
    secret = '1',            -- 密钥，PPTP 可不填
    encrypLevel = 1,               -- 加密级别，选填，默认 1
    group = '',                    -- 群组名称，选填，默认 ""
    VPNSendAllTraffic = 1,         -- 是否发送所有流量，选填，默认 1
}
if success then
    sys.alert('创建成功')
else
    sys.alert('创建失败，确定人品没有问题？')
end