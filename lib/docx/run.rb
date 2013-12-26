# -*- coding: utf-8 -*-
module Docx
  class Run < DocumentNode
    def to_s
      buffer = []
      node.xpath('./w:t|w:tab|w:br').each do |node|
        case node.name
        when 't'
          buffer << node.content
        when 'tab'
          buffer << "\t"
        when 'br'
          buffer << "\n"
        else
          raise StandardError, "Unknown run element w:#{node.name}"
        end
      end
      buffer.join
    end
  end
end
