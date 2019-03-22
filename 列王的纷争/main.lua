-- 此处为nLog功能实现操作
nLog = require('nLog')()

require('xxtsp')
require('faker')


local Appbid = 'com.elex-tech.ClashOfKings'

var={}
var.nikename = myRand(4,rd(5,8))

--XXTfakerNewPhone(Appbid)
cok={}

cok.arrow={{
	{31, 38, 0xe0d3ab},
	{20, 37, 0xe5e0c3},
	{53, 14, 0xe7de9c},
	{54, 58, 0xbb8c4d},
}, 85}
cok.建造按钮={{{319, 913, 0x8f762b},{221, 894, 0x764e20},{416, 933, 0x624e1e},{319, 935, 0x937028},}, 85, 181, 858, 451, 959}
cok.建造按钮_={{{462, 1065, 0xa08a35},{401, 1060, 0x7d5c25},{586, 1096, 0x59491a},}, 85, 15, 1015, 630, 1121}
cok.建造按钮_跳转={{{482, 794, 0x450000},{519, 800, 0x3a0000},{471, 783, 0x8e1914},{443, 804, 0x240602},}, 85, 361, 679, 570, 954}
cok.羽毛笔={{{475, 50, 0xceccb5},{478, 27, 0xd9ebea},{486, 21, 0xcde1e1},}, 85, 448, 13, 508, 63}
cok.改名_确定={{{343, 498, 0x475a2e},{343, 479, 0x93c78c},{230, 508, 0x1e2e13},}, 85, 185, 461, 456, 545}

function arrow()
	if d(cok.arrow,'cok.arrow')then
		if d(cok.建造按钮,"cok.建造按钮",true)then
		elseif d(cok.建造按钮_,"cok.建造按钮_",false)then
			if d(cok.建造按钮_,"cok.建造按钮_",true)then
			end
		elseif d(cok.建造按钮_跳转,"建造按钮_跳转",true)then
		elseif up_times and d(cok.羽毛笔,"cok.羽毛笔",true)then
		else
			d(cok.arrow,'cok.arrow',true)
		end

		return true
	end
end


cok['跳过剧情']={{{562, 117, 0xbb9351},	{570,  96, 0xedbe6a},	{576,  96, 0x150f0c},}}
cok['金币_游戏正常']={{
	{605, 42, 0xe3cb58},
	{605, 33, 0xf1dc60},
	{603, 33, 0x7d4c1b},
}}
cok['游戏正常_升级按钮']={{{216, 664, 0xf7ba10},{216, 641, 0xfff8d5},{200, 665, 0xf7b604},{233, 665, 0xf9b503},{213, 695, 0xe4720c},}, 85, 74, 330, 580, 787}
cok['左上提示']={{{596, 163, 0xeebc20},{566, 133, 0xd1cd00},}, 85, 0, 0, 0, 0}
cok['提示手']={{{228, 194, 0xd8d2cb},{237, 234, 0xfaf1c2},{260, 244, 0xf9d761},{283, 262, 0x0d0d0a},{270, 225, 0x5a3305},}, 85, 0, 0, 0, 0}

cok['文明介绍']={{{268, 1084, 0x51371c},{ 62, 1086, 0xc6bb92},{570, 1088, 0x755729},{412, 1061, 0xa77c46},}, 85, 13, 1013, 627, 1131}
cok['文明介绍确定选择']={{{147, 696, 0x395a17},{ 74, 676, 0x496f1b},{543, 709, 0x304b12},}, 85, 46, 636, 582, 752}
cok['领主改名']={{
	{291, 501, 0x363639},
	{386, 505, 0x252525},
	{489, 365, 0xf9efe4},
	{329, 299, 0xb4a380},
}, 85}

function tips()
	if d(cok['跳过剧情'],'跳过剧情',true)then
		delay(20)
	elseif d(cok['左上提示'],'左上提示',true)then
	elseif d(cok['提示手'],'提示手',true)then
	elseif d(cok['文明介绍'],'文明介绍',true)then
	elseif d(cok['文明介绍确定选择'],'文明介绍确定选择',true)then
		city = 4
	elseif up_times and d(cok['领主改名'],'领主改名',true)then
		var.nikename = myRand(4,rd(8,12))
		click(458, 367,2)
		input(var.nikename)
		if d(cok['改名_确定'],'cok.改名_确定',true)then
			up("cok")
		end
		fixkey = false
	else
		tips__ = tips__ or 0
		tips__ = tips__ + 1
		tips___ = tips__ % 3
		if tips___ == 0 then
			click(40,40)
		elseif tips___ == 1 then
			click(67, 1098)
		else
			click(321, 584)
		end
	end
