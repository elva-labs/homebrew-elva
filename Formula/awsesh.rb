# typed: false
# frozen_string_literal: true

class Awsesh < Formula
  desc "AWS SSO session manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.3/awsesh-darwin-x64.zip"
      sha256 "83964ff385a39d8e678a3a6d8d4c040466fe015832d128d3865bb27c2c7f6db0"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.3/awsesh-darwin-arm64.zip"
      sha256 "537ba52af88b7fb1a2bd5792d5795d10a82c559a028567c12dee80a92bc7cbf7"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.3/awsesh-linux-x64.tar.gz"
      sha256 "a04506d24fc4f49cf2193ed2317200226a60ec8790af05a595a04462743b7291"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.3/awsesh-linux-arm64.tar.gz"
      sha256 "390665c454c3ac428a3dbf8ea834bf0c0d25fd257f18471d96d5a2eb417cd8fb"
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
