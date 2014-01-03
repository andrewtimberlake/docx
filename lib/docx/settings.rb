# -*- coding: utf-8 -*-
module Docx
  class Settings
    def initialize(doc)
      @doc = doc
    end

    def zoom
      @zoom ||= setting_node('./w:settings/w:zoom').attr('w:percent', 100).to_i
    end

    def default_tab_stop
      @default_tab_stop ||= setting_node('./w:settings/w:defaultTabStop').attr('w:val', 0).to_i
    end

    private
    attr_reader :doc
    def setting_node(ref)
      SettingNode.new(doc.xpath(ref).first)
    end

    class SettingNode
      def initialize(node=nil)
        @node = node
      end
      attr_reader :node

      def attr(key, default_value)
        return default_value unless node
        node[key] || default_value
      end
    end
  end
end