end

cok['游戏正常_升级按钮_']={{{399, 708, 0xf0b200},{400, 667, 0xfff7cb},{372, 708, 0xfcba00},{427, 708, 0xfdb600},{392, 757, 0xdf7618},}, 85, 21, 383, 620, 900}
cok['游戏正常_升级按钮__']={{{400, 728, 0xf0b100},{399, 690, 0xffffeb},{374, 724, 0xf2b10d},{423, 724, 0xf4b40d},{400, 773, 0xf48303},}, 85, 6, 410, 633, 911}

cok['游戏正常_建造提示']={{{34, 945, 0xdbd103},{40, 940, 0x593d12},{51, 944, 0xe9e202},}, 85, 26, 931, 62, 962}
cok['游戏正常_建造提示_']={{{46, 946, 0xe00f0b},{53, 959, 0xde483e},}, 85, 15, 929, 85, 976}
cok['游戏正常_领取奖励']={{{112, 953, 0x00f300},{123, 952, 0x00f000},{120, 946, 0x01d300},}, 85, 88, 943, 187, 969}

cok['游戏正常_在城市中']={{{67, 1113, 0x410f07},{53, 1092, 0xc19a5b},{76, 1089, 0x866535},}, 85, 10, 1070, 113, 1128}
cok['游戏正常_在野外']={{
	{67, 1073, 0x7198cd},
	{75, 1107, 0x5b433b},
	{67, 1107, 0xb9a894},
}, 85}
cok['游戏正常_第二锤免费']={{{31, 280, 0xffd25c},{31, 278, 0xffd25c},{37, 278, 0xe7bd56},}, 85, 12, 254, 86, 302}

function play()
	if active(Appbid,5)then
		if d(cok['金币_游戏正常'],'金币_游戏正常')then
			
			if d(cok['游戏正常_在野外'],'游戏正常_在野外',true) then
			elseif d(cok['游戏正常_在城市中'],'游戏正常_在城市中') then
				d(cok['游戏正常_升级按钮'],'游戏正常_升级按钮',true)
				d(cok['游戏正常_升级按钮_'],'游戏正常_升级按钮_',true)
				d(cok['游戏正常_升级按钮_'],'游戏正常_升级按钮__',true)
				
				click(46, 169)
				log('点一下锤子')
				
				if fixkey and os.time()-fixTime >= 60*5 then
					click(40,40)
				
				elseif d(cok['游戏正常_第二锤免费'],'游戏正常_第二锤免费',true) then
				elseif d(cok['游戏正常_领取奖励'],'游戏正常_领取奖励',true) then
				elseif d(cok['游戏正常_建造提示'],'游戏正常_建造提示',true)or d(cok['游戏正常_建造提示_'],'建造提示',true)then
					click(321, 584)
				end
			end
			
		elseif arrow() then
		else
			tips()
		end
	end
	delay(1)
end

function up(name,other)
	if up_times then
		local url = 'http://idfa888.com/Public/idfa/?service=idfa.idfa'
		local idfalist ={}
		idfalist.phonename = phonename or device.name()
		idfalist.phoneimei = phoneimei or sys.mgcopyanswer("SerialNumber")
		idfalist.phoneos = phoneos or sys.version()
		idfalist.name = name
		idfalist.idfa = var.nikename
		idfalist.ip = ip or get_ip() or '192.168.1.1'
		idfalist.password = password
		idfalist.phone = phone
		idfalist.other = other
		up_times = false
		return post(url,idfalist)
	end
end

function GameCok()
	if vpn()then
		city = 1
		up_times = true
		XXTfakerNewPhone(Appbid)
		local timeLine = os.time()
		local outTime = math.random(20,50)
		local fixTime = os.time()
		local fixkey = true
		
		while os.time()-timeLine < 7*60 + outTime do
			play()
			delay(1)
		end
	end
end


while (true) do
	local ret,errMessage = pcall(GameCok)
	if ret then
	else
		sys.alert(errMessage, 15)
		delay(1)
	end
end































































































