cask "awsesh-desktop" do
  version "1.2.0"
  sha256 "99c7b2c99922c6f2fa7f52b8de649bd8c8d31d5bbf6bf741f2aec69c2d82ed3a"

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
