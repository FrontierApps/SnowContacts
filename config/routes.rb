Rails.application.routes.draw do
 
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  root 'contacts#index'

  get 'timerecords/admin' => 'timerecords#admin'
  get 'timerecords/employee/:id' => 'timerecords#employee'
  get 'timerecords/task/:id' => 'timerecords#task'
  post 'timerecords/jobreport' => 'timerecords#jobreport'
  get 'timerecords/jobreport/:id' => 'timerecords#jobreport'
  
  resources :timerecords
  
  get 'timerecords/timeout/:id' => 'timerecords#timeout'


  
  resources :contacts do
  	resources :locations
    resources :people
  end

  resources :signs do
    resources :attributes
  	resources :records
  end
end
