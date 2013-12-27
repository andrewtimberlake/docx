# -*- coding: utf-8 -*-
require 'docx/document_node'
require 'docx/style'

module Docx
  # bold, border, character style, color, font, font size, italic, kerning, disable spelling/grammar check, shading, small caps, strikethrough, text direction, and underline
  class RunProperties < ParagraphNode
    def style
      style_id = node.xpath('./w:rStyle').first['w:val']
      document.styles[style_id]
    end

    def bold?
      element = node.xpath('./w:b').first
      return paragraph.style.bold? unless element
      value = element['w:val']
      return false if ['false', 'off'].include?(value)
      true
    end
  end
end
