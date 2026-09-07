# typed: false
# frozen_string_literal: true

class Awsesh < Formula
  desc "AWS SSO session manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.16"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.16/awsesh-darwin-x64.zip"
      sha256 "12151296349bc4fbdc93a855cc24b0ea81e6a51f11a85ca8b99938d52a6a5e1c"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.16/awsesh-darwin-arm64.zip"
      sha256 "a79e16dad35afc5cd5bbae4c054252d5d87952c59c49facba01ae767e63a0c97"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.16/awsesh-linux-x64.tar.gz"
      sha256 "c453d7776a98932ef3b22c9550b956779d4c6870653c05c137c2fa6d406ef92a"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.16/awsesh-linux-arm64.tar.gz"
      sha256 "70f8623b034fe2936ede5fffb382463d637cdc414ec95ac59ccee1d3e2d6e26e"
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
