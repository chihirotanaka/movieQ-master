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
  # game画面
    get 'playquizzes/:id/quiz' => 'playquizzes#play_quiz' ,as: :play_quiz
    get 'playquizzes/:id/result/:anser=1' => 'playquizzes#result_quiz' ,as: :result_quiz
    get 'playquizzes/:id/total' => 'playquizzes#total_quiz' ,as: :total_quiz


  # 管理
  devise_for :admins, skip: :all
  root 'admins/movies#index'
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new' , as: :new_admin_session
    post  'admins/sign_in' => 'admins/sessions#create' ,  as: :admin_session
    delete 'admins/log_out' => 'admins/sessions#destroy' ,  as: :destroy_admin_session
  end
  namespace :admins do
    resources :movies, only:[:index, :create, :edit, :update, :destroy]
  end
end
