class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :store_current_user!
  after_action :clear_current_user!

  private

  def store_current_user!
    Thread.current[:current_user] = current_user
  end

  def clear_current_user!
    Thread.current[:current_user] = nil
  end

  def check_admin!
    return if current_user && current_user.admin?

    flash[:banner_error] = "This page is only accessible by an administrator."
    redirect_to home_path
  end

  def process_errors(object)
    return unless object&.errors&.messages

    object.errors.messages.each do |tag, message|
      flash[tag] = message.each_with_object([]) do |content, memo|
        memo << "#{tag} #{content}".humanize
      end
    end
  end
end
