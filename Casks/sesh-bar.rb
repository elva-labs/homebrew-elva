cask "sesh-bar" do
  version "1.0.1"
  sha256 "a70f953ab3bec4d9a7af188225d29c6ea3678015132f2db8e57c585f76bd4cf5"

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
