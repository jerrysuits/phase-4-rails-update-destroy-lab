Rails.application.routes.draw do
  # GET /plants
  get "/plants", to: "plants#index"

  # GET /plants/:id
  get "/plants/:id", to: "plants#show"

  # POST /plants
  post "/plants", to: "plants#create"

  # DELETE /plants/:id
  delete "/plants/:id", to: "plants#delete"
end
