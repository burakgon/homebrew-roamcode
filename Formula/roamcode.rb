class Roamcode < Formula
  desc "Operate Claude Code or Codex sessions remotely"
  homepage "https://roamcode.ai"
  url "https://registry.npmjs.org/roamcode/-/roamcode-1.0.0.tgz"
  sha256 "4ddc5fa47018ad093422c7500eac5c4212b49ee2df531c632be41d94985f75ca"
  license "MIT"

  depends_on "node"
  depends_on "tmux"

  def install
    system "npm", "install", *std_npm_args, "--omit=dev"
    bin.install_symlink libexec/"bin/roamcode"
  end

  test do
    assert_equal "1.0.0", shell_output("#{bin}/roamcode --version").strip
  end
end
