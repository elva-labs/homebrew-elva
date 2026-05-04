# typed: false
# frozen_string_literal: true

class AwseshBeta < Formula
  desc "AWS SSO session manager CLI (beta)"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.0-beta.202605041251"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202605041251/awsesh-darwin-x64.zip"
      sha256 "6b13de355650e0f171836b521dac0c5c6e60e1f5fbc15960859047b9923beb6a"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202605041251/awsesh-darwin-arm64.zip"
      sha256 "c5ce394afb1eb95620425ba55849b39f2859046f09384b77cb9fd53c2d05533a"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202605041251/awsesh-linux-x64.tar.gz"
      sha256 "3b3642daadceed0bc181272be35bacac55ba9cf7b3f6d7047b26fc136c31acf3"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202605041251/awsesh-linux-arm64.tar.gz"
      sha256 "033acc394a47ec232e11e4c32a391144d45173f1843d49f0ee51c8d264458842"
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
