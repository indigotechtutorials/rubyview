class RubyView
  module DSL
    def header(content, **html_opts)
      h1(content, **html_opts)
    end

    def text(content, **html_opts)
      p(content, **html_opts)
    end
  end
end