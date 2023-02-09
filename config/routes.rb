Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'courses#index'
  get 'about', to: 'pages#about'
  #get 'courses/new', to: 'courses#new'
  #get 'students', to: 'students#index'
  resources :courses, except:[:destroy]
  resources :students, except:[:destroy]
  get 'login', to: 'logins#new'
  post 'login', to: 'logins#create'
  delete 'logout', to: 'logins#destroy'
  post 'course_enroll', to: 'student_courses#create'
  delete 'course_drop', to: 'student_courses#destroy'
  get 'mentors', to:'students#mentors'
  #get '/courses/search', to: 'courses#search', as: 'search_courses'
  get 'search_courses', to: 'courses#search'
  get 'search_students', to: 'students#search'
  get "/students/confirm/:token", to: "students#confirm", as: "confirm_user"

end

