defmodule Chop do
  def guess(actual, (low..high)) do
    guess(actual, (low..high), div(high,2))
  end

  def guess(actual, (_.._), guess) when guess == actual do
    IO.puts guess
  end

  def guess(actual, (low.._), guess) when guess > actual do
    IO.puts "Is it #{guess}"
    guess(actual, (low..guess), div(guess - low, 2) + low)
  end

  def guess(actual, (_..high), guess) when guess < actual do
    IO.puts "Is it #{guess}"
    guess(actual, (guess..high), div(high - guess, 2) + guess)
  end
end
