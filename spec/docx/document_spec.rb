# -*- coding: utf-8 -*-
require_relative '../spec_helper'
require 'docx/document'

module Docx
  describe Document do
    it "opens and returns a document instance" do
      document = Document.open(fixture('basic.docx'))
      expect(document).to be_a(Document)
    end

    let(:document) { Document.open(fixture('basic.docx')) }

    context '.paragraphs' do
      it "returns the correct number of paragraphs" do
        expect(document.paragraphs.size).to eq(11)
        expect(document.paragraphs.first).to be_a(Paragraph)
      end
    end

    context '.styles' do
      it "returns the correct number of styles" do
        expect(document.styles.size).to eq(6)
        expect(document.styles.first).to be_a(Style)
      end
    end
  end
end
