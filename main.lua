function love.load()
    player = {}
    player.simbolo = "X"
    gan = false
    gan1 = false
    player2 = {}
    player2.simbolo = "O"
    score = 0
    turno1 = true  
    turno2 = false 
    font = love.graphics.newFont(150)
    font1 = love.graphics.newFont(50)
    afont1 = love.graphics.getFont(font1)
    casillas = {
        A = nil, B = nil, C = nil,
        D = nil, E = nil, F = nil,
        G = nil, H = nil, I = nil
    }
    empate = false
    timer = 0
    delay = 3 
    love.window.setTitle("Triqui")
    love.window.showMessageBox("Menu","Bienvenid@ al juego del triqui, las reglas son simples, solo debes asegurarte de que el turno de quien sea este en diagonal o verticalmente y ya","info", true)
end
    function love.update(dt)
        if gan then
            timer = timer + dt
            if timer >= delay then
                love.window.close()
            end
        elseif casillas.A == "X" and casillas.B == "X" and casillas.C == "X" then
            gan = true
        elseif casillas.A == "X" and casillas.D == "X" and casillas.G == "X" then
            gan = true
        elseif casillas.A == "X" and casillas.E == "X" and casillas.I == "X" then
            gan = true
        elseif casillas.B == "X" and casillas.E == "X" and casillas.H == "X" then
            gan = true
        elseif casillas.C == "X" and casillas.E == "X" and casillas.G == "X" then
            gan = true
        elseif casillas.C == "X" and casillas.F == "X" and casillas.I == "X" then
            gan = true
        elseif casillas.D == "X" and casillas.E == "X" and casillas.F == "X" then
            gan = true
        elseif casillas.G == "X" and casillas.H == "X" and casillas.I == "X" then
            gan = true
        elseif casillas.A ~= nil and casillas.B ~= nil and casillas.C ~= nil and casillas.D ~= nil and casillas.E ~= nil and casillas.F ~= nil and casillas.G ~= nil and casillas.H ~= nil and casillas.I ~= nil then
           empate = true
        end
        if gan1 then
            timer = timer + dt
            if timer >= delay then
                love.window.close()
            end
        elseif casillas.A == "O" and casillas.B == "O" and casillas.C == "O" then
            gan1 = true
        elseif casillas.A == "O" and casillas.D == "O" and casillas.G == "O" then
            gan1 = true
        elseif casillas.A == "O" and casillas.E == "O" and casillas.I == "O" then
            gan1 = true
        elseif casillas.B == "O" and casillas.E == "O" and casillas.H == "O" then
            gan1 = true
        elseif casillas.C == "O" and casillas.E == "O" and casillas.G == "O" then
            gan1 = true
        elseif casillas.C == "O" and casillas.F == "O" and casillas.I == "O" then
            gan1 = true
        elseif casillas.D == "O" and casillas.E == "O" and casillas.F == "O" then
            gan1 = true
        elseif casillas.G == "O" and casillas.H == "O" and casillas.I == "O" then
            gan1 = true
        end
    end
function love.draw()
    if not gan and not gan1 and not empate then
        love.graphics.setBackgroundColor(255, 255, 255)
        love.graphics.setColor(0, 0, 0)
        love.graphics.rectangle("line", 266, 0, 2, 600)
        love.graphics.rectangle("line", 532, 0, 2, 600)
        love.graphics.rectangle("line", 0, 200, 800, 2)
        love.graphics.rectangle("line", 0, 400, 800, 2)
        love.graphics.setFont(font)
    if casillas.A then love.graphics.print(casillas.A, 80, 20) end
    if casillas.B then love.graphics.print(casillas.B, 350, 20) end
    if casillas.C then love.graphics.print(casillas.C, 630, 20) end
    if casillas.D then love.graphics.print(casillas.D, 80, 220) end
    if casillas.E then love.graphics.print(casillas.E, 350, 220) end
    if casillas.F then love.graphics.print(casillas.F, 630, 220) end
    if casillas.G then love.graphics.print(casillas.G, 80, 420) end
    if casillas.H then love.graphics.print(casillas.H, 350, 420) end
    if casillas.I then love.graphics.print(casillas.I, 630, 420) end
    end
    love.graphics.setFont(font1)
    if empate then 
        love.graphics.print("Es un empate!", 220, 30)
    end
    if gan then
        love.graphics.print("Player Gana!", 220, 30)
    end
    if gan1 then
        love.graphics.print("Player2 Gana!", 220, 30)
    end
end
function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then
        if x < 266 and y < 200 and not casillas.A then 
            casillas.A = turno1 and player.simbolo or player2.simbolo
            cambiarTurno()
        end
        if x > 266 and x < 532 and y < 200 and not casillas.B then 
            casillas.B = turno1 and player.simbolo or player2.simbolo
            cambiarTurno()
        end
        if x > 532 and y < 200 and not casillas.C then 
            casillas.C = turno1 and player.simbolo or player2.simbolo
            cambiarTurno()
        end
        if x < 266 and y > 200 and y < 400 and not casillas.D then 
            casillas.D = turno1 and player.simbolo or player2.simbolo
            cambiarTurno()
        end
        if x > 266 and x < 532 and y > 200 and y < 400 and not casillas.E then 
            casillas.E = turno1 and player.simbolo or player2.simbolo
            cambiarTurno()
        end
        if x > 532 and y > 200 and y < 400 and not casillas.F then 
            casillas.F = turno1 and player.simbolo or player2.simbolo
            cambiarTurno()
        end
        if x < 266 and y > 400 and not casillas.G then 
            casillas.G = turno1 and player.simbolo or player2.simbolo
            cambiarTurno()
        end
        if x > 266 and x < 532 and y > 400 and not casillas.H then 
            casillas.H = turno1 and player.simbolo or player2.simbolo
            cambiarTurno()
        end
        if x > 532 and y > 400 and not casillas.I then 
            casillas.I = turno1 and player.simbolo or player2.simbolo
            cambiarTurno()
        end
    end
end
function cambiarTurno()
    if turno1 then
        turno1 = false
        turno2 = true
    else
        turno1 = true
        turno2 = false
    end
end
