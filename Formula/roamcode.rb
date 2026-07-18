class Roamcode < Formula
  desc "Operate Claude Code or Codex sessions remotely"
  homepage "https://roamcode.ai"
  url "https://registry.npmjs.org/roamcode/-/roamcode-1.4.2.tgz"
  sha256 "2077e20f6c78468b3768439c18b53d4d7e0f705736624f3622790b7f8e830fc7"
  license "MIT"

  depends_on "node"
  depends_on "tmux"

  def install
    system "npm", "install", *std_npm_args(ignore_scripts: false), "--omit=dev", "--allow-scripts=better-sqlite3,node-pty"
    bin.install_symlink libexec/"bin/roamcode"
  end

  test do
    assert_equal "1.4.2", shell_output("#{bin}/roamcode --version").strip
  end
end
