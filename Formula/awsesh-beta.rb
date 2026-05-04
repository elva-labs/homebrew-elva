# typed: false
# frozen_string_literal: true

class AwseshBeta < Formula
  desc "AWS SSO session manager CLI (beta)"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.0-beta.202605041157"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202605041157/awsesh-darwin-x64.zip"
      sha256 "92b202614e327a922539ffd404dc36c3785ddf10a0812aab9768c42eb2d353a1"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202605041157/awsesh-darwin-arm64.zip"
      sha256 "bee225fc12e4738cb9495e0e034ffb6b8386a2f3bf68f1c461918101949b5ca7"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202605041157/awsesh-linux-x64.tar.gz"
      sha256 "d37e61ce5f9080835c385d5e4ceddea4921d6fbb98d9f1e709569f6f2d9e6bda"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202605041157/awsesh-linux-arm64.tar.gz"
      sha256 "48b3a1b52c63acf6a2978c34607127c328d0dac4757f51652b00b27c3081b26f"
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
