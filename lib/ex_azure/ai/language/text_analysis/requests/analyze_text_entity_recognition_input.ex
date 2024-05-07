defmodule ExAzure.Ai.Language.TextAnalysis.Requests.AnalyzeTextEntityRecognitionInput do
  @moduledoc """
  Module to create the request body for the Entity Recognition operation.
  """
  alias __MODULE__

  @typedoc """
  Document structure for the Entity Recognition operation.  

  id - A unique identifier for the document.  
  language - The language of the document. Use 'auto' for automatic language detection.  
  text - The text to analyze.  
  """
  @type document() :: %{
          id: String.t(),
          language: String.t() | nil,
          text: String.t()
        }

  @typedoc """
  logging_opt_out - A boolean value that indicates whether to disable logging for the operation.  
  model_version - The version of the model to use for the operation. Defaults to 'latest'.  
  """
  @type parameters() :: %{
          loggingOptOut: boolean(),
          modelVersion: String.t() | nil
        }

  @typedoc """
  Entity Recognition request body structure.  

  kind - EntityRecognition.  
  analysis_input - The input data for the operation.  
  parameters - The parameters for the operation.  
  """
  @type t() :: %{
          kind: String.t(),
          analysisInput: %{
            documents: list(AnalyzeTextEntityRecognitionInput.document())
          },
          parameters: AnalyzeTextEntityRecognitionInput.parameters()
        }

  @doc """
  Creates the request body for the Entity Recognition operation.
  """
  @spec create(list(AnalyzeTextEntityRecognitionInput.document())) ::
          AnalyzeTextEntityRecognitionInput.t()
  def create(documents) do
    %{
      kind: "EntityRecognition",
      analysisInput: %{
        documents: documents
      },
      parameters: %{
        loggingOptOut: false,
        modelVersion: "latest"
      }
    }
  end
end
