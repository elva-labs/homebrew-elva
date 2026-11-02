# typed: false
# frozen_string_literal: true

class Awsesh < Formula
  desc "AWS SSO session manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.4.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.4.1/awsesh-darwin-x64.zip"
      sha256 "11c805bec42f1b7ee01f0c34aa9d9b4d0dba90c81ff841557bce87d991fa4dce"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.4.1/awsesh-darwin-arm64.zip"
      sha256 "b55215148446a829980bf6bb04dbd4c26f16c51c91cd0a40338b00952d77b23d"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.4.1/awsesh-linux-x64.tar.gz"
      sha256 "8858d053d47a27cd03cc39393953dd6f94e173396b1e09ef1858b9269aad7d76"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.4.1/awsesh-linux-arm64.tar.gz"
      sha256 "a23d70ee428bbc24436bf00e05c366715b7ca5dc137dd699849ccb0e92283b0e"
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
