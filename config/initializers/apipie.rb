Apipie.configure do |config|
  # avoids appending '.en' to the path
  config.translate = false
  # avoids validating with documentation
  config.validate = false
  config.app_name                = "OnlineGameApi"
  config.api_base_url            = "/api"
  config.doc_base_url            = "/apipie"
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
  
end
