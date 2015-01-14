# coding: utf-8
require "./base"
extend Ree::Delegator

class Rack::Builder
  include Ree::Delegator
end
