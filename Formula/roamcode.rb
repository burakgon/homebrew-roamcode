class Roamcode < Formula
  desc "Operate Claude Code or Codex sessions remotely"
  homepage "https://roamcode.ai"
  url "https://registry.npmjs.org/roamcode/-/roamcode-1.0.9.tgz"
  sha256 "b8f35f6ac4bb38f4dec7c3b3a6eb4ec62bcab6baf0520d9bec83e5d7946afe2c"
  license "MIT"

  depends_on "node"
  depends_on "tmux"

  def install
    system "npm", "install", *std_npm_args(ignore_scripts: false), "--omit=dev", "--allow-scripts=better-sqlite3,node-pty"
    bin.install_symlink libexec/"bin/roamcode"
  end

  test do
    assert_equal "1.0.9", shell_output("#{bin}/roamcode --version").strip
  end
end
