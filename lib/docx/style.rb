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
      style_node = node.xpath('./w:basedOn').first
      return nil unless style_node
      style_id = style_node['w:val']
      document.styles[style_id]
    end

    [:bold?, :italic?, :font_size].each do |method_id|
      define_method method_id do
        run_properties.send(method_id)
      end
    end

    private
    def run_properties
      RunProperties.new(node.xpath('./w:rPr').first, document, nil)
    end
  end
end
