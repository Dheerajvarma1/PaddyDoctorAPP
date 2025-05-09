import requests

url = "http://127.0.0.1:5000/predict"
files = {"file": open("PDD02114.jpg", "rb")}  # Ensure the image file exists

response = requests.post(url, files=files)
print(response.json())  # Expected output: {'prediction': 'blast', 'confidence': 0.97}
