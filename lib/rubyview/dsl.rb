class RubyView
  module DSL
    def header(...); h1(...); end;
    def text(...); p(...); end;
    def container(...); div(...); end;
    def image(...); img(...); end;
  end
end