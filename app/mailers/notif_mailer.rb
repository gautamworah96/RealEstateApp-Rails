class NotifMailer < ApplicationMailer
  def sample_email(user,sender)
    @user = user
    @sender=sender
    puts("entered sample email #{@user.email}")
    subject_string="You have a new message from #{@sender.name}. Check HouseHunter portal"
    puts("subject is "+subject_string)
    mail(to: @user.email, subject: subject_string)
  end
end
