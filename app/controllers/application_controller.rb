class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :round
  include ActionView::Helpers::NumberHelper

  def current_user
    return nil if session[:user_id].nil?
    User.find(session[:user_id])
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def ensure_that_signed_in
    redirect_to login_path, notice:'you should be signed in' if current_user.nil?
  end

  def ensure_that_admin
    if not ensure_that_signed_in
      redirect_to login_path, notice:'you must be admin user to delete' unless current_user.admin?

    end
  end

  def round(param)
    number_with_precision(param, precision: 1)
  end


end
