require "active_decorator"

module ActiveDecoratorWithDecorateAssociations
  class Decorator
    include Singleton

    def decorate(target)
      ActiveDecorator::Decorator.instance.decorate(target)
      target
    end
  end
end
