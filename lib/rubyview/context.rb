# Responsibility is to hold context of the eval of rendered templates
# Include helper methods for use in library DSL

class RubyView
  class Context
    include RubyView::Helpers::Tag, DSL, Helpers
    include RubyView::Buffering
    if defined?(Rails)
      include RubyView::RailsBuffering
      include ActionView::Helpers::FormHelper
      include ActionView::Helpers::CaptureHelper
    end

    def initialize
    end

    def call(file_path: nil, code: nil)
      return puts 'you must pass in file path or code to func' if !file_path && !code
      template_content = if file_path
        template_path = File.join(Dir.pwd, file_path)
        File.read(template_path)
      else
        code
      end
      instance_eval(template_content)
      output_buffer
    end
  end
end