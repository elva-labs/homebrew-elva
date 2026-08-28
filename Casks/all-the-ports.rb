cask "all-the-ports" do
  version "1.0.1"
  sha256 "d28c7ca9549f1a55e3dc8daad883829a3c6565aaf960854d6aeb5889d7044bd2"

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

  zap trash: "~/Library/Preferences/com.kabba.all-the-ports.plist"
end
