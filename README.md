Paddy Disease Image Classification using Jetson Nvidia
Submitted by
S. Dheeraj Varma (22bcs125)
N. Vivek Reddy (22bcs076)

M. Karthikeya (22bcs073)

Under the Guidance of
Dr. Pavan Kumar C, Assistant Professor
Department of Computer Science and Engineering, IIIT Dharwad

📅 Submission Date
20/04/2025

📖 Project Overview
Paddy is a major staple crop in Asia, but its cultivation is constantly threatened by diseases and pests, leading to significant yield loss. Traditional manual inspection methods for disease detection are slow, inconsistent, and often inaccessible to farmers.

With advancements in artificial intelligence and deep learning, automated plant disease detection offers a scalable and efficient solution. This project introduces an AI-powered paddy disease classifier using deep learning techniques. A dataset of over 16,000 high-resolution images was used, covering 14 classes (13 disease conditions + healthy leaves).

Different architectures were explored, with Xception achieving the highest performance:

Training Accuracy: 99.6%

Validation Accuracy: 97.45%

The final solution was deployed on an AWS EC2 instance, coupled with a simple web app for real-time disease predictions. Additionally, edge deployment was tested on the NVIDIA Jetson Nano to support offline use in remote areas.

📚 Related Work
Previous research shows that deep learning models outperform traditional manual inspection methods for crop disease classification. CNNs and transfer learning approaches have shown high accuracy in crops like tomato, maize, and rice.

Key insights from related works:

Transfer learning using models like ResNet34, MobileNetV2, Xception, and ConvTix achieved high F1-scores.

Vision Transformers (ViT) and hybrid CNN-attention models achieved classification accuracies above 99%.

Object detection models like YOLOv8 have been used for region-specific disease diagnostics.

Our project builds upon these approaches, selecting Xception for its superior balance of accuracy and computational efficiency.

📂 Dataset
Name: Paddy Doctor Dataset (Open-Sourced)

Size: 16,430 high-resolution images (1080 × 1440 pixels)

Classes: 14 total (13 diseases + 1 healthy class)

Disease Labels:
Bacterial Leaf Blight

Bacterial Leaf Streak

Bacterial Panicle Blight

Black Stem Borer

Blast

Brown Spot

Downy Mildew

Hispa

Leaf Roller

Tungro

White Stem Borer

Yellow Stem Borer

Normal (Healthy)

🛠️ Methods
Models Evaluated:
Model	Training Accuracy	Validation Accuracy
CNN (Baseline)	92%	90%
MobileNetV2	96%	95%
ConvTix	99.6%	96.6%
Xception	99.6%	97.45%

Approach:
Fine-Tuning: Unfroze most layers of Xception for better learning on our dataset.

Feature Extraction: Initial experiments with frozen layers showed slightly lower performance.

Deployment: The trained Xception model was deployed on AWS EC2 (t3.medium) and integrated with a web app for easy access.

Edge Deployment:
Implemented on NVIDIA Jetson Nano using TensorFlow Lite for real-time, offline predictions.

Despite hardware constraints, Jetson Nano achieved efficient inference, making it suitable for remote agricultural areas.

📊 Performance Metrics
Validation Accuracy: 97.45%

Precision, Recall, F1-Score: High across all classes

Inference Speed: Suitable for real-time applications

📱 Application Features
Upload or scan paddy leaf images

Instant disease identification

Disease-specific prevention and treatment tips

Cloud-backed inference via AWS

Planned future enhancements:

Grad-CAM visualizations for affected region highlighting

Multilingual and voice-based support

Mobile and edge device optimization

Feedback-based learning for continuous model improvement

📚 References
IEEE - Plant Disease Detection

Xception Paper (ArXiv)

ConvTix (ArXiv)

TensorFlow Official

AWS EC2

Paddy Leaf Disease Detection (ResearchGate)

IEEE - Paddy Disease Classification

