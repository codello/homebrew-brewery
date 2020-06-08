cask "m4vgear" do
  version "4.3.8"
  sha256 "dc17bed490803780cf8c30ab01cb13dca56a886e61d2da3391886e3e129797b0"

  url "https://www.m4vgear.com/m4vgear.dmg"
  name "M4VGear"
  homepage "http://www.m4vgear.de"

  app "M4VGear.app"
  zap trash: [
               "~/Library/Application Support/M4VGear",
               "~/Library/Caches/com.m4vgear.converter",
               "~/Library/Preferences/com.m4vgear.converter.plist",
               "~/Library/Saved Application State/com.m4vgear.converter.savedState",
             ]
end
