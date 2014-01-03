# -*- coding: utf-8 -*-
require 'spec_helper'
require 'docx/document'

module Docx
  describe Settings do
    let(:document) { Document.open(fixture('basic.docx')) }
    let(:settings) { document.settings }

    context '.zoom' do
      it "returns the zoom" do
        expect(settings.zoom).to eq(100)
      end
    end

    context '.default_tab_stop' do
      it "returns the default tab stop" do
        expect(settings.default_tab_stop).to eq(709)
      end
    end

  end
end
