class Idleloom < Formula
  desc "Use an idle Apple Silicon Mac as Kubernetes Native Metal compute"
  homepage "https://github.com/inerplat/idleloom"
  url "https://github.com/inerplat/idleloom/releases/download/v0.1.0-alpha.2/idleloom-v0.1.0-alpha.2-darwin-arm64.tar.gz"
  sha256 "77a162af6e4e150d8a1cbe04b7dc26fa4a5eb2e1157e6f83f153a6e4a911de82"
  license "Apache-2.0"

  depends_on :macos
  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    libexec.install "idlectl", "idleloom-agent", "idleloom-controller",
                    "idleloom-link", "idleloom-projection", "LICENSE"
    bin.write_exec_script libexec/"idlectl"
  end

  def caveats
    <<~EOS
      Idleloom Native Metal is alpha software. The default connected join may
      create public TCP and UDP LoadBalancers in the selected Kubernetes cluster.
      Review the plan printed by `idlectl join` before approving installation.
    EOS
  end

  test do
    assert_match "idlectl v#{version}", shell_output("#{bin}/idlectl version")
  end
end
