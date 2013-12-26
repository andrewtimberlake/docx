# -*- coding: utf-8 -*-
require 'docx/document_node'
require 'docx/style'

module Docx
  class ParagraphProperties < DocumentNode
    def style
      Style.new(node.xpath('./w:pStyle').first)
    end
  end
end
