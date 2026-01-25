class RubyView
  module DSL
    def header(text, **html_opts)
      h1(text, **html_opts)
    end
  end
end