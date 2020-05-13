Rails.application.routes.draw do

  namespace :admins do
  end
  # ユーザー
  devise_for :users
  root 'quizzes#top'
  get 'users/:id/home'=>'users#home', as: :user_home
  resources :users, only:[:edit, :update, :destroy]
  resources :quizzes, only:[:new, :create, :edit, :update, :destroy] do
      resource :favorites, only:[:create, :destroy]
      resource :unfavorites, only:[:create, :destroy]
  end
  get 'quizzes/:id/quiz' => 'quizzes#quiz'
  get 'quizzes/:id/result/:anser=1' => 'quizzes#result'
  get 'quizzes/:id/total' => 'quizzes#total'


  # 管理
  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new' , as: :new_admin_session
    post  'admins/sign_in' => 'admins/sessions#create' ,  as: :admin_session
    delete 'admins/log_out' => 'admins/sessions#destroy' ,  as: :destroy_admin_session
  end
  namespace :admins do
    resources :movies, only:[:index, :create, :edit, :update, :destroy]
  end
end
