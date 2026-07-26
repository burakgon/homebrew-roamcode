class Roamcode < Formula
  desc "Self-hosted mission control for Claude Code and Codex"
  homepage "https://roamcode.ai"
  url "https://registry.npmjs.org/roamcode/-/roamcode-2.3.3.tgz"
  sha256 "c198f152caf7ce5f8407e0fbf58f37f8f6708b5a96cc91e0aa9376324ba08e2c"
  license "MIT"

  depends_on "node"
  depends_on "tmux"

  def install
    system "npm", "install", *std_npm_args(ignore_scripts: false), "--omit=dev", "--allow-scripts=better-sqlite3,node-pty"
    bin.install_symlink libexec/"bin/roamcode"
  end

  test do
    assert_equal "2.3.3", shell_output("#{bin}/roamcode --version").strip
  end
end
