cask "awsesh-desktop" do
  version "1.4.0"
  sha256 "bb4af16fd6d78d6bd36784a7bb6bb7fcca76c6d371155877ec08ab3d30c09285"

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
