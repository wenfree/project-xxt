--随机姓名
function random_name()
	local xin = {
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
	local ming = {
		"卫国","虹君","东亮","品阎","品妍","奕宣","品颜","浩宇","品闫",
		"韵澄","亚男","晓初","潆龙","桂英","浩然","浩均","琳","宇辰",
		"博雯","泽西","泺西","博西","淋西","洛西","乐惜","萌","若溪",
		"均泽","丽米","丽敏","若霖","筠达","多多","筠泽","珍多","真多",
		"佳仪","佳益","佳沂","佳艺","珈艺","唯","一唯","靖埕","丽红",
		"泊雯","亮","琼","姿言","征月","小琼","伟","坤","炜","品严",
		"品开","冉佳","发和","琨","玲","佳乐","畅","向春","玥娴","刚",
		"宇杰","海东","家驹","丽琴","博通","文贤","小琴","广通","丽琇",
		"诚","学豪","展成","展灰","灰展","展森","森展","展城","旭成",
		"成旭","旭","辉煌","展水","展翔","展翅","展吉","程","广燕",
		"珈萱","碎英","龙风","成祥","成龙","晨洋","一平","新建","玮",
		"凤英","晓聪","孝聪","骊嫒","王成","小美","振智","侃","晨",
		"元","晨安","昕怡","晨周","晨新","佳妍","晨曦","晨辉","晨晖",
		"晨徽","晨珲","拴提","晨智","晨志","晨治","晨昊","晨晞","晨炜",
		"晨显","晨踌","晨宝","晨郑","晨丰","晨灿","学森","晨陈","晨层",
		"晨彰","晨鞑","晨郦","晨传","晨岛","晨帝","康恒","晨只","恒康",
		"晨中","苏恒","康","恒苏","建江","臻","蓉蓉","玉珍","建农","冰蕾",
		"志强","泠含","宇韬","潇匀","泠伊","潇文","红燕","宗安","未来",
		"同妍","韦亘","亘盈","建亭","松泉","建","至慧","生","明莉","叶",
		"韦谖","是惠","则霖","永杰","淑清","宁","学超","太","丹","邢一",
		"薇亦","静","舜","建舜","敏燕","全","荣国","海燕","芸","奕芸",
		"钰蕊","映日","映月","诤","映星","邢进","科","靖","逸清","逸青",
		"鹏军","玺宇","丽娅","丽娜","明","泽麟","金宝","钰锟","玉玺",
		"金玺","力","泳文","雅","海帆","雅丽","睿睿","国民","忠彦",
		"噌","君","红艳","映","晟","成","盈","呈","乐","嘉忆","麦子",
		"小芊","钊","梓旭","新宇","兴宇","家宝","文芳","岚","祥俊",
		"庆","钰睿","雪儿","春","钰芮","锦","孝","航雨","兴良","凯平",
		"思先","思危","艳琼","燕群","育凤","锋","建禹","建帝","建刚",
		"建强","建成","建峰","建安","建城","建国","慧","良钗","玲莉",
		"雨霖","羿帆","智民","鹏辉","佳","军","少敏","佳涵","恩卓","文卓",
		"炬","炯炯","利炜","烊烊","伟烊","圣菊","光旭","文烨","宁烨",
		"袁烨","光明","斌","宁烽","晓烽","小烽","日烽","立烽","玥彤",
	}
	local resxin = xin[math.random(1,#xin)]
	local resming = ming[math.random(1,#ming)]
	
	local res = ''
	
	res = resxin..resming
	return res
end

	local xin = {
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















