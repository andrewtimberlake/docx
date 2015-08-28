# -*- coding: utf-8 -*-
require 'docx/paragraph_node'
require 'docx/style'

module Docx
  class ParagraphProperties < ParagraphNode
    def style
      unless style_nodes.empty?
        style_id = style_nodes.first['w:val']
        document.styles[style_id]
      end
    end

    private
    def style_nodes
      node.xpath('./w:pStyle')
    end
  end
end
