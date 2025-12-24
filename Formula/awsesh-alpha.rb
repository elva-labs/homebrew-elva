# typed: false
# frozen_string_literal: true

class AwseshAlpha < Formula
  desc "AWS SSO session manager CLI (alpha)"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.0-alpha.202512240821"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-alpha.202512240821/awsesh-darwin-x64.zip"
      sha256 "3a72d4a85aacb30c8247ffb9bf6e05ca413e5170a0f98ac95c73a6fe2b33da92"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-alpha.202512240821/awsesh-darwin-arm64.zip"
      sha256 "fcc90c5190f7fb706fff47d1e411ce1c60b3a004a00f24e55ccb79a52fe76d12"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-alpha.202512240821/awsesh-linux-x64.tar.gz"
      sha256 "45864e6f97f42e308026dbe5976b46bd58855aac5c0002bdee543f8807f163fb"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-alpha.202512240821/awsesh-linux-arm64.tar.gz"
      sha256 "445f271191973c4cf45a38f691760481a7fdbb7f7b1236d252fe10a2612e2eac"
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
