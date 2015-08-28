# -*- coding: utf-8 -*-
require_relative '../spec_helper'
require 'docx/document'
require 'docx/run_properties'

module Docx
  describe RunProperties do
    let(:document) { Document.open(fixture('styled.docx')) }

    context '#bold?' do
      let(:paragraph) { nil }
      let(:properties) { RunProperties.new(node, document, paragraph) }

      context "for an direct property" do
        let(:node) { document.styles['style26'].node.xpath('./w:rPr').first }

        it "should return true" do
          expect(properties.bold?).to be(true)
        end
      end

      context "for an inherited property" do
        let(:paragraph) { document.paragraphs[2] }
        let(:node) { paragraph.runs[0].node.xpath('./w:rPr').first }

        it "should return true" do
          expect(properties.bold?).to be(true)
        end
      end

      context "for a switched off (inherited) property" do
        let(:paragraph) { document.paragraphs[2] }
        let(:node) { paragraph.runs[1].node.xpath('./w:rPr').first }

        it "should return false" do
          expect(properties.bold?).to be(false)
        end
      end
    end
  end
end
