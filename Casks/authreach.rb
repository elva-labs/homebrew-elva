cask "authreach" do
  version "1.0.2"
  sha256 "bbfe2fe7336e1e1411e94eb6eb148cdedb4abe3e6099c6a8d20d3a334022da6d"

  url "https://github.com/elva-labs/authreach/releases/download/v#{version}/authreach-#{version}.zip"
  name "AuthReach"
  desc "Menu-bar app surfacing one-time passcodes from your Gmail inboxes"
  homepage "https://github.com/elva-labs/authreach"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "AuthReach.app"

  zap trash: [
    "~/Library/Application Support/AuthReach",
    "~/Library/Preferences/com.elva-labs.authreach.plist",
  ]
end
