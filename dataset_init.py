from domino import Domino
import os

domino = Domino(f"{os.environ['DOMINO_PROJECT_OWNER']}/{os.environ['DOMINO_PROJECT_NAME']}")

# Create domino datasets

# Required Datasets & Descriptions
REQUIRED = {
    "ADAM": "ADAM is created using SDTM data for production",
    "ADAMQC": "ADAMQC is created using SDTM data for qc",
    "TFL": "TFL is created using ADAM for production tfls",
    "TFLQC": "TFLQC is created using ADAM for qc tfls"
}

# Existing Datasets
CURRENT = set(d['datasetName'] for d in domino.datasets_list(project_id=os.environ["DOMINO_PROJECT_ID"]))

# For any required datasets which do not exist 
for key in set(REQUIRED.keys()).difference(CURRENT):
    # Make them
    domino.datasets_create(key, REQUIRED[key])
