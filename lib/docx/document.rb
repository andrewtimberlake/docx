# -*- coding: utf-8 -*-
require 'zip'
require 'nokogiri'

module Docx
  class Document
    def initialize(path)
      @path = path
    end
    attr_reader :path

    def paragraphs
      document.xpath('//w:body/w:p')
    end

    def self.open(path)
      Document.new(path)
    end

    private
    def document
      @document ||= get_zip_entry('word/document.xml') do |entry|
        Nokogiri::XML.parse(entry.get_input_stream)
      end
    end

    def get_zip_entry(ref, &block)
      Zip::File.open(path) do |zipfile|
        entry = zipfile.find_entry(ref)
        yield entry
      end
    end
  end
end
