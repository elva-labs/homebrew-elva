cask "all-the-ports" do
  version "1.0.3"
  sha256 "5b4b860b96637b20288609600f1a16fc1721b34665c7d0cebb5b616173f8ad2f"

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
