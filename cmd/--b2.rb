# frozen_string_literal: true
require "cli/parser"
require_relative "../auth.rb"

module Homebrew
  module_function

  def __b2_args
    Homebrew::CLI::Parser.new do
      usage_banner <<~EOS
        `--b2`

        Ensures that protected B2 resources can be downloaded properly. This
        means ensuring that the environment variables `HOMEBREW_B2_KEY_ID` and
        `HOMEBREW_B2_APPLICATION_KEY` are set.
      EOS
    end
  end

  def __b2
    __b2_args.parse
    
    Auth::ensure_env "HOMEBREW_B2_KEY_ID", :message => "B2 Key ID: "
    Auth::ensure_env "HOMEBREW_B2_APPLICATION_KEY", :message => "B2 Application Key: ", :secret => true, :stdin => true
    system "brew", *args.remaining
  end
end
