class FilesController < ApplicationController
  def show
    file = UploadedFile.find(params[:id])
    send_file file.file.path, filename: file.file.name, disposition: 'attachment'
  end
end