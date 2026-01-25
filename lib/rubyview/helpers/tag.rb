class RubyView
  module Helpers
    module Tag
      def h1(text, **html_opts)
        generate_tag(:h1, text, **html_opts)
      end

      def generate_tag(name, content, **html_opts)
        formatted_html_opts = format_html_opts(**html_opts)
        "<#{name}#{formatted_html_opts}>#{content}</#{name}>"
      end

      def format_html_opts(**html_opts)
        return "" if html_opts.empty?
        html_opts.map { |k, v| [k,v].join("=") }.join(" ")
      end
    end
  end
end