# typed: false
# frozen_string_literal: true

class AwseshBeta < Formula
  desc "AWS SSO session manager CLI (beta)"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.0-beta.202609240921"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202609240921/awsesh-darwin-x64.zip"
      sha256 "152cda4f319e250e4c817908b88f00125f766892f860d65e78daf59e0dc29425"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202609240921/awsesh-darwin-arm64.zip"
      sha256 "2a552be770c02c04e3a3a11e68e60b3a303da41fb81ed079f8af849e544deb73"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202609240921/awsesh-linux-x64.tar.gz"
      sha256 "fa9f3b6d06af6bdea6caffbf50c98248fd0f700c3c43e78c120cf62cc9a84a95"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202609240921/awsesh-linux-arm64.tar.gz"
      sha256 "9dd06ec8c7bcdac2f718a0e202f165caa24f04752c98053c4324c4abadec2b53"
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
