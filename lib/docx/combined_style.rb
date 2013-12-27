# -*- coding: utf-8 -*-
module Docx
  class CombinedStyle
    def initialize(run_style, paragraph_style)
      @run_style       = run_style       || NullStyle.new
      @paragraph_style = paragraph_style || NullStyle.new
    end
    attr_reader :run_style, :paragraph_style

    [:bold?, :italic?, :font_size, :font].each do |method_id|
      define_method method_id do
        run_style.send(method_id) || paragraph_style.send(method_id)
      end
    end

    class NullStyle
      def method_missing(method_id, *args, &block)
        if method_id.to_s.chomp!('?')
          false
        else
          nil
        end
      end
    end
  end
end
