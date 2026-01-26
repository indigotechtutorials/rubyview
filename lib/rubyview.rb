require "pry"
require_relative './rubyview/helpers/tag'
require_relative './rubyview/dsl'
require_relative './rubyview/context'

class RubyView
  def self.render(path_to_template)
    context = RubyView::Context.new
    context.call(file_path: path_to_template)
  end

  def self.evaluate(code)
    context = RubyView::Context.new
    context.call(code: code)
  end
end

if File.basename($0) != 'rubyview'
  require 'rubyview/railtie' if defined?(Rails::Railtie)
end
