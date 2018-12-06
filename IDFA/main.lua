nLog = require('nLog')()
require('faker')
require('xxtsp')

if not(xxtinstall())then
	log("伪装失效")
	os.exit()
else
	XXTFaker = require("XXTFaker")()
end

bid={}
bid.letter2048 = 'com.accoc.firstapp'
bid.斗地主娱乐游戏 = 'com.ahcoole3.ddzddz'
bid.淘劵街 = 'com.tqjw.taoquanjieww'
bid.我爱斗地主 = 'com.shhstudio.love.ddz'
bid.富宏棋牌 = 'com.336SF4RY4P.fhqp'
bid.美丽方舟 = 'com.mymlfz.newmlfz'
bid.波波视频 = 'com.yixia.Miaokan'

screen.init(0)
var = {}
var.lun = 0
--全局变量

function up(text,state)
	local url = 'http://onlyonelife.online/Public/facebook/?service=Facebook.add'
	local flaccount ={}
	flaccount.fristname = '美丽方舟'
	flaccount.mail = idfa
	flaccount.password = "Aa112211"
--	flaccount.phone = phone
	flaccount.phonename = device.name()
--	flaccount.lastname = state or "暂未购买"
	flaccount.map = text
	--get.locationMatching='include&locationLevel=c&location=江苏'
	return post(url,flaccount)
end

--XXTfakerNewPhone(bid.letter2048)
function rd(n,k)
	return math.random(n,k)
end

url = 'http://api.taojiji.com/?a=regionList&app_type=4&g=Api2_9_0&m=address&os=ios&scope_code=1543803840&sign=77ecadb16d94d755db0618288e7b4f3e&system_model=iPhone&system_version=11.1.2&timestamp=1543804018&token=fe22d37438a6c638&user_id=47721696753988744&uuid=6183CD41-59DE-F2CF-52C0-E9867F26EE24&version=2.9.0&parentId='

a={
		{
            ["regionId"]="1",
            ["regionName"]="省份",
		},
        {
            ["regionId"]="2",
            ["regionName"]="北京",
        },
        {
            ["regionId"]="3",
            ["regionName"]="安徽省",
        },
        {
            ["regionId"]="4",
            ["regionName"]="福建省",
        },
        {
            ["regionId"]="5",
            ["regionName"]="甘肃省",
        },
        {
            ["regionId"]="6",
            ["regionName"]="广东省",
        },
        {
            ["regionId"]="7",
            ["regionName"]="广西壮族自治区",
        },
        {
            ["regionId"]="8",
            ["regionName"]="贵州省",
        },
        {
            ["regionId"]="9",
            ["regionName"]="海南省",
        },
        {
            ["regionId"]="10",
            ["regionName"]="河北省",
        },
        {
            ["regionId"]="11",
            ["regionName"]="河南省",
        },
        {
            ["regionId"]="12",
            ["regionName"]="黑龙江省",
        },
        {
            ["regionId"]="13",
            ["regionName"]="湖北省",
        },
        {
            ["regionId"]="14",
            ["regionName"]="湖南省",
        },
        {
            ["regionId"]="15",
            ["regionName"]="吉林省",
        },
        {
            ["regionId"]="16",
            ["regionName"]="江苏省",
        },
        {
            ["regionId"]="17",
            ["regionName"]="江西省",
        },
        {
            ["regionId"]="18",
            ["regionName"]="辽宁省",
        },
        {
            ["regionId"]="19",
            ["regionName"]="内蒙古自治区",
        },
        {
            ["regionId"]="20",
            ["regionName"]="宁夏回族自治区",
        },
        {
            ["regionId"]="21",
            ["regionName"]="青海省",
        },
        {
            ["regionId"]="22",
            ["regionName"]="山东省",
        },
        {
            ["regionId"]="23",
            ["regionName"]="山西省",
        },
        {
            ["regionId"]="24",
            ["regionName"]="陕西省",
        },
        {
            ["regionId"]="25",
            ["regionName"]="上海",
        },
        {
            ["regionId"]="26",
            ["regionName"]="四川省",
        },
        {
            ["regionId"]="27",
            ["regionName"]="天津",
        },
        {
            ["regionId"]="28",
            ["regionName"]="西藏自治区",
        },
        {
            ["regionId"]="29",
            ["regionName"]="新疆维吾尔自治区",
        },
        {
            ["regionId"]="30",
            ["regionName"]="云南省",
        },
        {
            ["regionId"]="31",
            ["regionName"]="浙江省",
        },
        {
            ["regionId"]="32",
            ["regionName"]="重庆",
        }

}

function up_str()
	local url = 'http://wenfree.cn/api/Public/tjj/?service=Address.add&regionid='..regionid..'&str='..str
	log(url)
	get(url,postStr)
end
	
function updates(t)
	for i,v in ipairs(t)do
		local newurl = url..v.regionId
	--	newurl = 'http://api.taojiji.com/?a=regionList&app_type=4&g=Api2_9_0&m=address&os=ios&scope_code=1543803840&sign=77ecadb16d94d755db0618288e7b4f3e&system_model=iPhone&system_version=11.1.2&timestamp=1543804018&token=fe22d37438a6c638&user_id=47721696753988744&uuid=6183CD41-59DE-F2CF-52C0-E9867F26EE24&version=2.9.0&parentId=1'
		local date = get(newurl)
		delay(1)
	--	log(date)

		date = json.decode(date)
		data = date['data']
		data = json.encode(data)

		regionid = v.regionId
		log(regionid)
		log('regionName------------------'..v.regionName)
		str = data
		up_str()
	end
end

function raad_str(regionId)
	local urls = 'http://wenfree.cn/api/Public/tjj/?service=Address.read&regionid='..regionId
	local date = get(urls)
	str = json.decode(date)
	str = str.data.str
	str = json.decode(str)
	log(str)
	return str
end
	
--	newurl = 'http://api.taojiji.com/?a=regionList&app_type=4&g=Api2_9_0&m=address&os=ios&scope_code=1543803840&sign=77ecadb16d94d755db0618288e7b4f3e&system_model=iPhone&system_version=11.1.2&timestamp=1543804018&token=fe22d37438a6c638&user_id=47721696753988744&uuid=6183CD41-59DE-F2CF-52C0-E9867F26EE24&version=2.9.0&parentId=31'
--	newurl = 'http://idfa888.com/Public/idfa/?service=idfa.namelistshow'
--	local date = get_(newurl)
--	log(json.decode(date))
	
--[[
for i=2,32 do
	statr_str = raad_str(i)	
	updates(statr_str)	
end	
--]]
	
	
	
	
	
	
	
	