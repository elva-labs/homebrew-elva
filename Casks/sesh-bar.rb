cask "sesh-bar" do
  version "1.0.0"
  sha256 "f8a0437c31e279ff14a22c8ebf5c68c0f9dc36ba40988474589990fb469805e4"

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
