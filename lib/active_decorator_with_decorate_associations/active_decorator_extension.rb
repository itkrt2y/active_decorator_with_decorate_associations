# TODO remove this class when merged either of these pull requests
# https://github.com/amatsuda/active_decorator/pull/15
# https://github.com/amatsuda/active_decorator/pull/59

module ActiveDecoratorExtension
  def decorate(obj)
    return if defined?(Jbuilder) && Jbuilder === obj
    return if obj.nil?
    super
    obj
  end
end
