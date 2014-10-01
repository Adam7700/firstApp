class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  include LoginsHelper
>>>>>>> ef60c24e0794212e4c4adff421f0c59dcc26805b
end
