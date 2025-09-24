class Awsesh < Formula
  desc "AWS Session Manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "v.0.1.9"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v.0.1.9/awsesh-darwin-amd64"
      sha256 "9106bee712ebe9c16402cbb1d70016b4474ab7362fa5ab25593dc0bc3ec2652c"
    elsif Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v.0.1.9/awsesh-darwin-arm64"
      sha256 "85f6632306e2a63ce20198dfd530ea2048dac6ce71743c0c60826419efc1f34a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v.0.1.9/awsesh-linux-amd64"
      sha256 "23dcf30a5ad783413a1d24c48eaedd5bfdebcb43b07d23891208b91085b1a1b9"
    elsif Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v.0.1.9/awsesh-linux-arm64"
      sha256 "621625a1feef475bf969ff0897fd389c4f686ea700949d1ad455c340a406340d"
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
