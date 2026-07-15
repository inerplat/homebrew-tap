class Wirekube < Formula
  desc "Connect Kubernetes nodes across networks with a WireGuard mesh"
  homepage "https://github.com/inerplat/wirekube"
  version "0.0.15"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/inerplat/wirekube/releases/download/v0.0.15/wirekubectl-darwin-arm64"
      sha256 "657a03b23eeb0d2cbdd6ac308d9b3cd88bb683cb0d21eb27bf9ad6698de359d3"
    end
    on_intel do
      url "https://github.com/inerplat/wirekube/releases/download/v0.0.15/wirekubectl-darwin-amd64"
      sha256 "5f6312b0a34a1f6af678769b7499297204256cabe50a6d4c33988727245bd5b2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/inerplat/wirekube/releases/download/v0.0.15/wirekubectl-linux-arm64"
      sha256 "8269c917ae5d3d27e0f68c3148cec78643e2fe82df8a9d754f57b970f7a51e03"
    end
    on_intel do
      url "https://github.com/inerplat/wirekube/releases/download/v0.0.15/wirekubectl-linux-amd64"
      sha256 "97c6fa0fda2ddeaabe6a114a25cb7621fa45d81288ac378dfae81f7b84b9b8f9"
    end
  end

  def install
    bin.install Dir["wirekubectl-*"].first => "wirekubectl"
  end

  def caveats
    <<~EOS
      The formula installs the wirekubectl client. It does not modify a cluster.
      Start with a dry run and review the relay topology before installation:

        wirekubectl install --dry-run --kubeconfig ~/.kube/config
        wirekubectl install --kubeconfig ~/.kube/config

      A managed relay may create public LoadBalancer Services depending on the
      selected installation plan.
    EOS
  end

  test do
    output = shell_output("#{bin}/wirekubectl version")
    assert_match "Version:", output
    assert_match "v#{version}", output
  end
end
