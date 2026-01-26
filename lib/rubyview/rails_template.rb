class RubyView
  class RailsTemplate
    def call(template, source = "")
      source ||= template.source
      _render = RubyView.evaluate(source)
      _render.dump
    end
  end
  ActionView::Template.register_template_handler(:view, RailsTemplate.new)
end