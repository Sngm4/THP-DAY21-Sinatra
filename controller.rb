require 'bundler'
Bundler.require

class ApplicationController < Sinatra::Base #la classe ApplicationController hérite de la classe Sinatra avec toutes ses fonctionnalités de base.
  get '/' do #Demande au code d'exécuter le code qui suit s'il se rend sur l'URL '/' soit le serveur local.
    "<html><head><title>The Gossip Project</title></head><body><h1>Mon super site de gossip !</h1></body></html>" #code HTML qui doit s'afficher
  end

  run! if app_file == $0 #permet d'executer le code de la classe sans avoir à utiliser perform.
end