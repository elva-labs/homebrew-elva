cask "authreach" do
  version "1.0.0"
  sha256 "bf75cde0ec5461340ef17442a3109fcfd969e91b94f7092a78d6064a51b4ba8e"

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
