# -*- coding: utf-8 -*-
require_relative '../spec_helper'
require 'docx/document'
require 'docx/style'

module Docx
  describe Style do
    let(:document) { Document.open(fixture('styled.docx')) }
    let(:style) { document.styles['style26'] }

    it "returns the style id" do
      expect(style.id).to eq('style26')
    end

    it "returns the style name" do
      expect(style.name).to eq('Bold Paragraph')
    end

    it "returns the inherited style" do
      expect(style.based_on).to eq(document.styles['style19'])
    end

    context '#bold?' do
      context "when set on the run" do
        let(:run) { document.paragraphs[1].runs[1] }

        it "should return true" do
          expect(run.properties.bold?).to be_true
        end
      end

      context "when set in the paragraph style" do
        let(:run) { document.paragraphs[2].runs[0] }

        it "should return true" do
          expect(run.properties.bold?).to be_true
        end
      end

      context "when set in the run style" do
        let(:run) { document.paragraphs[3].runs[1] }

        it "should return true" do
          expect(run.properties.bold?).to be_true
        end
      end

      context "when turned off in the run" do
        let(:run) { document.paragraphs[2].runs[1] }

        it "should return false" do
          expect(run.properties.bold?).to be_false
        end
      end
    end

    context '#italic?' do
      context "when set on the run" do
        let(:run) { document.paragraphs[1].runs[3] }

        it "should return true" do
          expect(run.properties.italic?).to be_true
        end
      end

      context "when set in the paragraph style" do
        let(:run) { document.paragraphs[3].runs[0] }

        it "should return true" do
          expect(run.properties.italic?).to be_true
        end
      end

      context "when set in the run style" do
        let(:run) { document.paragraphs[2].runs[3] }

        it "should return true" do
          expect(run.properties.italic?).to be_true
        end
      end

      context "when turned off in the run" do
        let(:run) { document.paragraphs[3].runs[3] }

        it "should return false" do
          expect(run.properties.italic?).to be_false
        end
      end
    end

    context '#font_size' do
      context "when set on the run" do
        let(:run) { document.paragraphs[4].runs[3] }

        it "should return true" do
          expect(run.properties.font_size).to eq(28)
        end
      end

      context "when set in the paragraph style" do
        let(:run) { document.paragraphs[4].runs[0] }

        it "should return true" do
          expect(run.properties.font_size).to eql(32)
        end
      end

      context "when set in the run style" do
        let(:run) { document.paragraphs[4].runs[1] }

        it "should return true" do
          expect(run.properties.font_size).to eql(24)
        end
      end
    end
  end
end
