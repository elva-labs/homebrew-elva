# typed: false
# frozen_string_literal: true

class Awsesh < Formula
  desc "AWS SSO session manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.4.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.4.4/awsesh-darwin-x64.zip"
      sha256 "ce3f9ad42fb62ba4a32bcc0560913de43610fdc261013e349f9c7f49826964b8"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.4.4/awsesh-darwin-arm64.zip"
      sha256 "77917f9060925eec5d9e3f2711ffc71b2091f809b1d1e1d272023162a85ee6d7"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.4.4/awsesh-linux-x64.tar.gz"
      sha256 "c7e9e24a2085540e0dd1c060e5a5bdf89472422e2c747d61f4bc5373173087d9"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.4.4/awsesh-linux-arm64.tar.gz"
      sha256 "1c57b37c1b930486287d8d40345805dffb44059814fe72298d1ada9414730449"
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
