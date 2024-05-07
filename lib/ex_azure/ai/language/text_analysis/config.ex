defmodule ExAzure.Ai.Language.TextAnalysis.Config do
  @schema NimbleOptions.new!(
            base_url: [
              type: :string,
              required: true
            ],
            api_version: [
              type: :string,
              required: true
            ],
            show_stats: [
              type: :boolean,
              required: false,
              default: false
            ]
          )

  alias __MODULE__

  @type t() :: [unquote(NimbleOptions.option_typespec(@schema))]

  @spec new(Keyword.t()) :: {:ok, Config.t()} | {:error, NimbleOptions.ValidationError.t()}
  def new(config \\ []),
    do:
      default_config()
      |> Keyword.merge(config)
      |> NimbleOptions.validate(@schema)

  defp default_config,
    do: [
      api_version: "2023-04-01",
      base_url: Application.get_env(:ex_azure_ai_language, :base_url)
    ]
end
