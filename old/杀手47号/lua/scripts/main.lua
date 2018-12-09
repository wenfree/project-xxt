nLog = require('nLog')()
require("xxtsp")
nLog(app.front_bid())




app_bids = 'com.squareenixmontreal.hitmansniper'
screen.init(1)


ui={}
ui.play={{{952,659,0xffffff},{333,719,0xffffff},{640,726,0x8d0000},{846,724,0x8d0000},},85}
	ui.play_skip={{{1053,399,0x8b0000},{1053,377,0x8b0000},{1052,421,0x8b0000},}, 85, 905, 379, 1106, 422}
ui.tap_to_continue={{{796,713,0xffffff},{1019,295,0x82878f},{1009,209,0x25282d},{1014,131,0x7a8289},},85}
ui.red_={{{25,140,0xffffff},{37,142,0xffffff},{19,194,0x8d0000},},85}
ui.red_gun_={{{1088,685,0x8d0000},{1052,685,0x8d0000},{15,682,0xffffff},},85}
ui.red_gun_kill={{{494,670,0xffffff},{494,657,0xffffff},{494,683,0xffffff},{481,671,0xf7f7f7},{507,670,0xffffff},}, 85, 446, 627, 732, 716}
ui.red_end={{{1074,495,0x4468a6},{1054,551,0x4468a9},{1067,614,0x910e00},{35,722,0x8d0000},},85}
ui.red_end_gun={{{73,177,0xfdc000},{1033,186,0xfdc000},{970,187,0xfdc000},},85}

function kill()
	local timeline = os.time()
	local outtimes = 60*24*60
	while os.time()-timeline < outtimes do
		if active(app_bids,5)then
			if d(ui.play,'ui.play')then
				delay(2)
				if d(ui.play_skip,'ui.play_skip',true)then
				else
					d(ui.play,'ui.play',true,1)
				end
			
			elseif d(ui.tap_to_continue,'ui.tap_to_continue',true,1)then
			elseif d(ui.red_,'ui.red_')then
				click(60, 234)
				if d(ui.red_gun_,"ui.red_gun_")then
					if d(ui.red_gun_kill,"ui.red_gun_kill",true)then
						delay(3)
					end
				end
			elseif d(ui.red_end_gun,"ui.red_end_gun")then
				click(1061, 720)
			elseif d(ui.red_end,"ui.red_end")then
				click(1058, 722)
			else
				log('other')
				click(1084, 719)
			end
		end
	delay(2)
	end
end


 kill()















