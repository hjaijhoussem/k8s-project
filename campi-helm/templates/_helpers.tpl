{{- define "backend.labels"}}
app: {{ .Release.Name }}
tier: backend
version: {{ .Chart.AppVersion }}
{{- end}}

{{- /* Function for backend environment variables */ -}}
{{- define "back.envVars" -}}
{{- range .Values.backend.envVariables }}
  - name: {{ .name }}
    value: "{{ .value }}"
{{- end }}
{{- end -}}

{{- define "frontend.labels"}}
app: {{ .Release.Name }}
tier: frontend
version: {{ .Chart.AppVersion }}
{{- end}}

{{- define "database.labels"}}
app: {{ .Release.Name }}
tier: database
version: {{ .Chart.AppVersion }}
{{- end}}

{{- /* Function for database environment variables */ -}}
{{- define "db.envVars" -}}
{{- range .Values.database.envVariables }}
  - name: {{ .name }}
    value: "{{ .value }}"
{{- end }}
{{- end -}}