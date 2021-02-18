class ContactMailer < ApplicationMailer
  RECIPIENT = 'dan@citycareerlab.com'.freeze

  def notify_admin(contact)
    @contact = contact

    mail(
      to: RECIPIENT,
      subject: "You've received a new message from Citycareerlab.com"
    )
  end
end
