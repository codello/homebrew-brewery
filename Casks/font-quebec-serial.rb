require_relative "../B2DownloadStrategy.rb"

cask 'font-quebec-serial' do
  version '1.0'
  sha256 '351871cbc4530bc2653d0d0b45afae911430880a93f97cc1ea7a50471efb365e'

  url "b2:/brewery/fonts/quebec-serial.zip", :using => B2DownloadStrategy
  name 'Quebec Serial'
  homepage 'https://gitlab.com/Codello/homebrew-brewery/'

  font 'quebec-serial-black-regular.ttf'
  font 'quebec-serial-bold.ttf'
  font 'quebec-serial-extrabold-regular.ttf'
  font 'quebec-serial-heavy-regular.ttf'
  font 'quebec-serial-light-regular.ttf'
  font 'quebec-serial-medium-regular.ttf'
  font 'quebec-serial-regulardb.ttf'
end
