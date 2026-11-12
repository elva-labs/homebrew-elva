# typed: false
# frozen_string_literal: true

class Awsesh < Formula
  desc "AWS SSO session manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.4.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.4.3/awsesh-darwin-x64.zip"
      sha256 "df6e9b06762a23f0a2ddfa26ad782aa38aa1923210eedf80be1bf9921d1ee898"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.4.3/awsesh-darwin-arm64.zip"
      sha256 "d3b50d76671d8c8bf7cc291ef8b685d50e46c0868843e4d7ad9db3db4019e36e"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.4.3/awsesh-linux-x64.tar.gz"
      sha256 "f85bd1bf2a53bfbae501482b702fa0170fabb6a1cbfb8878d0c37a1f64cfc8b3"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.4.3/awsesh-linux-arm64.tar.gz"
      sha256 "c0cef465429bb199bc9ae98aae5ca12d6b537df1c3fe7c130e356f1c17005e86"
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
