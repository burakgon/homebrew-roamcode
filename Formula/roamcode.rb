class Roamcode < Formula
  desc "Self-hosted mission control for Claude Code and Codex"
  homepage "https://roamcode.ai"
  url "https://registry.npmjs.org/roamcode/-/roamcode-4.0.25.tgz"
  sha256 "76d5237240ea44c100e75aef33f1180df48587792522e2490d67824b7b647d7f"
  license "MIT"

  depends_on "node"
  depends_on "tmux"

  def install
    system "npm", "install", *std_npm_args(ignore_scripts: false), "--omit=dev", "--allow-scripts=better-sqlite3,node-pty"
    bin.install_symlink libexec/"bin/roamcode"
  end

  test do
    assert_equal "4.0.25", shell_output("#{bin}/roamcode --version").strip
  end
end
