class Roamcode < Formula
  desc "Self-hosted mission control for Claude Code and Codex"
  homepage "https://roamcode.ai"
  url "https://registry.npmjs.org/roamcode/-/roamcode-4.0.8.tgz"
  sha256 "e8e07e3e81adf3b2fdbc28cfa5b5ad94c8f34b4d0547ed2b3e4e4e192ab838ba"
  license "MIT"

  depends_on "node"
  depends_on "tmux"

  def install
    system "npm", "install", *std_npm_args(ignore_scripts: false), "--omit=dev", "--allow-scripts=better-sqlite3,node-pty"
    bin.install_symlink libexec/"bin/roamcode"
  end

  test do
    assert_equal "4.0.8", shell_output("#{bin}/roamcode --version").strip
  end
end
