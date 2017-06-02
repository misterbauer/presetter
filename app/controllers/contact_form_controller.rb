class ContactFormController < ApplicationController
  def new
    return ContactForm.new
  end

end
