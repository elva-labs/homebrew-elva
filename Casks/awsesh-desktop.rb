cask "awsesh-desktop" do
  version "1.3.1"
  sha256 "eafe908c233ab4955327bfb146e0653da40f88d9e8e573bea484d40fbcdbb379"

  url "https://github.com/elva-labs/awsesh/releases/download/v#{version}/awsesh-desktop-darwin-arm64.zip"
  name "Sesh"
  desc "AWS SSO session manager"
  homepage "https://github.com/elva-labs/awsesh"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Sesh.app"
end
