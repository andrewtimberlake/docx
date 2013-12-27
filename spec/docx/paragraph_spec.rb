# -*- coding: utf-8 -*-
require_relative '../spec_helper'
require 'docx/document'
require 'docx/paragraph'

module Docx
  describe Paragraph do
    let(:document) { Document.open(fixture('basic.docx')) }
    let(:paragraph) { document.paragraphs[2] }

    it "has properties" do
      expect(paragraph.properties.style.id).to eq('style0')
    end

    it "has runs" do
      expect(paragraph.runs.size).to eq(7)
    end

    context ".to_s" do
      it "returns the text of the paragraph" do
        expect(paragraph.to_s).to eq("\tVestibulum nec diam suscipit, tempus sapien eget, semper ipsum. \nCras at viverra dui, at aliquet est.\tClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.")
      end
    end
  end
end
