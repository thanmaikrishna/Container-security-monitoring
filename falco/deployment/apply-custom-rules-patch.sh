kubectl patch daemonset falco -n falco \
--type=json \
-p='[
  {
    "op": "add",
    "path": "/spec/template/spec/volumes/-",
    "value": {
      "name": "falco-custom-rules",
      "configMap": {
        "name": "falco-custom-rules"
      }
    }
  },
  {
    "op": "add",
    "path": "/spec/template/spec/containers/0/volumeMounts/-",
    "value": {
      "name": "falco-custom-rules",
      "mountPath": "/etc/falco/falco_rules.local.yaml",
      "subPath": "custom-rules.yaml"
    }
  }
]'
