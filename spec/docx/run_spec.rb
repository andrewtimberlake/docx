# -*- coding: utf-8 -*-
require_relative '../spec_helper'
require 'docx/document'
require 'docx/document_node'
require 'docx/run'
require 'nokogiri'

module Docx
  describe Run do
    let(:document) { Document.open(fixture('styled.docx')) }

    context "#to_s" do
      let(:run) { Document.open(fixture('basic.docx')).paragraphs[2].runs.last }

      it "includes text, tabs and newlines" do
        expect(run.to_s).to eq(". \nCras at viverra dui, at aliquet est.\tClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.")
      end
    end

    context "#each_codepoint" do
      let(:run) { Document.open(fixture('basic.docx')).paragraphs[2].runs.last }

      it "returns the codepoints of all the text parts" do
        cps = []
        run.each_codepoint { |cp| cps << cp }
        expect(cps.pack('U*')).to eq(". \nCras at viverra dui, at aliquet est.\tClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.")
      end

      it "returns an enumerator if no block is given" do
        enum = run.each_codepoint
        expect(enum.next).to eq(46)
      end
    end

    context '#style' do
      let(:run) { document.paragraphs[2].runs[3] }

      context 'inherited from the paragraph' do
        it "returns the correct property" do
          expect(run.style.bold?).to be(true)
        end
      end

      context 'embeddded in the run' do
        it "returns the correct property" do
          expect(run.style.italic?).to be(true)
        end
      end
    end
  end
end
