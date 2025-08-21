class Awsesh < Formula
  desc "AWS Session Manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "v.0.1.7"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v.0.1.7/sesh-darwin-amd64"
      sha256 "44f793d0c943be1e0f1c7f37de3bcbddc8e31f565feb72f9cdb99ba7277a841c"
    elsif Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v.0.1.7/sesh-darwin-arm64"
      sha256 "237f320e14321ed7a9afdd80f0277a213f300309df993aec7d910adca66c5714"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v.0.1.7/sesh-linux-amd64"
      sha256 "ffa40b172472310a56992fc03647827d9f292666bc1bece7db7278afeec5d382"
    elsif Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v.0.1.7/sesh-linux-arm64"
      sha256 "fc6ff47a67d193a42f8037173a0322b93350a78fb502698f97ff195f81dc2358"
    end
  end

  def install
    os     = OS.mac? ? "darwin" : "linux"
    arch   = Hardware::CPU.intel? ? "amd64" : "arm64"
    binary = "sesh-#{os}-#{arch}"

    bin.install binary => "sesh"
  end

  test do
    system "#{bin}/sesh", "--version"
  end
end
