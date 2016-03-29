require "active_decorator"

module ActiveDecoratorWithDecorateAssociations
  class Decorator
    include Singleton

    def decorate(target)
      case target
      when Array
        target.each do |t|
          ActiveDecorator::Decorator.instance.decorate(t) unless t.is_a?(ActiveDecorator::Helpers)
        end
      else
        ActiveDecorator::Decorator.instance.decorate(target) unless target.is_a?(ActiveDecorator::Helpers)
      end

      target
    end
  end
end
