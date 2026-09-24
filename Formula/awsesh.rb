# typed: false
# frozen_string_literal: true

class Awsesh < Formula
  desc "AWS SSO session manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.17"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.17/awsesh-darwin-x64.zip"
      sha256 "2d4a1d77ac5ded26f9b7cbbc0d09209fd4bb92eaf8a1d36e57b3bb82a4e00783"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.17/awsesh-darwin-arm64.zip"
      sha256 "c1da433dc5465f6c39dea1ac3c4f0410a26a0113cc511c03f1aabbac151f5918"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.17/awsesh-linux-x64.tar.gz"
      sha256 "e3f922e95ebf8ac7a716ca752f805310ef4ce7e072b904dce23aaf40c8372a77"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.17/awsesh-linux-arm64.tar.gz"
      sha256 "4c97922821a1e18471c2fa3d2c3a663f9359463b45bda594a08513094d58612f"
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
