# Responsibility is to hold context of the eval of rendered templates
# Include helper methods for use in library DSL

class RubyView
  class Context
    include RubyView::Helpers::Tag, DSL
    def initialize
    end

    def call(file_path: nil, code: nil)
      return puts 'you must pass in file path or code to func' if !file_path && !code
      @_rendered_content = ""
      template_content = if file_path
        template_path = File.join(Dir.pwd, path_to_template)
        File.read(template_path)
      else
        code
      end
      instance_eval(template_content)
      @_rendered_content
    end
  end
end