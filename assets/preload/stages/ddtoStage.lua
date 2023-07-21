local pulsespeed = 2;
local pulseAlpha = 1;
local pulseDelay = 0.3;
local pulseEnabled = true;
local pulsed = false;

function onCreate()
	scale = 1.2;
	posX = -570;
	posY = -350;
	posX2 = -570;
	posY2 = -280;
	
	-- background shit
	
	makeLuaSprite('sky', 'stage/dnatbgsky', posX2, posY);



	setScrollFactor('sky', 0.1, 0.1);
	scaleObject('sky', 2.4, 2.4);


	
	makeLuaSprite('mountain', 'stage/dnatbgcliffs', posX2, posY);
	setScrollFactor('mountain', 0.2, 0.2);
	scaleObject('mountain', 2.4, 2.4);

	
	makeLuaSprite('city2', 'stage/dnatbgcity2', posX2, posY2);
	setScrollFactor('city2', 0.4, 0.4);
	scaleObject('city2', 2.4, 2.4);

	
	makeLuaSprite('city1', 'stage/dnatbgcity1', posX2, posY2);
	setScrollFactor('city1', 0.5, 0.5);
	scaleObject('city1', 2.4, 2.4);

	
	makeLuaSprite('trees', 'stage/dnatbgtrees', posX2, posY2);
	setScrollFactor('trees', 0.9, 0.9);
	scaleObject('trees', 2.4, 2.4);

	
	makeLuaSprite('floor', 'stage/dnatbgfloor', posX2, posY2);
	setScrollFactor('floor', 1, 1);
	scaleObject('floor', 2.4, 2.4);

	
	makeLuaSprite('wall', 'stage/dnatbgwall', posX2, posY2);
	setScrollFactor('wall', 1, 1);
	scaleObject('wall', 2.4, 2.4);

	
	makeLuaSprite('bg', 'stage/VS-BG', posX, posY);
	setScrollFactor('bg', 1, 1);
	scaleObject('bg', 2.4, 2.4);
	setProperty('bg.alpha', 0.001);
	
	makeLuaSprite('bgdim', 'stage/VS-BGdim', posX, posY);
	setScrollFactor('bgdim', 1, 1);
	scaleObject('bgdim', 2.4, 2.4);
	
	addLuaSprite('sky', false);
	addLuaSprite('mountain', false);
	addLuaSprite('city3', false);
	addLuaSprite('city2', false);
	addLuaSprite('city1', false);
	addLuaSprite('trees', false);
	addLuaSprite('floor', false);
	addLuaSprite('wall', false);
	
	addLuaSprite('bgdim', false);
	addLuaSprite('bg', false);
	doPulse();
end

function doPulse()
	if pulseEnabled then
		--Ima be real, the math.Sin thing didn't work the way I liked it so yeah lazy
		doTweenAlpha('bgPulse', 'bg', pulseAlpha, pulsespeed, 'linear')
	end
end

function onTweenCompleted(tag)
	if tag == 'bgPulse' then
		if pulsed then
			pulsed = false;
			pulseAlpha = 0;
		else
			pulsed = true;
			pulseAlpha = 1;
		end
		runTimer('delay', pulseDelay)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'delay' then
		doPulse();
	end
end

function onEvent(name, value1, value2) 
	if name == 'Invert Background' then
		if value1 == 'true' then
			--Will figure out later
		else
			
		end
	end
end