require "active_decorator_with_decorate_associations/decorator"

module CollectionAssociationDecorator
  # https://github.com/rails/rails/commit/03855e790de2224519f55382e3c32118be31eeff
  if Gem::Version.new(Rails.version) < Gem::Version.new("4.1")

    def first_or_last(*args)
      ActiveDecoratorWithDecorateAssociations::Decorator.instance.decorate(super)
    end

  else

    def first_nth_or_last(*args)
      ActiveDecoratorWithDecorateAssociations::Decorator.instance.decorate(super)
    end

  end
end
