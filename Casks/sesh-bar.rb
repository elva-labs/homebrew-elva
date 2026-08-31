cask "sesh-bar" do
  version "1.1.1"
  sha256 "14f2f30f2cfa4f72cf07db7ab1afba2427006cd8b7910792cb9f79686342c408"

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
