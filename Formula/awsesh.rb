# typed: false
# frozen_string_literal: true

class Awsesh < Formula
  desc "AWS SSO session manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.4.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.4.0/awsesh-darwin-x64.zip"
      sha256 "8fae4aadb89a552d470f1ad42c90068767cebdc3276a5063e3f0d44d3c5fc623"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.4.0/awsesh-darwin-arm64.zip"
      sha256 "c97c29c58dedc925d18d9f32fbaf3d64b822ad801894514604298ce3fbaf0a1d"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.4.0/awsesh-linux-x64.tar.gz"
      sha256 "2d05701bbc131fce219ab0a8b1eed67589ea941c254a7837d54b00316d175147"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.4.0/awsesh-linux-arm64.tar.gz"
      sha256 "9a2a85b3a4076c824b9cc87bc5a99e0da28b399463cc41fb06ee5f38f24802bd"
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
