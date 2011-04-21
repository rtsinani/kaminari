require 'active_support/configurable'

module Kaminari
  # Configures global settings for Kaminari
  #   Kaminari.configure do |config|
  #     config.default_per_page = 10
  #   end
  def self.configure(&block)
    yield @config ||= Kaminari::Configuration.new
  end

  # Global settings for Kaminari
  def self.config
    @config
  end

  # need a Class for 3.0
  class Configuration #:nodoc:
    include ActiveSupport::Configurable
    config_accessor :default_per_page
    config_accessor :window
    config_accessor :outer_window
    config_accessor :left
    config_accessor :right
  end

  # this is ugly. why can't we pass the default value to config_accessor...?
  configure do |config|
    config.default_per_page = 25
    config.window = 4
    config.outer_window = 0
    config.left = 0
    config.right = 0
  end
end
