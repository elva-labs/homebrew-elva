# typed: false
# frozen_string_literal: true

class AwseshBeta < Formula
  desc "AWS SSO session manager CLI (beta)"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.0-beta.202601300847"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601300847/awsesh-darwin-x64.zip"
      sha256 "52db6d20677d0fe9b401f4b3aad5f06072ac2ca4c24189b5901ced392fa8d39a"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601300847/awsesh-darwin-arm64.zip"
      sha256 "f45c81b68c47ae7ac76848e11270d26b7a654c773b126e987703973d2ffaf88d"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601300847/awsesh-linux-x64.tar.gz"
      sha256 "1851a38c399851c6f76563ef03d9c38d75b123263c374a47dfac50f2ab7bbe8d"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601300847/awsesh-linux-arm64.tar.gz"
      sha256 "8419e6a10540a2eecf136d11fddc38e3b8c94ebd59b9f2bceef7a6b0cc25c793"
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
