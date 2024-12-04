include("../src/pomojulia.jl")

# -k 15
# -p 25
# -s 5

# dictionary containing times 
dict = IdDict("-k" => () -> countdown(LONGBREAK), "-p" => () -> countdown(POMODORO), "-s" => () -> countdown(SHORTBREAK))

fun = get(dict, ARGS, () -> countdown(defaultTimer))

isempty(ARGS) ? start() : fun()