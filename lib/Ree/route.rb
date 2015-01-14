# coding: utf-8

module Ree
  class Route
    attr_accessor :url, :type, :block, :conds

    def initialize(url, type, *conds, &block)
      @url   = url
      @type  = type
      @conds = conds
      @block = block
    end

    def meet?(request)
      url == request.path_info.downcase       &&
      type == request.request_method.downcase &&
      conds.inject(true) {|a,e| a && (e.respond_to?(:call)? e.call : true) }
    end

    def run
      block.call
    end

  end
end
