{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "configmapcontroller.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "configmapcontroller.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "configmapcontroller.labels.selector" -}}
app: {{ template "configmapcontroller.name" . }}
group: {{ .Values.configMapController.labels.group }}
provider: {{ .Values.configMapController.labels.provider }}
{{- end -}}

{{- define "configmapcontroller.labels.stakater" -}}
{{ template "configmapcontroller.labels.selector" . }}
version: "{{ .Values.configMapController.labels.version }}"
{{- end -}}

{{- define "configmapcontroller.labels.chart" -}}
chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
release: {{ .Release.Name | quote }}
heritage: {{ .Release.Service | quote }}
{{- end -}}
