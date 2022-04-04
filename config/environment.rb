# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  domain: 'gmail.com',
  port: 465, # (or 587 if 25 is blocked)
  authentication: 'plain',
  :ssl => true,
  :tsl => true,
  enable_starttls_auto: true,
  user_name: 'ror.development.wr88@gmail.com',
  password: 'QaZwSx123456'}