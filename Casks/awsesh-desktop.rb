cask "awsesh-desktop" do
  version "1.5.0"
  sha256 "81cba544853e701e7c80faac577ad7ba12f5cf9065c26bfa765e0f857c6da0a2"

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
