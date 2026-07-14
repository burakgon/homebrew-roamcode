class Roamcode < Formula
  desc "Operate Claude Code or Codex sessions remotely"
  homepage "https://roamcode.ai"
  url "https://registry.npmjs.org/roamcode/-/roamcode-1.0.16.tgz"
  sha256 "c460af29a1f2a1e343992cba5405f3257f43f609c96dea02f1d0339dfd4c572c"
  license "MIT"

  depends_on "node"
  depends_on "tmux"

  def install
    system "npm", "install", *std_npm_args(ignore_scripts: false), "--omit=dev", "--allow-scripts=better-sqlite3,node-pty"
    bin.install_symlink libexec/"bin/roamcode"
  end

  test do
    assert_equal "1.0.16", shell_output("#{bin}/roamcode --version").strip
  end
end
