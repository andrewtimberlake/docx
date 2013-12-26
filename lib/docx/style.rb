# -*- coding: utf-8 -*-
require 'docx/document_node'

module Docx
  class Style < DocumentNode
    def name
      node['w:val']
    end
  end
end
