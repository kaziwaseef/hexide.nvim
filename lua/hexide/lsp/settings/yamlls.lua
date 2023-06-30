return  {
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.24.0-standalone-strict/all.json"] = "/*.k8s.yaml",
      },
    },
  }
}
