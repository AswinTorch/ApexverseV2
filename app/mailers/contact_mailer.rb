# Change how the subject line of the message sent to us
class ContactMailer < ActionMailer::Base
  default to: 'aswintorch@gmail.com'
  def contact_email(name, email, body)
    @name = name
    @email = email
    @body = body
    mail(from: email, subject: 'Contact Form Message')
  end
end
