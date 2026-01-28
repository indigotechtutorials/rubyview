class RubyView
  class RailsTemplate
    def call(template, source = "")
      source ||= template.source
      <<~RUBY
        ctx = RubyView::Context.new
        ctx.instance_eval(#{source.dump}, #{template.identifier.dump})
        ctx.output_buffer
      RUBY
    end
  end
  ActionView::Template.register_template_handler(:view, RailsTemplate.new)
end