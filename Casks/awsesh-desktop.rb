cask "awsesh-desktop" do
  version "1.1.2"
  sha256 "095b0f2b94ff7ed068937677de419b48d812d057c65d49e9543aec46e9b7b7a4"

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
