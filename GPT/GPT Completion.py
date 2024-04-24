
import os
from openai import OpenAI
client = OpenAI(
    organization=os.getenv('OPENAI_ORG'),
    api_key=os.getenv('OPENAI_API_KEY'),
)

response = client.chat.completions.create(
  model="gpt-4-turbo-preview",
  messages=[
    {
      "role": "user",
      "content": "This is a test. "
    }
  ],
  temperature=1,
  max_tokens=256,
  top_p=1,
  frequency_penalty=0,
  presence_penalty=0
)