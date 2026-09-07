# typed: false
# frozen_string_literal: true

class AwseshBeta < Formula
  desc "AWS SSO session manager CLI (beta)"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.0-beta.202609070733"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202609070733/awsesh-darwin-x64.zip"
      sha256 "4ca7c3e6c04206bdf0e258c8ecdf8f52c1b053bd9e481c68778fd98267a4de9a"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202609070733/awsesh-darwin-arm64.zip"
      sha256 "6ad7b78929edf891fddce8d4b5321c66a4e687a2da26a1797302e8c0acfbb243"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202609070733/awsesh-linux-x64.tar.gz"
      sha256 "79067489bfd6e4493c524f6efee13901af1884ff531ae210250f48dfb5bc963b"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202609070733/awsesh-linux-arm64.tar.gz"
      sha256 "1a293622318c16501651b208604f963021610afb51a80668bd0410cbe5db947a"
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
