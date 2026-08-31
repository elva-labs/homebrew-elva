cask "authreach" do
  version "1.0.1"
  sha256 "46ea78780d6d9504c5281d170e8e1c65e8f692d667be301df854bba9b1dfd72e"

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
