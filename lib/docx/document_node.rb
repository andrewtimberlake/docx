# -*- coding: utf-8 -*-
module Docx
  class DocumentNode
    def initialize(node, document)
      @node = node
      @document = document
    end
    attr_reader :node

    def inspect
      "#<#{self.class.name}>"
    end

    def inspect_node
      node.to_s
    end

    private
    attr_reader :document
  end
end
