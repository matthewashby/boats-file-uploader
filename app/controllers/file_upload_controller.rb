class FileUploadController < ApplicationController
  def upload_form
    @form = UploadForm.new
  end

  def upload
    files = params.dig(:upload_form, :files)
    @form = UploadForm.new(params.require(:upload_form).permit(:name, :boat_id, :comment))

    if files.present? && @form.save
      
      files.each do |file_id|
        UploadedFile.find(file_id).update_columns(form_id: @form.id)
      end

      # UserMailer.notify_new_file_upload(@form).deliver_later
      UserMailer.notify_new_file_upload(@form).deliver_now

      redirect_to root_path, notice: 'Upload success'
    else
      render :upload_form
    end
  end

  def upload_file
    file = UploadedFile.create!(file: params[:file])

    render json: { id: file.id }, status: :ok
  end
end