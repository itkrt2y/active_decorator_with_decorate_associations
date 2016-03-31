require "active_decorator"

module ActiveDecoratorWithDecorateAssociations
  class Decorator
    include Singleton

    def decorate(owner, target)
      if owner.is_a?(ActiveDecorator::Helpers)
        ActiveDecorator::Decorator.instance.decorate(target)
      else
        target
      end
    end
  end
end
