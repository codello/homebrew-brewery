cask 'fullcontrol' do
  version '3.1.9'
  sha256 'e9c27969e7abf493ff9cb0ec0300cd19fff3b6303502b7dc9e984199b29cdda8'

  url 'https://fullcontrol.cescobaz.com/download/Mac/3.1.9/FullControlHelper_3.1.9.dmg'
  name 'FullControl'
  homepage 'https://fullcontrol.cescobaz.com'

  app 'FullControlHelper.app'
  zap trash: [
               '~/Library/Application Support/com.cescobaz.FullControlHelper',
               '~/Library/Caches/com.cescobaz.FullControlHelper',
               '~/Library/Preferences/com.cescobaz.FullControlHelper.plist',
             ]
end
