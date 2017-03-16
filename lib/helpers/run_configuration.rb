require 'singleton'
require 'yaml'

class RunConfiguration
  include Singleton

  DEFAULT_WAIT = 15

  attr_accessor :driver, :browser, :strings
  attr_reader :language

  def load_language(lang)
    @strings = YAML::load(File.open("./config/lang/#{lang}.yml"))
  end


end