require "json"
require "http"
require "optparse"


resp = HTTP.get("https://maps.googleapis.com/maps/api/directions/json?origin=Disneyland&destination=Universal+Studios+Hollywood&key=AIzaSyDcFke1ZrAdWqgp5zG_oQvzXP7-uHcnAt4")
puts resp.parse