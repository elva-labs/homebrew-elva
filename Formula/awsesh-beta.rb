# typed: false
# frozen_string_literal: true

class AwseshBeta < Formula
  desc "AWS SSO session manager CLI (beta)"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.0-beta.202601201235"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601201235/awsesh-darwin-x64.zip"
      sha256 "7560f04ef2be119376a2584d6027074ca2e47967c28d797bc50c832f8850d5bd"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601201235/awsesh-darwin-arm64.zip"
      sha256 "33fc3074281ee538fbf6970ff5e19a9b579f89f67e3014ff169f92a0806c8ac9"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601201235/awsesh-linux-x64.tar.gz"
      sha256 "b19d983f0e7bb268fe7a6cf80d2bae9fa3b281659ba978f08de13748f915dd3b"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601201235/awsesh-linux-arm64.tar.gz"
      sha256 "88e64018d0a90852f67406764f66d6b7c5c06d9d0cfe8057c3ef25e6db09c2ef"
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
