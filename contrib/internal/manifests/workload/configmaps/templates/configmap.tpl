{{- $name:= .Values.namePattern }}
{{- $namespace:= .Values.namespace }}
{{- $valueSize:= .Values.valueSize }}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ $name }}
  namespace: {{ $namespace }}
  labels:
    app: kperf-benchmark
data:
  data-key: {{ printf "%0*s" $valueSize "x" }}