class Notifier < ActionMailer::Base
  

  def welcome(user, sent_at = Time.now)
    subject    'Welcome!'
    recipients user.email
    from       'info@example.com'
    sent_on    sent_at
    body       :user => user
  end
  def confirm_email!
    Notifier.deliver_welcome(self)
    super
  end


end
