class ApplicationController < ActionController::Base
  def root
    render plain: 'hello'
  end
end
