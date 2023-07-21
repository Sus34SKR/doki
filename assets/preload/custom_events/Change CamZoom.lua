function onEvent(name, value1, value2) 
	if name == 'Change CamZoom' then
		if value1 ~=  '' then
			setProperty('defaultCamZoom', value1);
			if value2 ~= '' then
				doTweenZoom('zoomcamera', 'camGame', value1, value2, 'circOut');
			end
		end
	end
end