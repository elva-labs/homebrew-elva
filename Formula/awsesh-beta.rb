# typed: false
# frozen_string_literal: true

class AwseshBeta < Formula
  desc "AWS SSO session manager CLI (beta)"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.0-beta.202601160734"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601160734/awsesh-darwin-x64.zip"
      sha256 "8b23d75e0a7857ef86fbc139c379d4fe32bee1a105774574a37297582c1a6e8c"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601160734/awsesh-darwin-arm64.zip"
      sha256 "618eaf8a15acb18ddaed1d25145e5e45c238ad33aa7cfd737cc8d711fd1cc818"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601160734/awsesh-linux-x64.tar.gz"
      sha256 "91ace758c826e47eb407a468cf1043f9008a338fd7f4772ca55a8c19642fe16a"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601160734/awsesh-linux-arm64.tar.gz"
      sha256 "63531d94a46d29ff13eec10adcf54063b281f3ee0d32d879827aede9fc53e8e5"
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
