# -*- coding: utf-8 -*-
module Docx
  class NullStyle
    def method_missing(method_id, *args, &block)
      if method_id.to_s.chomp!('?')
        false
      else
        nil
      end
    end
  end
end
