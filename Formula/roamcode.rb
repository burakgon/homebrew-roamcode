class Roamcode < Formula
  desc "Operate Claude Code or Codex sessions remotely"
  homepage "https://roamcode.ai"
  url "https://registry.npmjs.org/roamcode/-/roamcode-1.1.0.tgz"
  sha256 "8637016e9af3469bc2b0b9dec92765e260e6761b968deaa25a481bd487343d14"
  license "MIT"

  depends_on "node"
  depends_on "tmux"

  def install
    system "npm", "install", *std_npm_args(ignore_scripts: false), "--omit=dev", "--allow-scripts=better-sqlite3,node-pty"
    bin.install_symlink libexec/"bin/roamcode"
  end

  test do
    assert_equal "1.1.0", shell_output("#{bin}/roamcode --version").strip
  end
end
