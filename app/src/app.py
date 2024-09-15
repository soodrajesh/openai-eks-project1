import os
from flask import Flask, request, jsonify
import openai

app = Flask(__name__)

openai.api_key = os.environ.get("OPENAI_API_KEY")

@app.route("/generate", methods=["POST"])
def generate_text():
    prompt = request.json.get("prompt", "")
    try:
        response = openai.Completion.create(
            engine="text-davinci-002",
            prompt=prompt,
            max_tokens=100
        )
        return jsonify({"generated_text": response.choices[0].text.strip()})
    except Exception as e:
        return jsonify({"error": str(e)}), 500

# Add a health check route
@app.route("/healthz", methods=["GET"])
def health_check():
    return jsonify({"status": "ok"}), 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int(os.environ.get("PORT", 5000)))
