class Awsesh < Formula
  desc "AWS Session Manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v.0.1.5/sesh-darwin-amd64"
      sha256 "5374cf292c927031f35531aa5debc1574774f95bb679898c7e3a42545eed9919"
    elsif Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v.0.1.5/sesh-darwin-arm64"
      sha256 "e94645d632c4ff8463511f9b1636c111efb2edbe9b2eae06296f6a0fa5a1a3d9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v.0.1.5/sesh-linux-amd64"
      sha256 "383051273fd9f201bd9ef6d827e18b0651bb2803d70844a41445ddfa484a224b"
    elsif Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v.0.1.5/sesh-linux-arm64"
      sha256 "531f45c7a0f9a4520897cc3841cc4457c613ed573725152fda904599fc2175ff"
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
