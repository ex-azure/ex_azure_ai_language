defmodule ExAzure.Ai.Language.TextAnalysis.Results.EntityRecognitionResults do
  @moduledoc """
  The Entity Recognition Results module.
  """
  @type warning() :: %{
          code: String.t(),
          message: String.t(),
          targetRef: String.t()
        }

  @type entity() :: %{
          category: String.t(),
          confidenceScore: float(),
          length: integer(),
          offset: integer(),
          subcategory: String.t() | nil,
          text: String.t()
        }

  @type documents() :: %{
          entities: list(entity()),
          id: String.t(),
          statistics: %{},
          warnings: list(warning())
        }

  @type error() :: %{
          code: String.t(),
          message: String.t(),
          target: String.t(),
          details: list(error()),
          innererror: error()
        }

  @type errors() :: %{
          id: String.t(),
          error: error()
        }

  @type statistics() :: %{}

  @type t() :: %{
          kind: String.t(),
          results: list(documents())
        }
end
