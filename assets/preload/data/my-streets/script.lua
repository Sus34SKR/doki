function onCreatePost() --This is to utilize the built in Dodge Mechanic on other Stages
	makeLuaSprite('white', '', -100, -100);
    makeGraphic('white', 1280*2, 720*2, 'FFFFFF');
    setScrollFactor('white', 0, 0);
    screenCenter('white');
    addLuaSprite('white', true);
	setProperty('white.alpha', 0.01);
	
	makeLuaSprite('black', '', -100, -100);
    makeGraphic('black', 1280*2, 720*2, '000000');
    setScrollFactor('black', 0, 0);
    screenCenter('black');
    addLuaSprite('black', true);
	
	makeLuaSprite('blendObj', '', -100, -100);
    makeGraphic('blendObj', 1280*2, 720*2, '00BFFF');
    setScrollFactor('blendObj', 0, 0);
    screenCenter('blendObj');
    addLuaSprite('blendObj', false);
	setProperty('blendObj.alpha', 0.001);
	setBlendMode('blendObj', 'subtract');
	
	setPropertyFromClass('GameOverSubstate', 'characterName', 'ddto-xml-dead');
end

function onStepHit()
	if curStep == 1 then
		doTweenAlpha('black', 'black', 0, 4, 'linear')
	end
	if curStep == 175 then
		--setProperty('cameraSpeed', 10)
		setProperty('camFollow.x', 300);
		setProperty('camFollow.y', 450);
		setProperty('camera.target.x', 300);
		setProperty('camera.target.y', 450);
		setProperty('isCameraOnForcedPos', true);
		setProperty('defaultCamZoom', 0.8);
		doTweenZoom('zoomcamera', 'camGame', 0.8, 0.01);
	end
	if curStep == 182 then
		setProperty('defaultCamZoom', 1);
		doTweenZoom('zoomcamera', 'camGame', 1, 0.01);
	end
	if curStep == 188 then
		setProperty('defaultCamZoom', 1.2);
		doTweenZoom('zoomcamera', 'camGame', 1.2, 0.01);
	end
	if curStep == 192 then
		pulseEnabled = false;
		setProperty('bgdim.visible', false)
		setProperty('bg.visible', false)
		setProperty('isCameraOnForcedPos', false);
		setProperty('cameraSpeed', 1)
		setProperty('white.alpha', 1);
		doTweenZoom('zoomcamera', 'camGame', 0.7, 0.5);
		setProperty('defaultCamZoom', 0.7);
		doTweenAlpha('white', 'white', 0, 0.5, 'circIn');
	end
	if curStep == 1600 then
		doTweenAlpha('blendObj', 'blendObj', 1, 0.5, 'circIn');
	end
	if curStep == 1856 then
		doTweenAlpha('blendObj', 'blendObj', 0, 0.5, 'circIn');
	end
end

function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
	if getProperty('health') >= 0.5 then
		addHealth(-0.005);
	end
end