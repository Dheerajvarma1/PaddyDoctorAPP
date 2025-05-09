import os
os.environ["CUDA_VISIBLE_DEVICES"] = "-1"  # Disable GPU

import tensorflow as tf
from flask import Flask, request, jsonify
import numpy as np
from PIL import Image
import io

app = Flask(__name__)

# Load your trained model
model = tf.keras.models.load_model("xception_best_weights.keras")

# Define class labels
CLASS_NAMES = [
    "bacterial_leaf_blight", "bacterial_leaf_streak", "bacterial_panicle_blight",
    "black_stem_borer", "blast", "brown_spot", "downy_mildew",
    "hispa", "leaf_roller", "normal", "tungro", "white_stem_sorer", "yellow_stem_borer"
]

# Function to preprocess image
def preprocess_image(image):
    image = image.resize((224, 224))  # Resize to match model input
    image = np.array(image) / 255.0  # Normalize
    image = np.expand_dims(image, axis=0)  # Add batch dimension
    return image

@app.route('/predict', methods=['POST'])
def predict():
    try:
        if 'file' not in request.files:
            return jsonify({'error': 'No file provided'}), 400

        file = request.files['file']
        image = Image.open(io.BytesIO(file.read()))  

        # 🔹 Preprocess image
        input_array = preprocess_image(image)

        # 🔹 Get model prediction
        prediction = model.predict(input_array)[0]

        # 🔹 Print confidence for debugging
        print(f"Prediction Confidence Scores: {prediction}")

        # 🔹 Get class name
        predicted_class = CLASS_NAMES[np.argmax(prediction)]
        confidence = float(np.max(prediction))  # 🔹 Extract max confidence

        return jsonify({'prediction': predicted_class, 'confidence': confidence})

    except Exception as e:
        return jsonify({'error': str(e)}), 400


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
