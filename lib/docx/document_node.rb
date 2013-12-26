# -*- coding: utf-8 -*-
module Docx
  class DocumentNode
    def initialize(node)
      @node = node
    end
    attr_reader :node

    def inspect
      "#<#{self.class.name}>"
    end

    def inspect_node
      node.to_s
    end
  end
end
