# frozen_string_literal: true

require_relative 'base_decorator'

# class for TrimmerDecorator
class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name.length > 10 ? @nameable.correct_name[0..9] : @nameable.correct_name
  end
end
