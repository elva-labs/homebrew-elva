# typed: false
# frozen_string_literal: true

class AwseshBeta < Formula
  desc "AWS SSO session manager CLI (beta)"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.0-beta.202605041232"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202605041232/awsesh-darwin-x64.zip"
      sha256 "c800c0ae344e54e01b90b20671d2911f820c8d5b3652a4a56dd3bd151250b0c5"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202605041232/awsesh-darwin-arm64.zip"
      sha256 "fdb21c40fe508e8779c9bd08dc0344510077a97af093c16c20481846e3de274d"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202605041232/awsesh-linux-x64.tar.gz"
      sha256 "e7e186db4592de8194e701a0d11dd030a3c65affed38fab52623c26227870396"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202605041232/awsesh-linux-arm64.tar.gz"
      sha256 "52d86c05a9be0890f0b83851da6b65b0dd93e1cfb46549108d4a22d4784902ab"
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
