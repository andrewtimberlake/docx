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

        it "returns true" do
          expect(run.style.bold?).to be(true)
        end
      end

      context "when set in the paragraph style" do
        let(:run) { document.paragraphs[2].runs[0] }

        it "returns true" do
          expect(run.style.bold?).to be(true)
        end
      end

      context "when set in the run style" do
        let(:run) { document.paragraphs[3].runs[1] }

        it "returns true" do
          expect(run.style.bold?).to be(true)
        end
      end

      context "when turned off in the run" do
        let(:run) { document.paragraphs[2].runs[1] }

        it "returns false" do
          expect(run.style.bold?).to be(false)
        end
      end
    end

    context '#italic?' do
      context "when set on the run" do
        let(:run) { document.paragraphs[1].runs[3] }

        it "returns true" do
          expect(run.style.italic?).to be(true)
        end
      end

      context "when set in the paragraph style" do
        let(:run) { document.paragraphs[3].runs[0] }

        it "returns true" do
          expect(run.style.italic?).to be(true)
        end
      end

      context "when set in the run style" do
        let(:run) { document.paragraphs[2].runs[3] }

        it "returns true" do
          expect(run.style.italic?).to be(true)
        end
      end

      context "when turned off in the run" do
        let(:run) { document.paragraphs[3].runs[3] }

        it "returns false" do
          expect(run.style.italic?).to be(false)
        end
      end
    end

    context '#font_size' do
      context "when set on the run" do
        let(:run) { document.paragraphs[4].runs[3] }

        it "returns the size" do
          expect(run.style.font_size).to eq(28)
        end
      end

      context "when set in the paragraph style" do
        let(:run) { document.paragraphs[4].runs[0] }

        it "returns the size" do
          expect(run.style.font_size).to eql(32)
        end
      end

      context "when set in the run style" do
        let(:run) { document.paragraphs[4].runs[1] }

        it "returns the size" do
          expect(run.style.font_size).to eql(24)
        end
      end
    end

    context '#font' do
      context "when set on the run" do
        let(:run) { document.paragraphs[4].runs[3] }

        it "returns the font name" do
          expect(run.style.font).to eq('Times New Roman')
        end
      end

      context "when set in the paragraph style" do
        let(:run) { document.paragraphs[4].runs[0] }

        it "returns the font name" do
          expect(run.style.font).to eql('Arial')
        end
      end

      context "when set in the run style" do
        let(:run) { document.paragraphs[4].runs[1] }

        it "returns the font name" do
          expect(run.style.font).to eql('Times New Roman')
        end
      end
    end

    context "inherited styles" do
      let(:document) { Document.open(fixture('inherited_styles.docx')) }

      it "delegates the style to the 'based_on' style" do
        paragraph = document.paragraphs[1]
        style = paragraph.style
        expect(style.send(:run_properties).send(:font)).to be_nil
        expect(style.font).to eq(style.based_on.font)
      end

      it "each run correctly produces a style" do
        document.paragraphs.each do |paragraph|
          paragraph.runs.each do |run|
            expect(run.style.font).not_to be_nil
          end
        end
      end
    end
  end
end
