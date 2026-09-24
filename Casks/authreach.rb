cask "authreach" do
  version "1.1.0"
  sha256 "f16d8bb0bcfe4deddbd053eb42ff571a980e18daad7e586d6b817537bc1912b7"

  url "https://github.com/elva-labs/authreach/releases/download/v#{version}/authreach-#{version}.zip"
  name "AuthReach"
  desc "Menu-bar app surfacing one-time passcodes from your Gmail and IMAP inboxes"
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
