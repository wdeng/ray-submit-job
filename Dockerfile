FROM python:3.10.10-alpine3.17 as base_image
WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY ./src .

EXPOSE 8265

CMD ["python3"]

# ray job submit -- python my_script.py --arg=val
# https://docs.ray.io/en/latest/cluster/running-applications/job-submission/cli.html
# raycluster-autoscaler-head-svc.default # "ray://<app_name>-ray-head:10001" service name
# CMD ["ray job submit", "--address", "http://raycluster-autoscaler-head-svc.default:8265", "--", "python", "src/pytorch_training_e2e_submit.py"]