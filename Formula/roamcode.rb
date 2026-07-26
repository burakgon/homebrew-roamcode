class Roamcode < Formula
  desc "Self-hosted mission control for Claude Code and Codex"
  homepage "https://roamcode.ai"
  url "https://registry.npmjs.org/roamcode/-/roamcode-2.2.2.tgz"
  sha256 "409e6ed57f516fd2b6288fe99ee17a60421166b3ce62f2f3b936d4fef97a5266"
  license "MIT"

  depends_on "node"
  depends_on "tmux"

  def install
    system "npm", "install", *std_npm_args(ignore_scripts: false), "--omit=dev", "--allow-scripts=better-sqlite3,node-pty"
    bin.install_symlink libexec/"bin/roamcode"
  end

  test do
    assert_equal "2.2.2", shell_output("#{bin}/roamcode --version").strip
  end
end
