defmodule ExAzureAiLanguage.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_azure_ai_language,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false},
      {:doctor, "~> 0.21", only: [:dev, :test], runtime: false},
      {:ex_azure_base, github: "ex-azure/ex_azure"},
      {:excoveralls, "~> 0.14", only: :test},
      {:ex_check, "~> 0.14", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.28", only: :dev, runtime: false},
      {:jason, "~> 1.4"},
      {:mix_audit, ">= 0.0.0", only: [:dev, :test], runtime: false},
      {:nimble_options, "~> 1.0"},
      {:splode, "~> 0.2"}
    ]
  end
end
