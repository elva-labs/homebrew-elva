cask "sesh-bar" do
  version "1.2.0"
  sha256 "df6a4c07c3581accd471620166bfddc7ccfceaf345f477abc883797b5786653e"

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
