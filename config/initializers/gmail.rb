Rails.application.config.action_mailer.delivery_method = :smtp
Rails.application.config.action_mailer.smtp_settings = {
  address: 'smtp.gmail.com',
  port: 587,
  user_name: '', #OJO, borrar y usar env vars!!!
  password: '', #OJO, borrar y usar env vars!!!
  authentication: :plain,
  enable_starttls_auto: true
}
