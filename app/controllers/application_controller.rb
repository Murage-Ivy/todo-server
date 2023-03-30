class ApplicationController < ActionController::API
  include ApplicationController::cookies

  before_action :authorized
end
