# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.smtp_settings = {
  address: 'smtp.sendgrid.net',
  address: smtp-mail.outlook.com,
  domain: 'outlook.com',
  port: 25, # (or 587 if 25 is blocked)
  authentication: 'plain',
  :ssl => true,
  :tsl => true,
  enable_starttls_auto: true,
  user_name: 'william.rolando88@hotmail.com',
  password: 'WASD@800452'}