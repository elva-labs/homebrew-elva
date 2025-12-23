# typed: false
# frozen_string_literal: true

class AwseshAlpha < Formula
  desc "AWS SSO session manager CLI (alpha)"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.0-alpha.202512230821"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-alpha.202512230821/awsesh-darwin-x64.zip"
      sha256 "6b9cc8971a6cfd174375261d3932feb748e25118a81e9a888eedabad453d16ac"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-alpha.202512230821/awsesh-darwin-arm64.zip"
      sha256 "12e600c14331712d9d55df3c9f978d8842dbb95ffac598e44109b3c33b75197e"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-alpha.202512230821/awsesh-linux-x64.tar.gz"
      sha256 "eb1b01cb9468d9beb6a730b050fd47faa75cd2cd9afae2c30139e9e03839ce4c"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-alpha.202512230821/awsesh-linux-arm64.tar.gz"
      sha256 "6482d558d998e1daff470d41820c3e98fd9a45c4c046e93b9cf503805eefcdd2"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  test do
    system "#{bin}/awsesh", "--version"
  end
end
