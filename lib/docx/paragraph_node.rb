# -*- coding: utf-8 -*-
module Docx
  class ParagraphNode < DocumentNode
    def initialize(node, document, paragraph)
      super(node, document)
      @paragraph = paragraph
    end

    private
    attr_reader :paragraph
  end
end
