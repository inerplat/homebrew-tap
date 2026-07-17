class Idleloom < Formula
  desc "Use an idle Apple Silicon Mac as Kubernetes Native Metal compute"
  homepage "https://github.com/inerplat/idleloom"
  url "https://github.com/inerplat/idleloom/releases/download/v0.1.2/idleloom-v0.1.2-darwin-arm64.tar.gz"
  version "0.1.2"
  sha256 "fb487c481f1cd5aa1383b71ebab7377a07318966772c2586811c92e56ab51dd0"
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
    assert_match "Usage of maintain:", shell_output("#{bin}/idlectl worker maintain --help 2>&1")
  end
end
