class Roamcode < Formula
  desc "Self-hosted mission control for Claude Code and Codex"
  homepage "https://roamcode.ai"
  url "https://registry.npmjs.org/roamcode/-/roamcode-4.0.35.tgz"
  sha256 "a8494dbd07b24fe123e7ffffa0ae95babe471d4a6c808d7fec6b9c2523fe9549"
  license "MIT"

  depends_on "node"
  depends_on "tmux"

  def install
    system "npm", "install", *std_npm_args(ignore_scripts: false), "--omit=dev", "--allow-scripts=better-sqlite3,node-pty"
    bin.install_symlink libexec/"bin/roamcode"
  end

  test do
    assert_equal "4.0.35", shell_output("#{bin}/roamcode --version").strip
  end
end
