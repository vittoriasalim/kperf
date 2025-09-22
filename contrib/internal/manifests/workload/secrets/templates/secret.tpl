{{- $name:= .Values.namePattern }}
{{- $namespace:= .Values.namespace }}
{{- $valueSize:= .Values.valueSize }}
apiVersion: v1
kind: Secret
metadata:
  name: {{ $name }}
  namespace: {{ $namespace }}
  labels:
    app: kperf-benchmark
type: Opaque
data:
  {{- range $index := until 10 }}
  key-{{ $index }}: {{ printf "%0*s" $valueSize "eA==" | b64enc }}
  {{- end }}