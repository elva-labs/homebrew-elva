cask "awsesh-desktop" do
  version "1.1.3"
  sha256 "799d5da959354f926111608456e5a1384baff65442361dfbd78cc9cd08ed2f68"

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
