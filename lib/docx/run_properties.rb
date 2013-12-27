# -*- coding: utf-8 -*-
require 'docx/document_node'
require 'docx/combined_style'
require 'docx/style'

module Docx
  # bold, border, character style, color, font, font size, italic, kerning, disable spelling/grammar check, shading, small caps, strikethrough, text direction, and underline
  class RunProperties < ParagraphNode
    def style
      @style ||= begin
                   style_node = node.xpath('./w:rStyle').first
                   run_style = if style_node
                                 style_id = style_node['w:val']
                                 document.styles[style_id]
                               end
                   paragraph_style = if paragraph
                                       paragraph.style
                                     end
                 end
      CombinedStyle.new(run_style, paragraph_style)
    end

    def bold?
      switchable_value('./w:b', :bold?)
    end

    def italic?
      switchable_value('./w:i', :italic?)
    end

    def font_size
      element = node.xpath('./w:sz').first
      if element
        element['w:val'].to_i
      else
        style.send(:font_size)
      end
    end

    private
    def switchable_value(ref, method_id)
      element = node.xpath(ref).first
      if element
        value = element['w:val']
        return false if ['0', 'false', 'off'].include?(value)
        true
      else
        style.send(method_id)
      end
    end
  end
end
