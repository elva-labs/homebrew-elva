class Awsesh < Formula
  desc "AWS Session Manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "v.0.1.8"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v.0.1.8/awsesh-darwin-amd64"
      sha256 "7be40081ba89f83afa16459a8f177e2cee2dcae21a3cea783ae4b28f3e8fd63b"
    elsif Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v.0.1.8/awsesh-darwin-arm64"
      sha256 "bb692a4b009c911d64dee0e3a80d57e9caabc03a70ad1ffa3b8bff8d7ae0dd04"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v.0.1.8/awsesh-linux-amd64"
      sha256 "59b778651bb60ae915a16e86a19c5ae26f10a4cf85ef8f3d33a7c0a729d4bc7d"
    elsif Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v.0.1.8/awsesh-linux-arm64"
      sha256 "d48b23b513991d9e25e89fdf91d3aed828e6ce33da6983e4bd2602e44acd4ed9"
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
