{{- define "backend.labels"}}
app: {{ .Release.Name }}
tier: backend
version: {{ .Chart.AppVersion }}
{{- end}}

{{- /* Function for database environment variables in the external service */ -}}
{{- define "back-es.envVars" -}}
{{- range .Values.backend.envVariables }}
  - secretKey: {{ . }}
    remoteRef:
      key: kv/campi
      property: {{ . }}
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


{{- define "vault.targetSecret" -}}
{{ .Values.vault.targetSecret }}
{{- end -}}

{{- /* Function for database environment variables */ -}}
{{- define "db.envVars" -}}
{{- $targetSecret := include "vault.targetSecret" . }}
{{- range .Values.database.envVariables }}
  - name: {{ . }}
    valueFrom:
      secretKeyRef:
        name: {{ $targetSecret }} 
        key: {{ . }}
{{- end }}
{{- end -}}

{{- /* Function for backend environment variables */ -}}
{{- define "back.envVars" -}}
{{- $targetSecret := include "vault.targetSecret" . }}
{{- range .Values.backend.envVariables }}
  - name: {{ . }}
    valueFrom:
      secretKeyRef:
        name: {{ $targetSecret }}
        key: {{ . }}
{{- end }}
{{- end -}}

{{- /* Function for database environment variables in the external service */ -}}
{{- define "bd-es.envVars" -}}
{{- range .Values.database.envVariables }}
  - secretKey: {{ . }}
    remoteRef:
      key: kv/campi
      property: {{ . }}
{{- end }}
{{- end -}}