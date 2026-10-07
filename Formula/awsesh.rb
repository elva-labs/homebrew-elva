# typed: false
# frozen_string_literal: true

class Awsesh < Formula
  desc "AWS SSO session manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.1.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.1.2/awsesh-darwin-x64.zip"
      sha256 "50ebdd61c05b575b8f1bd01c389139b5163e97f24f5d5fe950ed079aef752127"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.1.2/awsesh-darwin-arm64.zip"
      sha256 "9671c1ba7adfb3c24914c30d0ac0198fec4173e379cb734ec87c35238b692623"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.1.2/awsesh-linux-x64.tar.gz"
      sha256 "ab402b6b09ba19465ec3a715c3ffdcc076826e686c8e92d6b75c40a0955a6a8b"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.1.2/awsesh-linux-arm64.tar.gz"
      sha256 "5a3ad64adc7f092e913f063bfd31527a23d38c5f7de3ee870ad3d2e5e683eec7"
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
