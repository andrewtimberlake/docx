# -*- coding: utf-8 -*-
require_relative '../spec_helper'
require 'docx/document'
require 'docx/style'

module Docx
  describe Style do
    let(:document) { Document.open(fixture('styled.docx')) }
    let(:style) { document.styles['style23'] }

    it "returns the style id" do
      expect(style.id).to eq('style23')
    end

    it "returns the style name" do
      expect(style.name).to eq('Bold Paragraph')
    end

    it "returns the inherited style" do
      expect(style.based_on).to eq(document.styles['style16'])
    end

    context 'bold?' do
      it "returns true if bold is set" do
        expect(style.bold?).to be_true
      end
    end
  end
end
