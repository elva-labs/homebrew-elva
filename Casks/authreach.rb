cask "authreach" do
  version "1.0.3"
  sha256 "2fdb039b43d0480585d8930ed9421e61c15c8aff7b958dfa0f66492b4d40836d"

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
