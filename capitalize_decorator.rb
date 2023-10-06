require_relative 'base_decorator'

# class for CapitalizeDecorator
class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
