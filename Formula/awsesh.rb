# typed: false
# frozen_string_literal: true

class Awsesh < Formula
  desc "AWS SSO session manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.14"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.14/awsesh-darwin-x64.zip"
      sha256 "f4994212f1aaf4c05feab80aa47b165d2465ac8b921592597281537bb520bcfd"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.14/awsesh-darwin-arm64.zip"
      sha256 "a3af4f675d1846adb6a2e2f4219b824b5d895fd1a94b4e2a224047d392943627"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.14/awsesh-linux-x64.tar.gz"
      sha256 "a9e3c7c1e1a3b412135352976e253296e12eeb2d824fe3f6d9c824d4dfc70dac"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.14/awsesh-linux-arm64.tar.gz"
      sha256 "dcc070639c95ddaf2e45a00aa85bc0ec5e36b976fecc9b9f91ce693b4593d9cb"
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
