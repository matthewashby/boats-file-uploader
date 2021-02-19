Rails.application.routes.draw do
  root to: 'file_upload#upload_form'

  controller :file_upload do
    get :upload_form
    post :upload
    post :upload_file
  end

  resources :files, only: :show
end
