require_relative "../B2DownloadStrategy.rb"

cask 'font-thesansuhh' do
  version '1.003'
  sha256 'b8c0467e09d516311094562b5d7bc41795677566423304c2c2cc50a8eaef99e7'

  url "b2:/brewery/fonts/thesansuhh-1.003.zip", :using => B2DownloadStrategy
  name 'TheSansUHH'
  homepage 'https://gitlab.com/Codello/homebrew-brewery/tree/master/Resources/TheSansUHH'

  font 'TheSansUHH Regular.ttf'
  font 'TheSansUHH Bold.ttf'
  font 'TheSansUHH Regular Italic.ttf'
  font 'TheSansUHH_TT_Bold_Caps.ttf'
  font 'TheSansUHH_TT_SemiLight_Caps.ttf'
end
