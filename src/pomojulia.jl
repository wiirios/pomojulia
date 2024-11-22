# ==============================================
# pomojulia
# Author @wiirios
# See more about pomodoro technique here 
# https://en.wikipedia.org/wiki/Pomodoro_Technique
# ==============================================

using Alert
using Dates

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

    function getTimerName()
        timeNameMap = Dict(SHORTBREAK => "Short Break", LONGBREAK => "Long Break")
        return get(timeNameMap, defaultTimer, "Pomodoro")
    end

    function getTimer()
        timerMap = Dict(SHORTBREAK => 5, LONGBREAK => 15)
        return get(timerMap, defaultTimer, 25)
    end

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
    end

    exit = false

    while !exit
        println("""

    ========================== PomoJulia ==========================
                                $(hourNow):$(minutesNow)                
    1 - Start Timer
    2 - Set Timer
    3 - Set Custom Message
    4 - Exit

    * Timer at: $(getTimer()) $(getTimerName())
    * Current Message: $(defaultMessage)
    ===============================================================""");

    try 
        optionOne = parse(Int64, readline())
        if optionOne == 1
        countdown(defaultTimer)
    elseif optionOne == 2
        println("""

    ========================== PomoJulia ==========================
                                $(hourNow):$(minutesNow)                
    1 - Short Break
    2 - Long Break
    3 - Pomodoro

    * Timer at $(getTimer()) $(getTimerName())
    ===============================================================""");

    optionTwo = parse(Int64, readline())
        global defaultTimer    

        if optionTwo == 1
            defaultTimer = SHORTBREAK
        elseif optionTwo == 2
            defaultTimer = LONGBREAK
        elseif optionTwo == 3
            defaultTimer = POMODORO
        end
    
    elseif optionOne == 3
        printstyled(color = :yellow, "Current Message: ", defaultMessage)
        print(" Set new message />")
        global defaultMessage
        optionMessage = readline()

        defaultMessage = optionMessage
            
    else
        break
    end
    catch ex
        printstyled(color = :red, "\rSomething went wrong")
    end
end
