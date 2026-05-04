# typed: false
# frozen_string_literal: true

class AwseshBeta < Formula
  desc "AWS SSO session manager CLI (beta)"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.0-beta.202605041314"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202605041314/awsesh-darwin-x64.zip"
      sha256 "01fc3ef3415808490825e92239ed2c10d386d4da7e0851abe1822d6e98762986"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202605041314/awsesh-darwin-arm64.zip"
      sha256 "21e27d2276d620f0493cdf41b28965acc895bf5471f0599011c519b3d8dc72b7"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202605041314/awsesh-linux-x64.tar.gz"
      sha256 "017e0ee7fa488fcd2d20514684c7b8afec0591fc81f910f555d9000e9176bb8f"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202605041314/awsesh-linux-arm64.tar.gz"
      sha256 "c819384b866a1930b3b5cd398748897cc8c3bf2ced8a4abbf56cbecab63e02ab"
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
