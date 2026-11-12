cask "awsesh-desktop" do
  version "1.4.3"
  sha256 "07c7782190881f340e4c117dd40176064fadc89e17de5ceb0c3f2df0091a4696"

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
