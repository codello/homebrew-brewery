# frozen_string_literal: true
require "cli/parser"
require 'readline'
require 'io/console'

def ensure_env(name, message: "", secret: false, stdin: false)
  ENV[name] = get_env(message, secret, stdin) if ENV[name].blank?
end

def get_env(message, secret, stdin)
  return $stdin.read if stdin unless $stdin.tty?
  return IO::console.getpass(message) if secret
  print message
  return IO::console.gets.chomp
end