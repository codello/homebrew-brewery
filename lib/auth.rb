# frozen_string_literal: true
require "cli/parser"
require 'readline'
require 'io/console'

module Homebrew
  module Auth
    module_function
    def ensure_env(name, message: "", secret: false, stdin: false)
      return unless ENV[name].blank?
      ENV[name] = get_env(message, secret, stdin)
    end
    
    def get_env(message, secret, stdin)
      return STDIN.read if stdin unless STDIN.tty?
      return IO::console.getpass message if secret
      print message
      return IO::console.gets.chomp
    end
  end
end