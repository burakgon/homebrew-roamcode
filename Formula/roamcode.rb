class Roamcode < Formula
  desc "Self-hosted mission control for Claude Code and Codex"
  homepage "https://roamcode.ai"
  url "https://registry.npmjs.org/roamcode/-/roamcode-4.0.0.tgz"
  sha256 "857ec5785ab84c3830e15fba234fdb2a1b01e2090b092ed8d4f9e59ec65b07a3"
  license "MIT"

  depends_on "node"
  depends_on "tmux"

  def install
    system "npm", "install", *std_npm_args(ignore_scripts: false), "--omit=dev", "--allow-scripts=better-sqlite3,node-pty"
    bin.install_symlink libexec/"bin/roamcode"
  end

  test do
    assert_equal "4.0.0", shell_output("#{bin}/roamcode --version").strip
  end
end
