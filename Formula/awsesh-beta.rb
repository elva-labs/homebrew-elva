# typed: false
# frozen_string_literal: true

class AwseshBeta < Formula
  desc "AWS SSO session manager CLI (beta)"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.0-beta.202601081433"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601081433/awsesh-darwin-x64.zip"
      sha256 "7d146ef6b5ca7d62f4c9fe198c1924603314aead4e1fbb62a7de19f9dfd8b19b"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601081433/awsesh-darwin-arm64.zip"
      sha256 "cc744524f338662bebbc580685078edc0501e10158caa650af58ebb040832238"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601081433/awsesh-linux-x64.tar.gz"
      sha256 "520889d0b64093f540f418b70c5bf6f34e1834155affe2a65d17246d95d1babc"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601081433/awsesh-linux-arm64.tar.gz"
      sha256 "3d97a4b7d3801721bc5d969bb57de17cbf4e39355b7b37a6f78351e2c27ad375"
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
