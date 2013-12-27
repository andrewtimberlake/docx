# -*- coding: utf-8 -*-
require 'zip'
require 'nokogiri'
require 'docx/paragraph'
require 'docx/style'
require 'docx/style_set'

module Docx
  class Document
    def initialize(path)
      @path = path
    end
    attr_reader :path

    def paragraphs
      document.xpath('//w:body/w:p').map {|node|
        Paragraph.new(node, self)
      }
    end

    def styles
      @styles ||= begin
                    styles = StyleSet.new
                    style_document.xpath('//w:style').map {|node|
                      styles << Style.new(node, self)
                    }
                    styles
                  end
    end

    def self.open(path)
      Document.new(path)
    end

    private
    def document
      @document ||= zipped_document('word/document.xml')
    end

    def style_document
      @style_document ||= zipped_document('word/styles.xml')
    end

    def zipped_document(ref)
      get_zip_entry(ref) do |entry|
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
