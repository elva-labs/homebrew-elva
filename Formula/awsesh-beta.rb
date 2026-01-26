# typed: false
# frozen_string_literal: true

class AwseshBeta < Formula
  desc "AWS SSO session manager CLI (beta)"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.0-beta.202601260936"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601260936/awsesh-darwin-x64.zip"
      sha256 "c5ae592936cc5881c2621dba05e5368118e5f0a4a9095a69d0f5aa058c26f549"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601260936/awsesh-darwin-arm64.zip"
      sha256 "68e887594f497d7913ab3b37aeb0072b36f4438e450333f0373ed131b5b75ebc"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601260936/awsesh-linux-x64.tar.gz"
      sha256 "a323748a8a2a342f1a4d3c814ccd0f9737667dd55d1ca13de3ed457c642a8e43"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601260936/awsesh-linux-arm64.tar.gz"
      sha256 "c83c7147a9215107b769dc4f58b5274e2cc6a86fe5a19e5e7411845d15e76208"
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
