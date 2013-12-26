# -*- coding: utf-8 -*-
require 'docx/style'

module Docx
  class ParagraphProperties
    def initialize(node)
      @node = node
    end
    attr_reader :node

    def style
      Style.new(node.xpath('./w:pStyle').first)
    end
  end
end
