cask "awsesh-desktop" do
  version "1.3.0"
  sha256 "7b29c53fedee6a1f6e62e8e994d514edc2980c7d5b88bbbc2bf6ebb634e8adde"

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
