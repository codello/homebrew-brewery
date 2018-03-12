cask 'font-yorkten' do
  version '1.0'
  sha256 '81f982760c588afb871ff2c340eac4f812aed056aa93a38882efb5fe0aad83a5'

url "https://gitlab.com/Codello/homebrew-brewery/raw/master/Resources/Yorkten/yorkten.zip?private_token=#{ENV['GITLAB_HOMEBREW_TOKEN']}"
  name 'Yorkten'
  homepage 'https://gitlab.com/Codello/homebrew-brewery/tree/master/Resources/Yorkten'

  font '*.ttf'
end
