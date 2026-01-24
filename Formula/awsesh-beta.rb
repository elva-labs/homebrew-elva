# typed: false
# frozen_string_literal: true

class AwseshBeta < Formula
  desc "AWS SSO session manager CLI (beta)"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.0-beta.202601241323"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601241323/awsesh-darwin-x64.zip"
      sha256 "28c9a8abc23538d6d81ae25e12d9d9f3339ffae5469b227ffeaf57057c5ef48a"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601241323/awsesh-darwin-arm64.zip"
      sha256 "f358883284e3d4aa4b5bf9ebb9b39209a9c6aed8d5737090ea1f7e63ffddf178"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601241323/awsesh-linux-x64.tar.gz"
      sha256 "5dd7f047995dad6f0082ec8ffdb60cf0bd9df91ee67af9cdbb725b6203d23dac"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601241323/awsesh-linux-arm64.tar.gz"
      sha256 "87568062f0fb3875c71ceb886ad7ad83742f0bb6980e8f7bb312a6a702fe1a99"
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
