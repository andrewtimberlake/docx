# -*- coding: utf-8 -*-
require_relative '../spec_helper'
require 'docx/document'
require 'docx/paragraph'

module Docx
  describe Paragraph do
    let(:document) { Document.open(fixture('basic.docx')) }
    let(:paragraph) { document.paragraphs[2] }

    it "has properties" do
      expect(paragraph.properties.style.name).to eq('style0')
    end
  end
end
