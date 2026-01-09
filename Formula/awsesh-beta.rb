# typed: false
# frozen_string_literal: true

class AwseshBeta < Formula
  desc "AWS SSO session manager CLI (beta)"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.0-beta.202601090915"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601090915/awsesh-darwin-x64.zip"
      sha256 "6624c2b132fa0bc65f6139ae4963e231b8db3f977d92bc3b96e4f3d43dfc0fb6"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601090915/awsesh-darwin-arm64.zip"
      sha256 "58cd2791e97152d3ab08e65860a4e2615805a0a20788bdffd28a24ef90c69b51"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601090915/awsesh-linux-x64.tar.gz"
      sha256 "b2d74999da6403718fc15eadd001e413f8ffbb56fec5f02efdb971fafdd14814"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601090915/awsesh-linux-arm64.tar.gz"
      sha256 "7b5a814c9fd7459ec98c0a74e50a25b21693346f4c2f2f87611f1ad9b75ac23f"
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
