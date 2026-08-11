class Roamcode < Formula
  desc "Self-hosted mission control for Claude Code and Codex"
  homepage "https://roamcode.ai"
  url "https://registry.npmjs.org/roamcode/-/roamcode-4.0.2.tgz"
  sha256 "f41aa83dcc8ff8efa0bc3f58d6e4c5dbe450727af17334e54b14adb924685c90"
  license "MIT"

  depends_on "node"
  depends_on "tmux"

  def install
    system "npm", "install", *std_npm_args(ignore_scripts: false), "--omit=dev", "--allow-scripts=better-sqlite3,node-pty"
    bin.install_symlink libexec/"bin/roamcode"
  end

  test do
    assert_equal "4.0.2", shell_output("#{bin}/roamcode --version").strip
  end
end
