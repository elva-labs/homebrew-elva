class Awsesh < Formula
  desc "AWS Session Manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "v.0.1.11"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v.0.1.11/awsesh-darwin-amd64"
      sha256 "9bfacdfa06b5f4767c0e536627504b96e35053b556b960844ab5e29815a2d224"
    elsif Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v.0.1.11/awsesh-darwin-arm64"
      sha256 "203fe3cd933ef6e39e4510142aaa68d122f2f5a4654bae4477faf4cdc1c96d26"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v.0.1.11/awsesh-linux-amd64"
      sha256 "a5002c72b5083dcfaaabd0ed5da6b4df848e95aede9b1cb53fb4897b20a06278"
    elsif Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v.0.1.11/awsesh-linux-arm64"
      sha256 "d5ecbc048a29db28d7a3e726f457cee216b2c29f3d1e65e60a211718824eb6f9"
    end
  end

  def install
    os     = OS.mac? ? "darwin" : "linux"
    arch   = Hardware::CPU.intel? ? "amd64" : "arm64"
    binary = "awsesh-#{os}-#{arch}"

    bin.install binary => "sesh"
  end

  test do
    system "#{bin}/sesh", "--version"
  end
end
