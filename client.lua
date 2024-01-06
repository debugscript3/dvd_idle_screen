local x, y = guiGetScreenSize()
local px, py = 200, 90

--Левая часть экрана.
local glx, gly = math.random(0, x/2), math.random(0, y)
local spdl = 3
local plx, ply = spdl, spdl
local color_l = tocolor(255, 255, 255, 255)

--Правая часть экрана.
local grx, gry = math.random(x/2, x), math.random(0, y)
local spdr = 3
local prx, pry = spdr, spdr
local color_r = tocolor(255, 255, 255, 255)

--Получаем рандомный цвет в диапазоне от 0 до 255.
local function SetRandomColor()
    return tocolor(math.random(0, 255), math.random(0, 255), math.random(0, 255), 255)
end

--Не показываем курсор и чат.
showCursor(false)
showChat(false)

addEventHandler("onClientRender", root, function()

    --Отрисовка логотипа на левой части экрана.
    dxDrawRectangle(0, 0, x/2, y, tocolor(0, 0, 255, 255)) --ректангле это не ректально, это квадрат

    glx = glx + plx
    if glx > x/2 - px then
        glx = x/2 - px
        plx = -spdl
        color_l = SetRandomColor()
    elseif glx < 0 then
        glx = 0
        plx = spdl
        color_l = SetRandomColor()
    end

    gly = gly + ply
    if gly > y - py then
        gly = y - py
        ply = -spdl
        color_l = SetRandomColor()
    elseif gly < 0 then
        gly = 0
        ply = spdl
        color_l = SetRandomColor()
    end

    dxDrawImage(glx, gly, px, py, 'logo_dvd.png', 0, 0, 0, color_l)

    --Отрисовка правой части экрана.
    dxDrawRectangle(x/2, 0, x/2, y, tocolor(0, 255, 0, 255))

    grx = grx + prx
    if grx > x - px then
        grx = x - px
        prx = -spdr
        color_r = SetRandomColor()
    elseif grx < x/2 then
        grx =x/2
        prx = spdr
        color_r = SetRandomColor()
    end

    gry = gry + pry
    if gry > y - py then
        gry = y - py
        pry = -spdr
        color_r = SetRandomColor()
    elseif gry < 0 then
        gry = 0
        pry = spdr
        color_r = SetRandomColor()
    end

    dxDrawImage(grx, gry, px, py, 'logo_dvd.png', 0, 0, 0, color_r)
end)