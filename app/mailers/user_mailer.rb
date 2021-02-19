class UserMailer < ActionMailer::Base
  def notify_new_file_upload(uploaded_form)
    @uploaded_form = uploaded_form

    mail to: 'matt@boats.co.uk', bcc: 'vibolteav@gmail.com', subject: "A new file has been uploaded to expert"
  end
end
