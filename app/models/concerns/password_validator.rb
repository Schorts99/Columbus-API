# frozen_string_literal: true

class PasswordValidator < ActiveModel::EachValidator
  PASSWORD_PATTERN = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*])(?=.{8,})/

  def validate_each(record, attribute, value)
    return if PASSWORD_PATTERN.match?(value)

    record.errors.add(attribute, :format, message: I18n.t('concerns.errors.format.password'))
  end
end
