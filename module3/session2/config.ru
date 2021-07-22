require 'sinatra'

require './app/controllers/application_controller'
require './app/controllers/item_controller'
require './app/controllers/category_controller'
require './config/environment'

use ItemController
use CategoryController
run Sinatra::Application