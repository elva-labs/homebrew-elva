# typed: false
# frozen_string_literal: true

class AwseshBeta < Formula
  desc "AWS SSO session manager CLI (beta)"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.0-beta.202608281137"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202608281137/awsesh-darwin-x64.zip"
      sha256 "2d8ac470cd924c2ae0bcbaca63f253c799f16953e7327461e41060251458fa1c"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202608281137/awsesh-darwin-arm64.zip"
      sha256 "9e1bdc6365411935d6fb7827ddd88c2bfcb04d9be41baf90f72e3bce614fa184"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202608281137/awsesh-linux-x64.tar.gz"
      sha256 "89ccdc12395ea0ec965029b29ff2f538ae8d08f9f5b600a71dade56b270f1c10"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202608281137/awsesh-linux-arm64.tar.gz"
      sha256 "daffe202ba0c315fe09179b41c51e9552325f6930ed677950269cb34c2b976ba"
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
