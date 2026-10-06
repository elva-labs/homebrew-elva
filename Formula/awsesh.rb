# typed: false
# frozen_string_literal: true

class Awsesh < Formula
  desc "AWS SSO session manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.19"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.19/awsesh-darwin-x64.zip"
      sha256 "b34ee0bf6c03e61cc34bbff2391fb0e536fc4b235fc2c3fb7a2ecf71851d42b2"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.19/awsesh-darwin-arm64.zip"
      sha256 "844e0ba57f6f424b5967d160ab9c009a710e28d8bd2d484406e706cbbdd7a2cc"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.19/awsesh-linux-x64.tar.gz"
      sha256 "46f22613f2d83a94aa4f00e56c7e9bed41d845992fce450fe05b3870af9425a2"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.19/awsesh-linux-arm64.tar.gz"
      sha256 "f63d88282ab95eb0f29db42fdbfb90f40ca8187f8b0d576698d22b167b972b3f"
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
