# typed: false
# frozen_string_literal: true

class Awsesh < Formula
  desc "AWS SSO session manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.6"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.6/awsesh-darwin-x64.zip"
      sha256 "6d13b887b798e68cb023f11fc47030ab2fa9bc81feb567679e773deac9e370c9"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.6/awsesh-darwin-arm64.zip"
      sha256 "2689b2c6d41e87cdc25ce5eb9c4d535992893cd754944b88cfff083862918ed2"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.6/awsesh-linux-x64.tar.gz"
      sha256 "ec69551b317a66c69cd493b0687fc69c0c5f47bca497800269c7351e7b00fb55"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.6/awsesh-linux-arm64.tar.gz"
      sha256 "e812ad60a352b2ed665604754b17e7938570694b56f7fe9454d1711d01b76a71"
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
