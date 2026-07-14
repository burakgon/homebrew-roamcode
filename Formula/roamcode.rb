class Roamcode < Formula
  desc "Operate Claude Code or Codex sessions remotely"
  homepage "https://roamcode.ai"
  url "https://registry.npmjs.org/roamcode/-/roamcode-1.0.11.tgz"
  sha256 "d3c3ab44ab54818a7c01af54a4c7840b18d0982a92573099b7924cc129213418"
  license "MIT"

  depends_on "node"
  depends_on "tmux"

  def install
    system "npm", "install", *std_npm_args(ignore_scripts: false), "--omit=dev", "--allow-scripts=better-sqlite3,node-pty"
    bin.install_symlink libexec/"bin/roamcode"
  end

  test do
    assert_equal "1.0.11", shell_output("#{bin}/roamcode --version").strip
  end
end
