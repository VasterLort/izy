class ContactMailer < ApplicationMailer
  def new_message
    @contact = params[:contact]
    mail(
      to: 'mr.vakar2016@gmail.com',
      from: @contact.email,
      subject: "Thank you #{@contact.email} for contacting us"
    )
  end
end
