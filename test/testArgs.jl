include("../src/pomojulia.jl")

dict = IdDict("-k" => () -> countdown(LONGBREAK), "-p" => () -> countdown(POMODORO), "-s" => () -> countdown(SHORTBREAK))

fun = get(dict, ARGS, () -> countdown(defaultTimer))

isempty(ARGS) ? start() : fun()