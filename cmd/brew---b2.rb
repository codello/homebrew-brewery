# frozen_string_literal: true

require "cli/parser"
require_relative "../lib/auth"
#: `--b2`
#:
#: Ensures that protected B2 resources can be downloaded properly.
#: This means ensuring that the environment variables
#: `HOMEBREW_B2_KEY_ID` and `HOMEBREW_B2_APPLICATION_KEY` are set.

ensure_env("HOMEBREW_B2_KEY_ID", message: "Enter B2 Key ID: ")
ensure_env("HOMEBREW_B2_APPLICATION_KEY", message: "Enter B2 Application Key: ", secret: true, stdin: true)
system "brew", *ARGV
