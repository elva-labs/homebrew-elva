# typed: false
# frozen_string_literal: true

class Awsesh < Formula
  desc "AWS SSO session manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.5/awsesh-darwin-x64.zip"
      sha256 "8750f221209d71b5a551bf2d511fd5fb95346f5a2db914d9f5699cf21b7885bc"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.5/awsesh-darwin-arm64.zip"
      sha256 "cb5f50873decdedc8e3191f66256b3ca864a6418faa28f95a56101cdbb4688a9"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.5/awsesh-linux-x64.tar.gz"
      sha256 "9f68d6b9e9826c990396866a9ed3d6d2f765f40b68328625e1825d5bb7f2c4a5"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.5/awsesh-linux-arm64.tar.gz"
      sha256 "8a59a0627f11f92a93c4b8190d0d57cccb19f368b2f9b11dd0533f6a6a4503a0"
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
