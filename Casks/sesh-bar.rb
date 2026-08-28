cask "sesh-bar" do
  version "1.1.0"
  sha256 "d27efafd09b745788d995c5b9a3ac08f1ae7c12df7f13910d8dac5c57f3a671d"

  url "https://github.com/elva-labs/sesh-bar/releases/download/v#{version}/sesh-bar-#{version}.zip"
  name "sesh-bar"
  desc "Menu-bar switcher for AWS SSO accounts and roles"
  homepage "https://github.com/elva-labs/sesh-bar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "sesh-bar.app"

  zap trash: [
    "~/Library/Application Support/sesh-bar",
    "~/Library/Preferences/com.elva-labs.sesh-bar.plist",
  ]
end
