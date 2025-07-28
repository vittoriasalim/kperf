{{- $namePattern := .Values.namePattern }}
{{- $namespace := .Values.namespace}}
apiVersion: v1
kind: Pod
metadata:
  name: {{ $namePattern }}
  namespace: {{$namespace}}
  labels:
    app: fake-pod
spec:
  restartPolicy: Never
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
          - matchExpressions:
              - key: type
                operator: In
                values:
                  - kperf-virtualnodes
  tolerations:
    - key: "kperf.io/nodepool"
      operator: "Exists"
      effect: "NoSchedule"
  containers:
    - name: fake-container
      image: fake-image
---
{{- end }}
