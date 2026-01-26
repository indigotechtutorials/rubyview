require 'rails'

class RubyView
  class Railtie < ::Rails::Railtie
    initializer "rubyview.configure_rails_initialization" do |app|
      require "rubyview/rails_template"
    end
  end
end