# coding: utf-8
require "rack"
require "./utils/request"
require "./utils/response"
require "./route"

module Ree

  class Base
    attr_accessor :params, :request

    def initialize(app = nil)
      @app = app
    end

    def self.call(env)
      new._call(env)
    end

    def _call(env)

      @request  = Request.new(env)
      @params   = @request.params

      # 查找route
      @response = make_routes(request)

      @response.finish
    end

    def make_routes(request)

      route = self.class.routes.find do |r|
        r.meet?(request)
      end

      if route
        route.run
      else
        Response.build [404, {"Content-Type" => "text/html"}, ["没有当前页面"]]
      end
    end


    class << self
      attr_accessor :routes

      def get( path,    options = [], &block ) route path, "get",    options, &block end
      def put( path,    options = [], &block ) route path, "put",    options, &block end
      def post( path,   options = [], &block ) route path, "post",   options, &block end
      def delete( path, options = [], &block ) route path, "delete", options, &block end

      def route(path, type, options = [], &block)
        @routes ||= []
        @routes << Ree::Route.new(path, type, options, &block)
      end

    end

  end

  class Application < Base
  end


  module Delegator
    def self.delegate(*methods)
      methods.each do |method_name|
        define_method(method_name) do |*args, &block|
          return super(*args, &block) if respond_to? method_name
          Application.send(method_name, *args, &block)
        end
        private method_name
      end
    end

    delegate :get, :put, :post, :delete, :route
  end
end


