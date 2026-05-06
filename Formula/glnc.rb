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
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aryarahimi1/glnc/releases/download/v#{version}/glnc-darwin-arm64.tar.gz"
      # sha256 from SHA256SUMS, line: "<hash>  glnc-darwin-arm64.tar.gz"
      sha256 "a543aad8e12d9e75f6b7032bd736b589df4aa5ec93f6548bf68f0dcbbc27a979"
    end

    on_intel do
      url "https://github.com/aryarahimi1/glnc/releases/download/v#{version}/glnc-darwin-x64.tar.gz"
      # sha256 from SHA256SUMS, line: "<hash>  glnc-darwin-x64.tar.gz"
      sha256 "68c205ab7f2bf7b6c9a237b9b388491bf67bf566899c6fc2dd5e5ebb6cf8dc88"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aryarahimi1/glnc/releases/download/v#{version}/glnc-linux-arm64.tar.gz"
      # sha256 from SHA256SUMS, line: "<hash>  glnc-linux-arm64.tar.gz"
      sha256 "0a1f7473ac4b69cfcf1cf91aca912d6d950272ae138fd6a6ea76ccc717d7057f"
    end

    on_intel do
      url "https://github.com/aryarahimi1/glnc/releases/download/v#{version}/glnc-linux-x64.tar.gz"
      # sha256 from SHA256SUMS, line: "<hash>  glnc-linux-x64.tar.gz"
      sha256 "b7fa75993da2f84f20b6df7eb6e51112011095f46606816dbf723d4401667dfa"
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
