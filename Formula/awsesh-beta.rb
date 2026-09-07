# typed: false
# frozen_string_literal: true

class AwseshBeta < Formula
  desc "AWS SSO session manager CLI (beta)"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.0-beta.202609070730"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202609070730/awsesh-darwin-x64.zip"
      sha256 "34927fe31aa323714e0edeb2eb5a0294f42576daf69104e91f87b1a413680e31"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202609070730/awsesh-darwin-arm64.zip"
      sha256 "5d2e6b1236a4a3bedaefbdadf6910b6ed994a3aeda2baf9b5d0701db337e32b5"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202609070730/awsesh-linux-x64.tar.gz"
      sha256 "f083e66da84e3a514018ce22e2541b961977d9b6fa8266b6966ae5b91cc29089"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202609070730/awsesh-linux-arm64.tar.gz"
      sha256 "66bd2d85cddcf49098b82634bc42dc8270b1cb99d9f9d3988fb43fb5c760f6ba"
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
