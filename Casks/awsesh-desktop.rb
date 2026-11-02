cask "awsesh-desktop" do
  version "1.4.1"
  sha256 "aeb912c7f16f0feecda920eb1a01ae1fb60bbe33e35136dff8c592e9cdfb49f3"

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
