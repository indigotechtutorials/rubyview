class RubyView
  class RailsTemplate
    def call(template, source = "")
      source ||= template.source
      RubyView.evaluate(source, dump: true)
    end
  end
  ActionView::Template.register_template_handler(:view, RailsTemplate.new)
end