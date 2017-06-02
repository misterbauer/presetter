class StaticPagesController < ApplicationController
  def home
    @contact_form = ContactForm.new
  end

  def clients
  	@title = "Clients"
  	render
  end

  def sendit
    @contact_form = ContactForm.new(params[:contact_form])
    if (@contact_form.valid?)
      @contact_form.deliver
      @status = "Sent! You'll be hearing from us soon."
    else
      @status = @contact_form.errors.full_messages[0]
    end
    render 'home'
  end

end
