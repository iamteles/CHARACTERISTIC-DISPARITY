--i said i wouldnt use lua but i forgot how to make this shit in haxe lmao
local angleshit = 2;
local anglevar = 2;
function onBeatHit() 
		    if curBeat % 2 == 0 then
			    angleshit = anglevar;
		    else
			    angleshit = -anglevar;
		    end

		    setProperty('healthBar.angle',angleshit*0.05)
		    doTweenAngle('turn', 'healthBar', angleshit, stepCrochet*0.0005, 'circOut')
end
