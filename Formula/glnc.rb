# frozen_string_literal: true

# This formula is auto-bumped by the bump.yml workflow in this tap whenever the
# main glnc repo publishes a release. Manual edits to `version`, the `url`s, or
# the `sha256`s WILL BE OVERWRITTEN on the next release. If you need to patch
# the formula by hand (e.g. a Homebrew style fix), edit other fields and the CI
# bumper will preserve your changes.
#
# TODO(license): Confirm the upstream license. Placeholder is MIT — update once
# the main repo's LICENSE file is finalized.
class Glnc < Formula
  desc "Blockchain inspection CLI for EVM, Bitcoin, and Solana"
  homepage "https://github.com/aryarahimi1/glnc"
  version "1.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aryarahimi1/glnc/releases/download/v#{version}/glnc-darwin-arm64.tar.gz"
      # sha256 from SHA256SUMS, line: "<hash>  glnc-darwin-arm64.tar.gz"
      sha256 "cea8d2926e2d3b3bd511f5e45bb3b242f312f3b56703214f179f25af2d57837a"
    end

    on_intel do
      url "https://github.com/aryarahimi1/glnc/releases/download/v#{version}/glnc-darwin-x64.tar.gz"
      # sha256 from SHA256SUMS, line: "<hash>  glnc-darwin-x64.tar.gz"
      sha256 "21c48834612cf5634ff02296075d197b93ec18670f030d51304d0ce987c8116d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aryarahimi1/glnc/releases/download/v#{version}/glnc-linux-arm64.tar.gz"
      # sha256 from SHA256SUMS, line: "<hash>  glnc-linux-arm64.tar.gz"
      sha256 "5398c00ebeb7c7cd9a30e5b859449825bf5158a4e7dbb0bb4764bfd0d5168000"
    end

    on_intel do
      url "https://github.com/aryarahimi1/glnc/releases/download/v#{version}/glnc-linux-x64.tar.gz"
      # sha256 from SHA256SUMS, line: "<hash>  glnc-linux-x64.tar.gz"
      sha256 "dd8d70c08e3264c89bf04b7d3c88cf1eca02e48475a9a98ef63ad78d5d670743"
    end
  end

  def install
    # Each tarball contains a single per-arch binary at the top level. Rename
    # it to `glnc` and drop it into the prefix's bin directory.
    binary_name = if OS.mac?
      Hardware::CPU.arm? ? "glnc-darwin-arm64" : "glnc-darwin-x64"
    else
      Hardware::CPU.arm? ? "glnc-linux-arm64" : "glnc-linux-x64"
    end

    bin.install binary_name => "glnc"
    chmod 0755, bin/"glnc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glnc --version")
  end
end
