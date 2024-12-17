# pomojulia

pomojulia is a command-line interface (CLI) program built in Julia, designed to help you apply the <a href="https://pt.wikipedia.org/wiki/T%C3%A9cnica_pomodoro"> Pomodoro Technique </a> effectively.

## Getting Started

### Instalation
```sh
https://github.com/wiirios/pomojulia.git
cd pomojulia
julia -e "using Pkg; Pkg.instantiate()"
```

## Hot to use it?

### Command-Line Arguments
Run the program with the following options to start a pre-set timer:

```sh
julia main.jl -p  # Starts a 25-minute timer (Pomodoro session)
julia main.jl -k  # Starts a 15-minute timer (Long break)
julia main.jl -s  # Starts a 5-minute timer (Short break)
```

### Interactive Terminal GUI

If no arguments are provided, the program launches an interactive menu in your terminal:

```
========================== PomoJulia ==========================
                             17:49
> Start Timer
  Set Timer
  Set Custom Message
  Set Clear Display
  Exit

===============================================================
```

#### Options in the Menu:

1.  **Start Timer**: Begin the timer with the current settings.
2.  **Set Timer**: Change the timer duration (Pomodoro, break, etc.).
3.  **Set Custom Message**: Modify the notification message displayed when the timer ends.
4.  **Toggle Clear Display**: Enable or disable a feature to clear the terminal display after each update.
5.  **Exit**: Quit the program.

### Notifications
When the timer finishes, PomoJulia sends a notification to your desktop with the custom message you set (default: `"Time is up!"`).

## MIT License
This project is licensed under MIT license, read more at <span><a href="https://docs.github.com/pt/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository">docs.github</span>