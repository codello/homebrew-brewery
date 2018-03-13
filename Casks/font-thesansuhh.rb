cask 'font-thesansuhh' do
  version '1.003'
  sha256 'b8c0467e09d516311094562b5d7bc41795677566423304c2c2cc50a8eaef99e7'

  url "https://gitlab.com/Codello/homebrew-brewery/uploads/227dce96d22d2e190d51e419c17d049f/TheSansUHH_TTF_v1.003.zip?private_token=#{File.open(ENV['HOME'] + '/.gitlab-homebrew-token', 'rb') { |f| f.read }}"
  name 'TheSansUHH'
  homepage 'https://gitlab.com/Codello/homebrew-brewery/tree/master/Resources/TheSansUHH'

  font 'TheSansUHH Regular.ttf'
  font 'TheSansUHH Regular Italic.ttf'
  font 'TheSansUHH_TT_Bold_Caps.ttf'
  font 'TheSansUHH_TT_SemiLight_Caps.ttf'
end
