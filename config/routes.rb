Rails.application.routes.draw do
 
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  root 'contacts#index'

  resources :timerecords
  
  get 'timerecords/timeout/:id' => 'timerecords#timeout'
  get 'timerecords/add_timerecord' => 'timerecords#add_timerecord'


  
  resources :contacts do
  	resources :locations
    resources :people
  end

  resources :signs do
    resources :attributes
  	resources :records
  end
end
