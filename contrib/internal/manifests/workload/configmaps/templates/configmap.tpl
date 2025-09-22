{{- $name:= .Values.namePattern }}
{{- $namespace:= .Values.namespace }}
{{- $valueSize:= .Values.valueSize }}
{{- $randomData:= .Values.randomData }}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ $name }}
  namespace: {{ $namespace }}
  labels:
    app: kperf-benchmark
data:
  {{- if $randomData }}
  data-key: {{ $randomData }}
  {{- else }}
  data-key: {{ printf "%0*s" $valueSize "x" }}
  {{- end }}