defmodule ExAzure.Integration.TextAnalysisTest do
  use ExUnit.Case, async: true

  @moduletag :integration

  alias ExAzure.Ai.Language.TextAnalysis
  alias ExAzure.Ai.Language.TextAnalysis.Requests.AnalyzeTextEntityRecognitionInput

  describe "Entities Extraction" do
    test "should successfully extract named entities from a text" do
      assert {:ok,
              %{
                kind: "EntityRecognitionResults",
                results: %{
                  errors: [],
                  documents: [
                    %{
                      id: "1",
                      warnings: [],
                      entities: [
                        %{
                          offset: 18,
                          length: 4,
                          text: "trip",
                          category: "Event",
                          confidenceScore: 0.82
                        },
                        %{
                          offset: 26,
                          length: 7,
                          text: "Seattle",
                          category: "Location",
                          confidenceScore: 1.0,
                          subcategory: "City"
                        },
                        %{
                          offset: 34,
                          length: 9,
                          text: "last week",
                          category: "DateTime",
                          confidenceScore: 1.0,
                          subcategory: "DateRange"
                        }
                      ]
                    }
                  ],
                  modelVersion: "2023-09-01"
                }
              }} =
               [
                 %{id: "1", language: "en", text: "I had a wonderful trip to Seattle last week."}
               ]
               |> AnalyzeTextEntityRecognitionInput.create()
               |> TextAnalysis.analyse_entities()
    end
  end
end
