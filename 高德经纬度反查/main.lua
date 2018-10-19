-- 此处为nLog功能实现操作
nLog = require('nLog')()
require("xxtsp")



left = 37.6838
righ = 99.7558


left2 = 25.3638
right2 = 119.0039

function newlocation()
	newleft = math.random(math.ceil(righ*10000),math.ceil(right2*10000))
	log("newleft" .. newleft)
	newleft = newleft /10000
	newright = math.random(math.ceil(left2*10000),math.ceil(left*10000))
	log("newright" .. newright)
	newright = newright /10000
	return newleft..","..newright
end


function getlocal()
	local gdurl = 'https://restapi.amap.com/v3/geocode/regeo?parameters'
	local gd={}
	gd.key='aebbbe9fbc1ab12bdfb4bca79621f494'
	gd.location= newlocation() or "115.481488,39.990464"
	gd.poitype = '小区'
	gd.radius = 1000
	gd.extensions = "base"
	gd.batch = "false"
	gd.roadlevel=0
	
	local gdlocal = post(gdurl,gd)
	if gdlocal ~= nil then
		return json.decode(gdlocal)
	end
end

log(getlocal())
aaa={
{"玮哥","18910590649","北京市丰台区天伦锦城"},
{"大鹏","18910581638","北京市丰台区银地家园"},
{"岩岩","13716462861","北京市丰台区宜兰园"},
{"别芳","18910590649","北京市西城区欧园北欧印象"},
{"张艺谋","18910581638","北京市西城区中国商标大楼"},
{"刘德华","13716462861","北京市西城区红莲大厦"},
{"姜武","18910590649","北京市西城区第三区"},
{"贾如","18910581638","北京市西城区格调小区"},
{"抖抖","13716462861","北京市西城区依莲轩"},
{"1410崔","18910581638","北京市西城区红莲晴园8号楼中通快递代收"},
}

key = 3
name = aaa[key][1]
phone = aaa[key][2]
locals = aaa[key][3]

input(name)
click(599, 240)
input(phone)
click(363, 474)
input(locals)








