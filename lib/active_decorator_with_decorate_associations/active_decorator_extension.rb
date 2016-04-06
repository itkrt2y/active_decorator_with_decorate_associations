# TODO remove this class when merged either of these pull requests
# https://github.com/amatsuda/active_decorator/pull/15
# https://github.com/amatsuda/active_decorator/pull/59

require "active_decorator_with_decorate_associations/marker"

module ActiveDecoratorExtension
  def decorate(obj)
    return if defined?(Jbuilder) && Jbuilder === obj
    return if obj.nil?

    super

    obj.extend ActiveDecoratorWithDecorateAssociations::Marker if obj.is_a?(ActiveRecord::Base)
    obj
  end
end
