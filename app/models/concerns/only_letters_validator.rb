# frozen_string_literal: true

class OnlyLettersValidator < ActiveModel::EachValidator
  ONLY_LETTERS_PATTERN = /^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+$/

  def validate_each(record, attribute, value)
    return if ONLY_LETTERS_PATTERN.match?(value)

    record.errors.add(attribute, :format, message: I18n.t('concerns.errors.format.only_letters'))
  end
end
