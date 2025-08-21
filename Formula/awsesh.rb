class Awsesh < Formula
  desc "AWS Session Manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v.0.1.6/sesh-darwin-amd64"
      sha256 "4910c9179a1f98c562f02e0b2e1c5647f0779b4e5487a5d61d5fd5a2d6267306"
    elsif Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v.0.1.6/sesh-darwin-arm64"
      sha256 "89c6c3bab765aaa2211b531b1a5d9bda5a0be7974e32d19a5f732831d4dfdc26"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v.0.1.6/sesh-linux-amd64"
      sha256 "9c7e3177cfaeb5f77ab3150d3cae09367d239c1b472221b01043d6ebc6480a37"
    elsif Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v.0.1.6/sesh-linux-arm64"
      sha256 "6a10d26ba1c37b28e20bf6b21e3a9fe20223f23eab94b93a4576f4b3728048b3"
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
