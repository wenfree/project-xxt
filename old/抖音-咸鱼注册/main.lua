
function myRand(rnType,rnLen,rnUL)
	local zmRan,HexRan,myrandS,rns
	rnUL=rnUL or 3
	rns=rns or 0  --用于精确随机种子
	rns=rns+1
	zmRan={"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
	"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"}
	HexRan={"0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f","A","B","C","D","E","F"}
	myrandS=""
--	math.randomseed(rns..tostring(os.time()):reverse():sub(1, 6))
	if rnType==1 then --生成数字
		myrandS=math.random(9)
		for r1=1,rnLen-1 do
			myrandS=myrandS..math.random(0,9)
		end
	elseif rnType==2 then --生成手机号,rnLen,rn11无需设置
		local mheader={"13","15"}
		myrandS=mheader[math.random(#mheader)]
		for r1=1,9 do
			myrandS=myrandS..math.random(0,9)
		end
	elseif rnType==3 then --生成字母
		for r1=1,rnLen do
			myrandS=myrandS..zmRan[math.random(52)]
		end
	elseif rnType==4 or rnType==5 then --生成数字/字母组合或邮箱
		local rn3=math.random(2,5)
		for r1=1,rn3 do
			myrandS=myrandS..zmRan[math.random(52)]
		end
		for r1=1,rnLen-rn3 do
			myrandS=myrandS..math.random(0,9)
		end
		if rnType==5 then
			local mailheader={"@qq.com","@hotmail.com","@sohu.com"} --自行增减
			myrandS=myrandS..mailheader[math.random(#mailheader)]
		end
	elseif rnType==6 then --生成16进制
		myrandS=HexRan[math.random(2,22)]
		for r1=1,rnLen-1 do
			myrandS=myrandS..HexRan[math.random(22)]
		end
	end
	if rnUL==1 then
		return string.upper(myrandS) --返回大写
	elseif rnUL==2 then
		return string.lower(myrandS) --返回小写
	else
		return myrandS
	end
end
--[[
print(myRand(1,9))
print(myRand(2))
print(myRand(3,9,1))
print(myRand(4,9,2))
print(myRand(5,9,""))
print(myRand(6,9))
print(myRand(7,9))
--]]






xin = {
		"赵","钱","孙","李","周","吴","郑","王","冯","陈","褚","卫","蒋",
		"沈","韩","杨","朱","秦","尤","许","何","吕","施","张","孔","曹",
		"严","华","金","魏","陶","姜","戚","谢","邹","喻","柏","水","窦",
		"章","云","苏","潘","葛","奚","范","彭","郎","鲁","韦","昌","马",
		"苗","凤","花","方","俞","任","袁","柳","酆","鲍","史","唐","费",
		"廉","岑","薛","雷","贺","倪","汤","滕","殷","罗","毕","郝","邬",
		"安","常","乐","于","时","傅","皮","卞","齐","康","伍","余","元",
		"卜","顾","孟","平","黄","和","穆","萧","尹","姚","邵","湛","汪",
		"祁","毛","禹","狄","米","贝","明","臧","计","伏","成","戴","谈",
		"宋","茅","庞","熊","纪","舒","屈","项","祝","董","梁","杜","阮",
		"蓝","闵","席","季","麻","强","贾","路","娄","危","江","童","颜",
		"郭","梅","盛","林","刁","钟","徐","邱","骆","高","夏","蔡","田",
		"樊","胡","凌","霍","虞","万","支","柯","咎","管","卢","莫","经",
		"房","裘","缪","干","解","应","宗","宣","丁","贲","邓","郁","单",
		"杭","洪","包","诸","左","石","崔","吉","钮","龚","程","嵇","邢",
		"滑","裴","陆","荣","翁","荀","羊","於","惠","甄","魏","加","封",
		"芮","羿","储","靳","汲","邴","糜","松","井","段","富","巫","乌",
		"焦","巴","弓","牧","隗","山","谷","车","侯","宓","蓬","全","郗",
		"班","仰","秋","仲","伊","宫","宁","仇","栾","暴","甘","钭","厉",
		"戎","祖","武","符","刘","姜","詹","束","龙","叶","幸","司","韶",
		"郜","黎","蓟","薄","印","宿","白","怀","蒲","台","从","鄂","索",
		"咸","籍","赖","卓","蔺","屠","蒙","池","乔","阴","郁","胥","能",
		"苍","双",
	}


function rd(min,max)
	return math.random(min,max)
end

function strs(n,t)
	local str = ''
	for i=1,n do
		str = str .. xin[rd(1,#t)]
	end
	return str
end


--for i=1,10000 do
--	print(strs(rd(15,20),xin))
--end

for i=1,10000 do
	print(myRand(3,rd(40,50)))
end































