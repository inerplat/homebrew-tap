class Idleloom < Formula
  desc "Use an idle Apple Silicon Mac as Kubernetes Native Metal compute"
  homepage "https://github.com/inerplat/idleloom"
  url "https://github.com/inerplat/idleloom/releases/download/v0.1.1/idleloom-v0.1.1-darwin-arm64.tar.gz"
  sha256 "6b816c66957c715d076c9fd67d8301c2a42f0a0ba85eaa339b5c3d31c77fa7d9"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    libexec.install "idlectl", "LICENSE"
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
