# typed: false
# frozen_string_literal: true

class Awsesh < Formula
  desc "AWS SSO session manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.15"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.15/awsesh-darwin-x64.zip"
      sha256 "d0b7cc93ca458fafd2861bfa72bf803c12bfb69c3aaa32dffe34e9aa2382633f"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.15/awsesh-darwin-arm64.zip"
      sha256 "080a9b6c766f47eee5747021ff01c9147ad2b7c8c4719f52a13401d348838070"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.15/awsesh-linux-x64.tar.gz"
      sha256 "5b5c000be98b066ff517b6a6a37febe6ad4bb0c51510a00817047eb861ab936d"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.15/awsesh-linux-arm64.tar.gz"
      sha256 "62c5c79965c564a6e57a636881fd7a9d201cac776a3a5edb901b10612578cedc"
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
