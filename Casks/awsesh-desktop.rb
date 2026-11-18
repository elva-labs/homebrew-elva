cask "awsesh-desktop" do
  version "1.4.5"
  sha256 "9706ad1247472a3b444f413fd01e74b579142ba05fcb612b7b3406d6e35e4271"

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
