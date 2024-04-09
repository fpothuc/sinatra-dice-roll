require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  "<h1>Dice Roller</h1>

  <li><a href=\"/zebra\">Zebra</a></li>
  <li><a href=\"/okapi\">Okapi</a></li>
  <li><a href=\"/dice/2/6\">Roll two 6-sided dice</a></li>
  <li><a href=\"/dice/2/10\">Roll two 10-sided dice</a></li>
  <li><a href=\"/dice/1/20\">Roll one 20-sided die</a></li>
  <li><a href=\"/dice/5/4\">Roll five 4-sided die</a></li>
  "
end

get("/zebra") do
  "<li><a href=\"/\">Home</a></li>
  <p>We must add a route for each path we want to support</p>"
end

get("/okapi") do
  okapi_image = "https://cdn1.parksmedia.wdprapps.disney.com/media/blog/wp-content/uploads/2019/03/oka023948209348234-2-235x352.jpg"
  "<li><a href=\"/\">Home</a></li>
  <h1>OKAPI<h1>
  <img src= #{okapi_image}>"
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
  dots = ("*" * first_die) + " + " + ("*" * second_die) + " = " + ("*" * (first_die + second_die)) + ("o" * (12 - (first_die + second_die))) + "| Maximum = 12"
	
  "<li><a href=\"/\">Home</a></li>
   <h1>2d6</h1>
   <p>#{outcome}</p>
   <p>#{dots}</p>"
end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die

  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}"
  dots = ("*" * first_die) + " + " + ("*" * second_die) + " = " + ("*" * (first_die + second_die)) + ("o" * (20 - (first_die + second_die))) + "| Maximum = 20"

  "<li><a href=\"/\">Home</a></li>
  <h1>2d10</h1>
  <p>#{outcome}</p>
  <p>#{dots}</p>"
end

get("/dice/1/20") do
  first_die = rand(1..20)

  outcome = "You rolled #{first_die} for a total of #{first_die}"
  dots = ("*" * first_die) + ("o" * (20 - first_die)) + "| Max 20"

  "<li><a href=\"/\">Home</a></li>
  <h1>1d20</h1>
   <p>#{outcome}</p>
   <p>#{dots}</p>
  "
end

get("/dice/5/4") do
  first_die = rand(1..4)
  second_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  fifth_die = rand(1..4)
  sum = first_die + second_die + third_die + fourth_die + fifth_die

  outcome = "You rolled a #{first_die}, a #{second_die}, a #{third_die}, a #{fourth_die} and a #{fifth_die} for a total of #{sum}"
  dots = ("*" * first_die) + " + " + ("*" * second_die) + " + " + ("*" * third_die) + " + " + ("*" * fourth_die) + " + " + ("*" * fifth_die) + " = " + ("*" * sum) + ("o" * (20 - sum)) + "| Maximum = 20"

  "<li><a href=\"/\">Home</a></li>
  <h1>5d4</h1>
  <p>#{outcome}</p>
  <p>#{dots}</p>"
end
