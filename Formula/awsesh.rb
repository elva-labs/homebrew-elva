# typed: false
# frozen_string_literal: true

class Awsesh < Formula
  desc "AWS SSO session manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.7"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.7/awsesh-darwin-x64.zip"
      sha256 "c62dd2494426052aab799c5c8e64d67bd479efee8bcbce9f85e55c05f2b7fdda"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.7/awsesh-darwin-arm64.zip"
      sha256 "5b1a6436dc9b7c04fc4ebec6396d5b48f600b7cc92f5af510b8a0e221fcf81de"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.7/awsesh-linux-x64.tar.gz"
      sha256 "8f4e44bc879d06c5ca68990429a097e006755f1486e45137fab5d76beb04d4e6"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.7/awsesh-linux-arm64.tar.gz"
      sha256 "b533faf4cc782be7221e589576c12e4eede9031cdc86aedbe829116f0b2ab563"
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
