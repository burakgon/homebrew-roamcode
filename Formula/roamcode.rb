class Roamcode < Formula
  desc "Self-hosted mission control for Claude Code and Codex"
  homepage "https://roamcode.ai"
  url "https://registry.npmjs.org/roamcode/-/roamcode-2.1.2.tgz"
  sha256 "44c486f0a4a3957f4ef66128ffb5a5d62bcc37b4288470a8f73fb2849732d93d"
  license "MIT"

  depends_on "node"
  depends_on "tmux"

  def install
    system "npm", "install", *std_npm_args(ignore_scripts: false), "--omit=dev", "--allow-scripts=better-sqlite3,node-pty"
    bin.install_symlink libexec/"bin/roamcode"
  end

  test do
    assert_equal "2.1.2", shell_output("#{bin}/roamcode --version").strip
  end
end
