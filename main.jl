include("src/pomojulia.jl")

dict = Dict("-k" => () -> countdown(LONGBREAK), "-p" => () -> countdown(POMODORO), "-s" => () -> countdown(SHORTBREAK))

isempty(ARGS) ? start() : (fun = get(dict, ARGS[1], () -> countdown(defaultTimer)); fun())