class Roamcode < Formula
  desc "Operate Claude Code or Codex sessions remotely"
  homepage "https://roamcode.ai"
  url "https://registry.npmjs.org/roamcode/-/roamcode-1.0.19.tgz"
  sha256 "7f74e8f1e8ab914b7bc91c7ea64559c2fe805e791440f11ab7c0a997db86a4b4"
  license "MIT"

  depends_on "node"
  depends_on "tmux"

  def install
    system "npm", "install", *std_npm_args(ignore_scripts: false), "--omit=dev", "--allow-scripts=better-sqlite3,node-pty"
    bin.install_symlink libexec/"bin/roamcode"
  end

  test do
    assert_equal "1.0.19", shell_output("#{bin}/roamcode --version").strip
  end
end
