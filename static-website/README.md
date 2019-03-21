# GitHub Action for deploying to a Static Website in Azure Storage

To log into a Azure, we recommend using the [Azure Login](https://github.com/Azure/github-actions/tree/master/login) Action.


## Usage

```

action "Deploy Static Website to Azure Storage" {
  uses = "Azure/github-actions/static-website@master"
  needs = ["Azure Login"]
  env = {
    AZURE_STORAGE_ACCOUNT = "<Azure Storage Account>"
    SAS_TOKEN = "<SAS Token>"
    AZURE_STORAGE_KEY = "<Azure Storage Account Key>"
  }
}

```




### Environment variables

- `AZURE_STORAGE_ACCOUNT` – **Required** 
- One of the following:
    - `SAS_TOKEN`
    - `AZURE_STORAGE_KEY`
