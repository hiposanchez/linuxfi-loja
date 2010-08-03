ActionMailer::Base.smtp_settings = {
#conexão segura exigida pelo e-mail.
  :enable_starttls_auto => true,
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "gmail.com",
  :authentication => :plain,
  :user_name => "linuxfi.ror.julho.2010@gmail.com",
  :password => "rubyonrails"
}