-- 此处为nLog功能实现操作

keyword = {
	{"hello语音",200},
	{"yy语音",200},
}

--[[
keyword = {
	{"hello语音",800},
	{"yy语音",800},
	{"北京PK10",300},
	{"福彩快三",50},
	{"北京28",50},
	{"北京赛车PK10计划",50},
	{"快三彩票",50},
	{"幸运飞艇",50},
}
--]]
	
	
--9FB93887-6163-C347-51E4-65D7F67CF9D9
math.randomseed(os.time())

function idfa16(n)
	local a ={}
		for i=0,9 do
			a[i]=i
		end
		a[10]="A"
		a[11]="B"
		a[12]="C"
		a[13]="D"
		a[14]="E"
		a[15]="F"
		
	if n == 1 then
		return a[math.random(0,15)]
	else
		return a[math.random(0,15)]..idfa16(n-1)
	end
end

--lineTime = os.time() - (13+(24-18))*60*60


for i=1,200 do
--[[
	local idfa = idfa16(8) .."-".. idfa16(4).."-".. (idfa16(4)).."-".. (idfa16(4)).."-".. (idfa16(12))
	print(idfa)
--]]	
	for ii,v in ipairs(keyword) do
		if i <= v[2] then
			local idfa = idfa16(8) .."-".. idfa16(4).."-".. (idfa16(4)).."-".. (idfa16(4)).."-".. (idfa16(12))
			print(v[1] .."	".. idfa)
		end
	end
--	print(idfa16(8)) .."-".. print(idfa16(4)).."-".. print(idfa16(4)).."-".. print(idfa16(4)).."-".. print(idfa16(12))
--]]
end


