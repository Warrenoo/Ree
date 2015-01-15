# coding: utf-8
require "spec_helper"

describe Ree::Route do

  context "初始化Route" do

    let(:route) { Ree::Route.new(nil, nil) }

    it "Route.url" do
      route.url = "/"
      expect(route.url).to eq("/")
    end

    it "Route.block" do
      route.block = -> { p 111 }
      expect(route.run).to eq("/")
    end
  end

end
