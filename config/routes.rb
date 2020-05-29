Rails.application.routes.draw do
  root 'quizzes#top'
  # ユーザー
  devise_for :users
  get 'users/:id/home'=>'users#home', as: :user_home
  resources :users, only:[:edit, :update, :destroy]
  resources :quizzes, only:[:new, :create, :edit, :update, :destroy] do
    # resource :favorites, only:[:create, :destroy]
    # resource :unfavorites, only:[:create, :destroy]
  end
  # game画面
  get 'playquizzes/quiz' => 'playquizzes#play_quiz' ,as: :play_quiz
  get 'playquizzes/result' => 'playquizzes#result_quiz' ,as: :result_quiz
  get 'playquizzes/total' => 'playquizzes#total_quiz' ,as: :total_quiz
  # game画面(単品)
  #get 'testquizzes/quiz/:id' => 'testquizzes#test_play_quiz' ,as: :test
  #get 'testquizzes/result/:id' => 'testquizzes#test_play_result' ,as: :test_result


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
