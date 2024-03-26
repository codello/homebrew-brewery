cask "ultrastar-deluxe" do
  version "2024.3.0"
  sha256 "73a2ca351bbdf74192d961fc517be9e2f2b1c3e0ba8f84d45bd980e5253ba0ff"

  url "https://github.com/UltraStar-Deluxe/USDX/releases/download/v2024.3.0/UltraStarDeluxe-v2024.3.0.dmg",
      verified: "github.com/UltraStar-Deluxe/USDX/"
  name "UltraStar Deluxe"
  desc "UltraStar Deluxe is an open source karaoke party game"
  homepage "https://usdx.eu/"

  livecheck do
  end

  app "UltraStarDeluxe.app"
end
