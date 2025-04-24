class Awsesh < Formula
  desc "AWS Session Manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v.0.1.3/sesh-darwin-amd64"
      sha256 "b91cd82500a681f23ff90f46d3f30fa25a7015c469863b6fbd338340214a18a4"
    elsif Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v.0.1.3/sesh-darwin-arm64"
      sha256 "5f4e65cb871172d81ff0d19d770c464ef97db2b3dac80380986ee5c39c7a39ae"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v.0.1.3/sesh-linux-amd64"
      sha256 "f4acb1eb96fe64a9f9d3f5f3fb9bb0d775d950be3d5d19b79a44d3b9d1bf6f7b"
    elsif Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v.0.1.3/sesh-linux-arm64"
      sha256 "c080a85d7a3975677d2297ffd5ce72ac932e1979b289ae7ab3aa232e4952b4b2"
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
