# frozen_string_literal: true

# Entire application controller.
class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordNotDestroyed, with: :record_not_destroyed

  def default_url_options
    { locale: I18n.locale }
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def record_not_found(exception)
    respond_to do |format|
      format.html { render html: exception.message+'. Please provide a valid id.', status: :not_found }
    end
  end

  def record_not_destroyed(exception)
    respond_to do |format|
      format.html { render html: exception.message+'. Please provide a valid id.', status: :not_implemented }
    end
  end

end
