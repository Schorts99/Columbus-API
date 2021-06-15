# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :set_language

  def render_jsonapi_response(resource, *_options)
    if resource
      if resource.is_a?(ActiveRecord::Relation) || resource.errors.empty?
        render jsonapi: resource
      else
        render jsonapi_errors: resource.errors, status: 400
      end
    else
      render jsonapi: nil
    end
  end

  private

  def set_language
    return unless request.headers['Accept-Language'].present?

    requested_language = request.headers['Accept-Language'].scan(/^[a-z]{2}/).first.to_sym
    I18n.locale = requested_language if I18n.available_locales.include?(requested_language)
  end
end
