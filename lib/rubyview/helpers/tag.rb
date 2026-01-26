class RubyView
  module Helpers
    module Tag
      def h1(...); render_tag(:h1, ...); end;
      def p(...); render_tag(:p, ...); end;
      def div(...); render_tag(:div, ...); end;
      def img(image_path, **html_opts)
        url_for_image = if defined?(Rails)
          ActionController::Base.helpers.asset_path(image_path)
        else
          image_path
        end
        render_tag(:img, nil, **html_opts.merge({src: url_for_image}))
      end

      def merge_classes(classes_1, classes_2)
        (classes_1.split(" ") + classes_2.split(" ")).uniq
      end

      def render_tag(...) # for storing to rendered content variable.
        @_rendered_content += generate_tag(...)
      end
      
      def generate_tag(name, content = nil, **html_opts, &block) # for assembling HTML tag
        content = block.call if block_given?
        self_closing = [:img].include?(name)
        end_content = "#{content}</#{name}>"
        "<#{name}#{format_html_opts(**html_opts)}#{"/" if self_closing}>#{end_content if !self_closing}"
      end

      def format_html_opts(**html_opts)
        return "" if html_opts.empty?
        _html = html_opts.map { |k, v| "#{k}='#{v}'" }.join(" ")
        " " + _html # Add initial space
      end
    end
  end
end

