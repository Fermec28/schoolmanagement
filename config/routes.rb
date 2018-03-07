Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	root to: 'grades#index'	

	resources :users, only: [:update, :index, :destroy]
	
	resources :grades
	resources :signatures

	resources :students do 
		resources :signatures	
	end

end
