class Roamcode < Formula
  desc "Operate Claude Code or Codex sessions remotely"
  homepage "https://roamcode.ai"
  url "https://registry.npmjs.org/roamcode/-/roamcode-2.0.0.tgz"
  sha256 "3fb483da8446e4c44aff5852a3ca5b13e3932a8d08e1cda2e28d02037bf9bd0b"
  license "MIT"

  depends_on "node"
  depends_on "tmux"

  def install
    system "npm", "install", *std_npm_args(ignore_scripts: false), "--omit=dev", "--allow-scripts=better-sqlite3,node-pty"
    bin.install_symlink libexec/"bin/roamcode"
  end

  test do
    assert_equal "2.0.0", shell_output("#{bin}/roamcode --version").strip
  end
end
