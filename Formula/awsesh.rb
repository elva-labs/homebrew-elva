# typed: false
# frozen_string_literal: true

class Awsesh < Formula
  desc "AWS SSO session manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.8"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.8/awsesh-darwin-x64.zip"
      sha256 "ca17a4a3e3594c379053fcb4c26fc9a3f31b691b5cbcd25ad5f8129a681389ad"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.8/awsesh-darwin-arm64.zip"
      sha256 "fb33d6a38653eded86bf2f50a9cee30306aa42acc8428dc49d1f0a1382bd0727"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.8/awsesh-linux-x64.tar.gz"
      sha256 "4ee66699f82c3c6f154d3b14954b28580162729baea57f3f9ad482d8775179b3"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.8/awsesh-linux-arm64.tar.gz"
      sha256 "d67f8d82a02e3b46d786c85f826d84ee5cb0282fffffe987ad22fc1329eb9463"
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
