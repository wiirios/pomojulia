using Term
using Term.Consoles: Console, enable, disable
using Term.Prompts
using Term.TermMarkdown
using Markdown

import Term: load_code_and_highlight, highlight_syntax, highlight, tprint, RenderableText

println(
    @green("|") * "|" * @red("|")
)

myTxt = @style "Hello there" magenta bold underline

println(myTxt)

tprint(highlight_syntax("""
    function fun(x::Int64)
        x^2
    end
"""))

tprintln("This text has 1 x::Int64 {bold gold1}style!")

tprintln(Panel(; 
    width=22,
    height=10
))

tprintln(Panel(; 
    width=22, height=2),
    Panel(; 
    width=22, 
    height=3
))

ask(Prompt("Yes?, No?"))

try
    ask(TypePrompt(Int64, "Tell me a number")) 
catch ex
    println(ex)
    # catch AnswerValidationError
end

prompt = OptionsPrompt(["yes", "no"], "Confirm")

prompt |> ask

mymd = """
# Hi!

* 1
* 2

Some text here

!!! danger
    some test here

"""

tprintln(parse_md(mymd))

RenderableText("A"^100; width=20) |> print

tprintln(Panel(
    "{red}awesome{/red}",
    title="Term's",
    title_style="bold green",
    style="gold1 bold",
    subtitle="Panels",
    subtitle_style="bold blue",
    subtitle_justify=:right,
    width=18,
    justify=:center
))

print(Panel(
    "abc";
    width=8,
    box=:ROUNDED,
    style="red"
))