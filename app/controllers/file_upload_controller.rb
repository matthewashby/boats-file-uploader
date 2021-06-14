class FileUploadController < ApplicationController
  def upload_form
    @form = UploadForm.new
  end

  def upload
    files = params.dig(:upload_form, :files)
    @form = UploadForm.new(params.require(:upload_form).permit(:name, :boat_id, :comment))
    
    if files.present? && @form.save
      files.each do |file|
        UploadedFile.create(file: file, form_id: @form.id)
      end

      render json: @form, status: :ok
    else
      render json: { error: true }, status: :ok
    end
  end
end