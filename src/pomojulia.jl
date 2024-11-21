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
        seconds::Int64
    end

    SHORTBREAK = TimerStruct(5, 60)
    LONGBREAK = TimerStruct(15, 60)
    POMODORO = TimerStruct(25, 60)

    defaultTimer = LONGBREAK

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
        seconds = pomodoroOption.seconds
        minutes = pomodoroOption.minutes
        
        while minutes > 0
            for i in seconds:-1:0
                print("\r",minutes, ":", seconds)
                sleep(1)
                seconds = seconds - 1

                if seconds == 0 && minutes > 0
                    seconds = 5
                    minutes -= 1
                end
            end
        end
    end

    #countdown(defaultTimer)