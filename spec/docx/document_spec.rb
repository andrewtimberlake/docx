# -*- coding: utf-8 -*-
require_relative '../spec_helper'
require 'docx/document'

module Docx
  describe Document do
    it "opens and returns a document instance" do
      document = Document.open(fixture('basic.docx'))
      expect(document).to be_a(Document)
    end
  end
end
