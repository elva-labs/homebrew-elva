# typed: false
# frozen_string_literal: true

class AwseshBeta < Formula
  desc "AWS SSO session manager CLI (beta)"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.0-beta.202605041018"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202605041018/awsesh-darwin-x64.zip"
      sha256 "fbd7da9af5cf66070c8fb9c85ae01ece48d82656a103e6619560e1607fe946a3"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202605041018/awsesh-darwin-arm64.zip"
      sha256 "3726bbfca83c763b09b06ab4d0ad9b80a9ca7e09e5d58ee4abdb0e66dd29aa0c"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202605041018/awsesh-linux-x64.tar.gz"
      sha256 "957ddc8cf235b407affc5425ea6c020dd8da7e3f2d97812fc448338cb56cb029"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202605041018/awsesh-linux-arm64.tar.gz"
      sha256 "38805d703a91757d3d061187b03cd2b57671eadc03ab2f9b36da7c9bb4c6a081"
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
