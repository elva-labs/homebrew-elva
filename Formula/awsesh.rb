class Awsesh < Formula
  desc "AWS Session Manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v.0.1.2/sesh-darwin-amd64"
      sha256 "6ddcadc6def293451a05423d25865197c6f394e54c0e00192da090557311cd15"
    elsif Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v.0.1.2/sesh-darwin-arm64"
      sha256 "325d49803aff267acd4af7fc60fe2e79a25500378ada180557f88239d74aeaeb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v.0.1.2/sesh-linux-amd64"
      sha256 "16e466e01c07d38ab496db5665959afa5d8c0ffd3ec4c413133a48f76e3ba014"
    elsif Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v.0.1.2/sesh-linux-arm64"
      sha256 "bf5074211b32a492a061fd9f225f8e827f1f143fe54ebfa71c59a5fef31999e7"
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
