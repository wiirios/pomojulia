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

    function getTimerName()
        timeNameMap = Dict(SHORTBREAK => "Short Break", LONGBREAK => "Long Break")
        return get(timeNameMap, defaultTimer, "Pomodoro")
    end

    function getTimer()
        timerMap = Dict(SHORTBREAK => 5, LONGBREAK => 15)
        return get(timerMap, defaultTimer, 25)
    end

    println("""
    ========================== PomoJulia ==========================
                                $(hourNow):$(minutesNow)                
    1 - Start Timer
    2 - Set Break
    3 - Exit

    * Timer at $(getTimer()) $(getTimerName())
    =======================================================
    """)

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
    end

    countdown(SHORTBREAK)