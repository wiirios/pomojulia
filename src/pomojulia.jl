# ==============================================
# pomojulia
# Author @wiirios
# ==============================================

using Alert
using Dates

const SHORTBREAK = 5
const LONGBREAK = 15
const POMODORO = 25

defaultTimer = SHORTBREAK

today = Dates.today()
hourNow = hour(now())
minutesNow = minute(now())

struct teste
    time::Int64
    #sound::Bool
end

function createTimer(x::Int64)
    return teste(x)
end

function getTimerName()
    timeNameMap = Dict(SHORTBREAK => "Short Break", LONGBREAK => "Long Break")
    return get(timeNameMap, defaultTimer, "Pomodoro")
end

function getTimer()
    timerMap = Dict(5 => SHORTBREAK, 15 => LONGBREAK)
    return get(timerMap, defaultTimer, 25)
end

#alert()
println("""
========================== PomoJulia ==========================
                             $(hourNow):$(minutesNow)                
1 - Start Timer
2 - Set Break
3 - Exit

* Timer at $(getTimer()) $(getTimerName())
=======================================================
""")

#print("\rUpdating... Step ", i, " of 10")