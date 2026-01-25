# Responsibility is to hold context of the eval of rendered templates
# Include helper methods for use in library DSL

class RubyView
  class Context
    include RubyView::Helpers::Tag, DSL
    def initialize
    end

    def call(path_to_template)
      @_rendered_content = ""
      template_path = File.join(Dir.pwd, path_to_template)
      template_content = File.read(template_path)
      instance_eval(template_content)
      @_rendered_content
    end
  end
end