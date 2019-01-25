nLog = require('nLog')()


a = {
"180.121.236.45    ",
"183.147.218.111   ",
"113.121.155.133   ",
"220.165.159.31    ",
"60.161.178.58     ",
"182.99.241.156    ",
"114.243.48.146    ",
"42.55.199.165     ",
"113.120.161.28    ",

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


for i=1,15 do 
	

















