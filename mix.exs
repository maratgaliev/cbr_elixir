defmodule CbrElixir.Mixfile do
  use Mix.Project

  def project do
    [app: :cbr_elixir,
     version: "0.1.1",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger, :httpoison, :timex]]
  end

  defp description do
    """
    CBR client library for Elixir.
    """
  end

  defp package do
    [
      licenses: ["MIT"],
      keywords: ["Elixir", "CBR"],
      maintainers: ["Marat Galiev"],
      links: %{"GitHub" => "https://github.com/maratgaliev/cbr_elixir"}
    ]
  end

  defp deps do
    [
      {:sweet_xml, "~> 0.6.5"},
      {:httpoison, "~> 0.12"},
      {:codepagex, "~> 0.1.4"},
      {:timex, "~> 3.1"},
      {:ex_doc, "~> 0.13.1", only: [:dev, :docs]}
    ]
  end
end
