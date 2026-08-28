cask "all-the-ports" do
  version "1.0.2"
  sha256 "f1b5509fb3297c4a1ca6fb80c9f5b1f5ff4da66fc0952833cc3b8f0f7afd2045"

  url "https://github.com/elva-labs/all-the-ports/releases/download/v#{version}/all-the-ports-#{version}.zip"
  name "all the ports"
  desc "Menu-bar tool to view listening TCP ports and kill their processes"
  homepage "https://github.com/elva-labs/all-the-ports"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "all the ports.app"

  zap trash: "~/Library/Preferences/com.elva-labs.all-the-ports.plist"
end
