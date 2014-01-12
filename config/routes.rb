DataEngineering::Application.routes.draw do
  get "/" => "home#index", :as => "home"
  post "/" => "home#process_import", :as => "process_import"
end
