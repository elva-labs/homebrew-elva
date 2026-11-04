cask "awsesh-desktop" do
  version "1.4.2"
  sha256 "fb902399ceec57596325479132a948e9ecdc4dc1ce3d979dbabf46ad881b2662"

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
