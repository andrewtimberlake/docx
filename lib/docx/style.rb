# -*- coding: utf-8 -*-
module Docx
  class Style
    def initialize(node)
      @node = node
    end
    attr_reader :node

    def name
      node['w:val']
    end
  end
end
