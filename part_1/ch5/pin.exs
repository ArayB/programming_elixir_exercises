defmodule Greeter do
    def for(name, greeting) do
        fn
            (^name) -> "#{greeting} #{name}"
            (_) -> "I don't know you"
        end
    end
end

mr_barnes = Greeter.for("Ant", "Yo!")

IO.puts mr_barnes.("Ant")
IO.puts mr_barnes.("Tony")