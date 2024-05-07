import Config

config :ex_azure_base,
  region: "westeurope",
  subscription_key: System.get_env("AZURE_SPEECH_KEY")

config :ex_azure_ai_language,
  base_url: "https://entertainment-tts.cognitiveservices.azure.com"

config :logger, level: :emergency
