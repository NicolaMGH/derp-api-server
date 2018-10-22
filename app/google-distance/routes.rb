require "json"
require "http"
require "optparse"

def get_route
  resp = HTTP.get("https://maps.googleapis.com/maps/api/directions/json?origin=Mississauga,ON&destination=Toronto,ON&key=AIzaSyDcFke1ZrAdWqgp5zG_oQvzXP7-uHcnAt4")
  resp.parse
end