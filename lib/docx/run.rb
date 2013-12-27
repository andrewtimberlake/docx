# -*- coding: utf-8 -*-
require 'docx/paragraph_node'

module Docx
  class Run < ParagraphNode
    def style
      RunProperties.new(node.xpath('./w:rPr').first, document, paragraph)
    end

    def to_s
      buffer = []
      each_text_part do |text|
        buffer << text
      end
      buffer.join
    end

    def each_codepoint(&block)
      each_text_part do |text|
        text.each_codepoint(&block)
      end
    end

    private
    def each_text_part(&block)
      node.xpath('./w:t|w:tab|w:br').each do |node|
        case node.name
        when 't'
          yield node.content
        when 'tab'
          yield "\t"
        when 'br'
          yield "\n"
        end
      end
    end
  end
end
