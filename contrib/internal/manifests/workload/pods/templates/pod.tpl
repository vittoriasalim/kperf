apiVersion: v1
kind: Pod
metadata:
  name: {{ .Values.namePattern }}
  namespace: {{ .Values.namespace }}
  labels:
    app: fake-pod
spec:
  containers:
    - name: fake-container
      image: fake-image
