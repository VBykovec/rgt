Rgt::Application.routes.draw do
  #devise_for :users
  devise_for :users, :controllers => {sessions: 'sessions'}
  root :to => 'index#index' 
  scope 'api' do
    resources 'projects' 
    resources 'tasks'
  end
end

