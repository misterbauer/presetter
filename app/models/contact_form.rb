class ContactForm < MailForm::Base
  attribute :name, :presence => true,      :validate => true
  attribute :email, :presence => true,    :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

  attribute :message, :presence => true
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "My Contact Form",
      :to => "joebauer777@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end