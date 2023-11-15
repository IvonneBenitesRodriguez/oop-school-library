require_relative 'decorator'

#creating a class that inherits Decorator class features
class TrimmerDecorator < Decorator
    def correct_name
        @nameable.correct_name[0,10]
    end
end
