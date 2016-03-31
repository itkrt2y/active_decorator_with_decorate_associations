require "active_decorator_with_decorate_associations/decorator"

module AssociationDecorator
  def target
    ActiveDecoratorWithDecorateAssociations::Decorator.instance.decorate(owner, super)
  end
end
