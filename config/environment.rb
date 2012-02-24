# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
SagarpaApp::Application.initialize!
DateTime::DATE_FORMATS[:short]="short %m-%d-%Y %H:%M"
Time::DATE_FORMATS[:short] = "%H:%M"
Date::DATE_FORMATS[:short] = "short %Y-%m-%d"


