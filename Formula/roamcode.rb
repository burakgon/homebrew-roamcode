class Roamcode < Formula
  desc "Self-hosted mission control for Claude Code and Codex"
  homepage "https://roamcode.ai"
  url "https://registry.npmjs.org/roamcode/-/roamcode-4.0.16.tgz"
  sha256 "1506da5e5777bb9a9b2a4cfe409f8d69e0cfb5195fc1d0ec367ab4064eb216b8"
  license "MIT"

  depends_on "node"
  depends_on "tmux"

  def install
    system "npm", "install", *std_npm_args(ignore_scripts: false), "--omit=dev", "--allow-scripts=better-sqlite3,node-pty"
    bin.install_symlink libexec/"bin/roamcode"
  end

  test do
    assert_equal "4.0.16", shell_output("#{bin}/roamcode --version").strip
  end
end
