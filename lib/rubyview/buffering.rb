# Written by CHATGPT 😂 credit given IG.

class RubyView
  module Buffering
    def output_buffer
      @_output_buffer ||= +""
    end

    def concat(value)
      output_buffer << value.to_s
      nil
    end

    def capture(&block)
      old_buffer = @_output_buffer
      @_output_buffer = +""
      instance_eval(&block)
      captured = @_output_buffer
      @_output_buffer = old_buffer
      captured
    end
  end
end