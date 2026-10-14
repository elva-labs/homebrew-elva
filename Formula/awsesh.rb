# typed: false
# frozen_string_literal: true

class Awsesh < Formula
  desc "AWS SSO session manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.3.0/awsesh-darwin-x64.zip"
      sha256 "ae4f5ce3366b79df305331d2b90a026f4b344ac558ead6f621237e3d2ed25a5f"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.3.0/awsesh-darwin-arm64.zip"
      sha256 "9149780b41a4a3c9965dbad5dc68b1de9b6f6c828c95d8aa3d0157834356ac4d"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.3.0/awsesh-linux-x64.tar.gz"
      sha256 "ff21cc136c911d5f1fd3e4b63e8f3e22f584bd8dc4e012442cf21d6cf757af6b"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.3.0/awsesh-linux-arm64.tar.gz"
      sha256 "29a427c3d6cfa446fa62987d27f528480d909ffa9e913797e5808631ac7279a8"
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
