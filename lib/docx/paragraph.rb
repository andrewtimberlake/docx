# -*- coding: utf-8 -*-
require 'docx/document_node'
require 'docx/paragraph_properties'
require 'docx/run'

module Docx
  class Paragraph < DocumentNode
    def properties
      ParagraphProperties.new(node.xpath('./w:pPr').first, document, self)
    end

    def style
      properties.style
    end

    def runs
      node.xpath('./w:r').map {|node|
        Run.new(node, document, self)
      }
    end

    def to_s
      runs.map(&:to_s).join
    end
  end
end
