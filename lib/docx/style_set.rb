# -*- coding: utf-8 -*-
module Docx
  class StyleSet
    def initialize
      @styles = {}
    end

    def <<(style)
      @styles[style.id] = style
    end

    def first
      @styles.values.first
    end

    def size
      @styles.size
    end

    def [](id)
      @styles[id]
    end

    def each(&block)
      @styles.each do |id, style|
        yield style
      end
    end
  end
end
