require 'sinatra'
require 'sinatra/reloader'


SECRET_NUMBER = rand(100)
number = SECRET_NUMBER
get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  erb :index, :locals => {:number => number, :message => message}
end

def check_guess(guess)
  difference = guess - SECRET_NUMBER
  case
    when guess == 0 then ""
    when guess > number && difference > 5 then "Way too high!"
    when guess < number && difference < 5 then "Way too low!"
    when guess > number then "Too high!"
    when guess < number then "Too low!"
    else "You got it right!"
  end
end
