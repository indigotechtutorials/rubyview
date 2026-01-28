class RubyView
  module RailsBuffering
    def output_buffer
      @_output_buffer ||= ActionView::OutputBuffer.new
    end
  end
end