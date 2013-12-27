# -*- coding: utf-8 -*-
require 'docx/paragraph_node'
require 'docx/style'

module Docx
  class ParagraphProperties < ParagraphNode
    def style
      style_id = node.xpath('./w:pStyle').first['w:val']
      document.styles[style_id]
    end
  end
end
