# -*- coding: utf-8 -*-
require 'docx/paragraph_properties'

module Docx
  class Paragraph
    def initialize(node)
      @node = node
    end
    attr_reader :node

    def properties
      ParagraphProperties.new(node.xpath('./w:pPr'))
    end
  end
end
