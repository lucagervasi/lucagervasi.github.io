
{{- define "name" -}}
  {{- .Values.nameOverride | default .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "chart" -}}
  {{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "labels" -}}
app.kubernetes.io/name: {{ include "name" . | quote}}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
app.kubernetes.io/version: {{ .Chart.AppVersion | default .Chart.Version | quote }}
app.kubernetes.io/managed-by: {{ .Values.managedBy | default .Release.Service | quote }}
helm.sh/chart: {{ include "chart" . | quote }}
it.rcs/farm: {{ required "Missing value: farm" .Values.farm | quote }}
it.rcs/cluster: {{ required "Missing value: cluster" .Values.cluster | quote }}
{{- end -}}

{{- define "quoteMap" -}}
{{- range $k, $v := . }}
{{ $k }}: {{ $v | quote }}
{{- end -}}
{{- end -}}

{{- define "quoteMapKeys" -}}
{{- range $k, $v := . }}
{{ $k | quote }}: {{ $v | quote }}
{{- end -}}
{{- end -}}

{{- define "quoteArray" -}}
{{- range . }}
- {{ . | trim | quote -}}
{{- end -}}
{{- end -}}

{{- define "applicationidentifier" -}}
  {{ $name := include "name" . }}
  {{- printf "%s-%s" .Release.Namespace $name | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{- define "negport" -}}
  {{- printf "{\"%s\":" -}}
  {{- printf "{\"%s\": {\"name\": \"%s-%s-%s-neg\"} } }" . .Values.cluster (include "applicationidentifier" .) . -}}
{{- end -}}