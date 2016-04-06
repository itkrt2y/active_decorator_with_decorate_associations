require "active_decorator"
require "active_decorator_with_decorate_associations/marker"

module ActiveDecoratorWithDecorateAssociations
  class Decorator
    include Singleton

    def decorate(owner, target)
      if owner.is_a?(ActiveDecoratorWithDecorateAssociations::Marker)
        ActiveDecorator::Decorator.instance.decorate(target)
      else
        target
      end
    end
  end
end
