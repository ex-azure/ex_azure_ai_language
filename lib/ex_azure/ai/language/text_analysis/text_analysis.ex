defmodule ExAzure.Ai.Language.TextAnalysis do
  @moduledoc """
  This module defines the behaviour for the TextAnalysis service.
  """
  alias ExAzure.Request
  alias ExAzure.Ai.Language.TextAnalysis.Config, as: TextAnalysisConfig

  alias ExAzure.Ai.Language.TextAnalysis.Requests.AnalyzeTextEntityRecognitionInput
  alias ExAzure.Ai.Language.TextAnalysis.Results.EntityRecognitionResults

  @spec analyse_entities(AnalyzeTextEntityRecognitionInput.t(), Keyword.t()) ::
          {:ok, EntityRecognitionResults.t()} | {:error, map()}
  def analyse_entities(entity_recognition_request, opts \\ []) do
    with {:ok, config} <- TextAnalysisConfig.new(opts),
         request <-
           %Request{
             method: :post,
             base_url: config[:base_url],
             auth: :subscription_key,
             path: "language/:analyze-text",
             body: entity_recognition_request,
             query: [{"api-version", config[:api_version]}]
           } do
      ExAzure.request(request)
    end
  end
end
