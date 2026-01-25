class RubyView
  module Helpers
    module Tag
      def h1(content, **html_opts)
        generate_tag(:h1, content, **html_opts)
      end

      def p(content, **html_opts)
        generate_tag(:p, content, **html_opts)
      end

      # Responsible for assembling HTML tag ( also for storing to rendered content variable. )
      def generate_tag(name, content, **html_opts)
        formatted_html_opts = format_html_opts(**html_opts)
        _gen_html = "<#{name}#{formatted_html_opts}>#{content}</#{name}>"
        @_rendered_content += _gen_html
        _gen_html
      end

      def format_html_opts(**html_opts)
        return "" if html_opts.empty?
        html_opts.map { |k, v| [k,v].join("=") }.join(" ")
      end
    end
  end
end