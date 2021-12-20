--[[
Skrypt został wykonany przez:
    •NotPaladyn (not.paladyn@gmail.com) (NotPaladyn#0477)

Zasób stworzony dla serwisu gtaonline.pl / gtao.pl
]]--

--{skala tekstury, tekstura, pozycja x, pozycja y, pozycja z, rotacja x, rotacja y, rotacja z},
signsPositions = {
    {3, "50", -2428.15771, -596.84686, 132.31133-0.95, -5, 0, 45},
};

for i,v in ipairs(signsPositions) do
    local sign = createElement("sign")
    setElementData(sign, "sign:info", {v[1], v[2], v[6], v[7], v[8]})
    setElementPosition(sign, v[3], v[4], v[5])
end 