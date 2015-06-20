require 'bundler/setup'

require 'ostruct'

require 'minitest'
require 'minitest/rg'
require 'minitest/autorun'

require_relative '../app'

Aws.config[:stub_responses] = true
