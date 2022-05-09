class ContactsController < ApplicationController
  def create
    @contact = Contact.new(post_params)
    if @contact.save
      redirect_to root_path, flash: { success: 'Message sent!' }
      message = ContactMailer.with(contact: @contact).new_message
      message.deliver
    else
      redirect_to root_path, flash: { alert: 'Could not send message' }
    end
  end

  private

  def post_params
    params.permit(:email, :message)
  end
end
