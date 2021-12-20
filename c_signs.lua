--[[
Skrypt został wykonany przez:
    •NotPaladyn (not.paladyn@gmail.com) (NotPaladyn#0477)

Zasób stworzony dla serwisu gtaonline.pl / gtao.pl
]]--

signs = {
    ["drawDistance"] = 150,
    ["refreshTime"] = 500,
    ["createdSigns"] = {},
    ["signsTextures"] = {
        ["none"] = dxCreateTexture("images/none.png", "dxt5"),
        ["50"] = dxCreateTexture("images/50.png", "dxt5"),
    },
};

signs.render = function()
    local cx, cy, cz = getCameraMatrix()
    local rx, ry, rz = getElementRotation(getCamera())

    for i,v in ipairs(signs["createdSigns"]) do
        if isElement(v) then
            local sx, sy, sz = getElementPosition(v)
            local signInfo = getElementData(v, "sign:info") or {2, "none", 0, 0, 0}

            drawTransformedMaterial(signs["signsTextures"][signInfo[2]], sx, sy, sz, signInfo[3], signInfo[4], signInfo[5], signInfo[1], signInfo[1], {255, 255, 255, 255}, 0, 0, 0)
        end
    end
end

signs.getNearby = function()
	local cx, cy, cz = getCameraMatrix()
	
	signs["createdSigns"] = {}
	for k, v in ipairs(getElementsByType("sign")) do 
		local x, y, z = getElementPosition(v)
		if getDistanceBetweenPoints3D(x, y, z, cx, cy, cz) < signs["drawDistance"] then 
			table.insert(signs["createdSigns"], v)
		end
	end
end

addEventHandler("onClientResourceStart", resourceRoot, function()
	setTimer(signs.getNearby, signs["refreshTime"], 0)
	addEventHandler("onClientRender", root, signs.render)
end)