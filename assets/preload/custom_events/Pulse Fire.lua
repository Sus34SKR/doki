function onCreatePost()
	makeLuaSprite('firePulse', 'stage/fireblammo', 0, 0);
	setScrollFactor('firePulse', 0, 0);
	setProperty('firePulse.alpha', 0.001);
	setObjectCamera('firePulse', 'camHUD');
	addLuaSprite('firePulse', false);
end

function onEvent(name, value1, value2) 
	if name == 'Pulse Fire' then
		setProperty('firePulse.alpha', 1);
		doTweenAlpha('firePulse', 'firePulse', 0, 0.5, 'linear')
	end
end