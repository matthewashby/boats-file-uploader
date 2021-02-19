every 1.day, at: '4:30 am' do
  runner "UploadForm.auto_remove_old_files"
  runner "UploadedFile.remove_unattached_file"
end