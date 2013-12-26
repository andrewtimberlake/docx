# -*- coding: utf-8 -*-
require 'docx/document_node'
require 'docx/paragraph_properties'
require 'docx/run'

module Docx
  class Paragraph < DocumentNode
    def properties
      ParagraphProperties.new(node.xpath('./w:pPr'))
    end

    def runs
      node.xpath('./w:r').map {|node|
        Run.new(node)
      }
    end

    def to_s
      runs.map(&:to_s).join
    end
  end
end
