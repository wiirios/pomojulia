# pomojulia

pomojulia is a command-line interface (CLI) program built in Julia, designed to help you apply the <a href="https://pt.wikipedia.org/wiki/T%C3%A9cnica_pomodoro"> Pomodoro Technique </a> effectively.

## Getting Started

### Instalation
```cmd
https://github.com/wiirios/pomojulia.git
cd pomojulia
julia -e "using Pkg; Pkg.instantiate()"
julia main.jl
```

## Hot to use it?

A screen in terminal will appear with the options and what each one does. it's somewhat self-explanatory.

```
========================== PomoJulia ==========================
                             17:49
1 - Start Timer
2 - Set Timer
3 - Set Custom Message
4 - Set Clear Display
5 - Exit

* Timer at: 5 Short Break
* Current Message: Time is up!
* Clear Display Function: false
===============================================================
```

When the time runs out, it will send a notification to your desktop.


## MIT License
This project is licensed under MIT license, read more at <span><a href="https://docs.github.com/pt/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository">docs.github</span>