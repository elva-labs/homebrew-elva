# typed: false
# frozen_string_literal: true

class AwseshBeta < Formula
  desc "AWS SSO session manager CLI (beta)"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.0-beta.202605041214"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202605041214/awsesh-darwin-x64.zip"
      sha256 "5e58d4a09ac1eb721e02ba91b30af8c3436a1d99171dabed0ce6dfff3413d582"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202605041214/awsesh-darwin-arm64.zip"
      sha256 "f4636f764e6bb0543062a08a7bc51a4b55cd75352d74a30922f2ff52a7f5919d"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202605041214/awsesh-linux-x64.tar.gz"
      sha256 "58d03745ce6adbed4cbc1e0e1b14ed664e97b299b786db6443b64762f9074ca0"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202605041214/awsesh-linux-arm64.tar.gz"
      sha256 "1fc4106473621d35302f7a4145fe6ee6d5e961ddd63046f10ca3ce613c87e076"
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
