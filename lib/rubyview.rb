require 'pry'
require_relative './rubyview/helpers/tag'
require_relative './rubyview/dsl'
require_relative './rubyview/context'

class RubyView
  def self.render(path_to_template)
    context = RubyView::Context.new
    context.call(path_to_template)
  end
end