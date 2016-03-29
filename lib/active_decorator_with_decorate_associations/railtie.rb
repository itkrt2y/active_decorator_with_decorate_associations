require "rails"
require "active_decorator_with_decorate_associations/collection_association_decorator"
require "active_decorator_with_decorate_associations/association_decorator"

module ActiveDecoratorWithDecorateAssociations
  class Railtie < ::Rails::Railtie
    initializer 'active_decorator_with_decorate_associations' do
      ActiveRecord::Associations::CollectionAssociation.send :prepend, CollectionAssociationDecorator
      ActiveRecord::Associations::BelongsToAssociation.send  :prepend, AssociationDecorator
      ActiveRecord::Associations::HasOneAssociation.send     :prepend, AssociationDecorator
      ActiveRecord::Associations::HasManyAssociation.send    :prepend, AssociationDecorator
      # https://github.com/rails/rails/commit/5864b9a894a784aea3500d7b72ab78b6f23c6fe9
      if Gem::Version.new(Rails.version) < Gem::Version.new("4.1")
        ActiveRecord::Associations::HasAndBelongsToManyAssociation.send :prepend, AssociationDecorator
      end
    end
  end
end