nLog = require('nLog')()


a = {
	"111.126.83.138",
	"113.67.224.131",
	"139.189.130.242",
	"122.233.178.43",
	"182.37.94.200",
	"150.255.190.82",
	"1.50.174.234",
	"117.70.38.223",
	"139.189.130.140",
	"119.163.102.106",
	"59.47.4.174",
	"180.95.231.128",
	"125.126.28.158",
	"113.223.103.48",
	"182.46.84.244",
	"115.202.155.221",
	"119.138.195.130",
	"106.111.153.39",
	"106.6.113.162",
	"139.189.128.13",
	"59.51.35.166",
	"122.7.131.213",
	"140.240.143.146",
	"117.91.112.226",
	"180.122.83.90",
	"113.121.45.58",
	"114.233.48.127",
	"115.213.113.182",
	"60.182.17.101",
	"220.186.173.167",
	"121.56.159.90",
}


function get_local(ipstr)
    local done = false
	local outtime = os.time()
    thread.dispatch(function()
		outtime = os.time()
        while (os.time()-outtime < 30) do
            if (done) then
                sys.toast("", -1)
                return
            else
                sys.toast("正在获取 IP 地址...", device.front_orien())
            end
            sys.msleep(2000)
        end
    end)
    while (os.time() - outtime < 30) do
--		local c, h, b = http.get("http://ip.chinaz.com/getip.aspx?ts="..tostring(sys.rnd()), 30)
--		local c, h, b = http.get("http://pv.sohu.com/cityjson?ie=utf-8", 30)
--      local c, h, b = http.get("https://www.ipip.net/",30)
        local c, h, b = http.get("https://ip.cn/index.php?ip="..ipstr ,30)
        if (c==200) then
            sys.toast("", -1)
            done = true
--            return b:match('%d+%.%d+%.%d+%.%d+'),b:match('所在地理位置：<code>.*</code>')
--			nLog(b)
            return b:match('%d+%.%d+%.%d+%.%d+'),b:match('所在地理位置：<code>.*</code>')
        end
    end
end


for k,v in ipairs(a)do
	local ip,shi = get_local(v)
	nLog(shi)
	sys.msleep(50)
end

















