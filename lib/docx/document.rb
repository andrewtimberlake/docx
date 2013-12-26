# -*- coding: utf-8 -*-
module Docx
  class Document
    def initialize(path)
    end

    def self.open(path)
      Document.new(path)
    end
  end
end
