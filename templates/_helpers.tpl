{{- define "imagePullSecret" }}
{{- if .Values.imageCredentials }}
{{- with .Values.imageCredentials }}
{{- printf "{\"auths\":{\"%s\":{\"username\":\"%s\",\"password\":\"%s\",\"email\":\"%s\",\"auth\":\"%s\"}}}" .registry .username .password .email (printf "%s:%s" .username .password | b64enc) | b64enc }}
{{- end }}
{{- else }}
{{- printf "{}" | b64enc }}
{{- end }}
{{- end }}