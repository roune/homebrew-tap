class AgentMemory < Formula
  include Language::Python::Virtualenv

  desc "File coding-agent sessions and git history, keep what a person approves"
  homepage "https://github.com/roune/agent-memory"
  # Each release sets url and sha256 to its sdist on PyPI, through
  # scripts/homebrew-formula in roune/agent-memory. The version comes from
  # the file name.
  url "https://files.pythonhosted.org/packages/42/fa/67fe9c41ba4a622a905b40e24a318bb39d1bc6f210b1f00a2c96218e5c0b/roune_agent_memory-0.2.0.tar.gz"
  sha256 "7981b489058107166d3c416d23615671d6214a1584f42c239292d2406bb7c0d3"
  license "PolyForm-Noncommercial-1.0.0"

  depends_on "python@3.15"

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      `agent-memory setup` starts the server, and it needs Docker:
      Docker Desktop, OrbStack or colima.

      `agent-memory install` writes editor hooks, but only after a yes.
    EOS
  end

  test do
    ENV["HOME"] = testpath
    assert_match version.to_s, shell_output("#{bin}/agent-memory --version")
    system bin/"agent-memory", "--help"
    refute_path_exists testpath/".claude"
  end
end
