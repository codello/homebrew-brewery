cask "renew" do
  version "4.1"
  sha256 "39cf1bf9f23b7284939948e31672c6b842ec2a1d826270a1200293503dc8a2d6"

  url "https://www2.informatik.uni-hamburg.de/TGI/renew/#{version}/Renew-#{version}.dmg"
  name "Renew"
  desc "Renew is a Java-based multi-formalism editor and simulator that provides a flexible modeling approach based on, but not limited to, reference nets"
  homepage "https://www2.informatik.uni-hamburg.de/TGI/renew"

  depends_on cask: "temurin"

  livecheck do
    url :stable
  end

  app "Reference Net Workshop.app"
end
