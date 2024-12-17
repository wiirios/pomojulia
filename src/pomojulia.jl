# ==============================================
# pomojulia
# Author @wiirios
# See more about pomodoro technique here 
# https://en.wikipedia.org/wiki/Pomodoro_Technique
# ==============================================

import REPL

using Alert
using Dates
using REPL.TerminalMenus

today = Dates.today()
hourNow = hour(now())
minutesNow = minute(now())

    mutable struct TimerStruct
        minutes::Int64
    end

    SHORTBREAK = TimerStruct(5)
    LONGBREAK = TimerStruct(15)
    POMODORO = TimerStruct(25)

    defaultTimer = SHORTBREAK
    defaultMessage = "Time is up!"

    # shell command
    command = `"powershell" -Command "cls"`
    commandActive = false

    function getTimerName()
        timeNameMap = Dict(SHORTBREAK => "Short Break", LONGBREAK => "Long Break")
        return get(timeNameMap, defaultTimer, "Pomodoro")
    end

    function getTimer()
        timerMap = Dict(SHORTBREAK => 5, LONGBREAK => 15)
        return get(timerMap, defaultTimer, 25)
    end

    """
    countdown(struct::Int64)

Generates a timer with a specific time data 

# Examples

```julia
julia>  mutable struct TimerStruct
            minutes::Int64
        end

julia> timer = TimerStruct(5) # 5 = 5 Minutes
julia> countdown(timer)
```
"""
    function countdown(pomodoroOption::TimerStruct)
        minutes = pomodoroOption.minutes
        seconds = 0

        while minutes >= 0
            for i in 1:-1:1
                print("\r", minutes, ":", seconds)
                sleep(1)
    
                if seconds == 0
                    minutes -= 1
                    seconds = 60
                end

                seconds -= 1
            end
        end
        alert(defaultMessage)
        run(command)
    end

    exit = false

    function start()
        while !exit
            options = ["Start Timer", "Set Timer", "Set Custom Message", "Set Clear Display", "Exit"]
            menu = RadioMenu(options, pagesize=5)
        
            optionsTimer = ["Short Break", "Long Break", "Pomodoro"]
            menuTimer = RadioMenu(optionsTimer, pagesize=3)

            println("========================== PomoJulia ==========================
                             $(hourNow):$(minutesNow)           ")
            choice = request("", menu)
            
        try
            if choice == 1
                if commandActive == true
                    run(command)
                end
            countdown(defaultTimer)
            
            elseif choice == 2
                choiceTimer = request("", menuTimer)
                global defaultTimer

                if choiceTimer == 1
                    defaultTimer = SHORTBREAK
                elseif choiceTimer == 2
                    defaultTimer = LONGBREAK
                else
                    defaultTimer = POMODORO
                end
            
            elseif choice == 3
                println("Current Message: ", "'",defaultMessage,"'")
                print("Set new message /> ")
                global defaultMessage
                optionMessage = readline()
        
                defaultMessage = optionMessage

            elseif choice == 4
                global commandActive
                commandActive = !commandActive
                println("Set Clear Message: ", commandActive)
            else
                break
            end
        catch ex
            print("\rSomething went wrong")
        end
    end
end