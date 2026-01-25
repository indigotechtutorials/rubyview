class RubyView
  module Helpers
    module Tag
      def h1(...); render_tag(:h1, ...); end;
      def p(...); render_tag(:p, ...); end;
      def div(...); render_tag(:div, ...); end;

      def render_tag(...) # for storing to rendered content variable.
        @_rendered_content += generate_tag(...)
      end
      
      def generate_tag(name, content, **html_opts) # for assembling HTML tag
        "<#{name}#{format_html_opts(**html_opts)}>#{content}</#{name}>"
      end

      def format_html_opts(**html_opts)
        return "" if html_opts.empty?
        html_opts.map { |k, v| [k,v].join("=") }.join(" ")
      end
    end
  end
end

