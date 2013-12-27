# -*- coding: utf-8 -*-
require 'docx/document_node'
require 'docx/run_properties'

module Docx
  class Style < DocumentNode
    def id
      node['w:styleId']
    end

    def name
      node.xpath('./w:name').first['w:val']
    end

    def based_on
      style_id = node.xpath('./w:basedOn').first['w:val']
      document.styles[style_id]
    end

    def bold?
      run_properties.bold?
    end

    private
    def run_properties
      RunProperties.new(node.xpath('./w:rPr').first, document, nil)
    end
  end
end
