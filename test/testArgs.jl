include("../src/pomojulia.jl")

if isempty(ARGS)
    start()
elseif ARGS[1] == "-s"
    countdown(defaultTimer)
elseif ARGS[1] == "-k"
    countdown(LONGBREAK)
elseif ARGS[1] == "-p"
    countdown(POMODORO)
end