# typed: false
# frozen_string_literal: true

class Awsesh < Formula
  desc "AWS SSO session manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.1.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.1.3/awsesh-darwin-x64.zip"
      sha256 "86d74a9e0603f1f6620981117442ef60a7d8d56485a97218a5356457799b677b"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.1.3/awsesh-darwin-arm64.zip"
      sha256 "5b005a1003fe00396e10973198a28b746f1f505ba57282d3cadd7833d4d6eadc"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.1.3/awsesh-linux-x64.tar.gz"
      sha256 "04acf8c812a77a33323f2ad79885880d8feb6fdcfa0ae538e932dddb65619da9"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.1.3/awsesh-linux-arm64.tar.gz"
      sha256 "aacb9701d7e55da604365dd267ac731767427e600c56dd7d5a6a89c1db7bead3"
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
