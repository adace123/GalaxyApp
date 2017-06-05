Rails.application.routes.draw do
  devise_for :users
  resources :galaxies
  root  'galaxies#landing'
  patch '/galaxies/:id(.:format)'  => 'galaxies#update', :as => 'update_galaxy'
  post '/galaxies/find/' => 'galaxies#find'
  post '/galaxies/findadvanced' => 'galaxies#findadvanced'
  get '/galaxies/:id/delete' => 'galaxies#destroy'
  
end
