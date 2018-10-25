authors = [
  %{name: "Jose", language: "Elixir"},
  %{name: "Matz", language: "Ruby"},
  %{name: "Larry", language: "Perl"}
]

languages_with_an_r = fn (:get, collection, next_fn) ->
  for row <- collection do
    if String.contains?(row.language, "r") do
      next_fn.(row)
    end
  end
end

# passing a function as a key to dynamic versions of get_in and get_and_update_in invoke the function to return corresponding values
IO.inspect get_in(authors, [languages_with_an_r, :name])
