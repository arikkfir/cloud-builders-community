# bash-curl-jq

This build step provides a ready-made image with `curl` and `jq` built-in. This can be useful for requesting URLs and post-processing their JSON response with `jq`.

## Examples

#### Standalone

```bash
$ docker run gcr.io/${PROJECT_ID}/bash-curl-jq "curl -sSL https://jsonplaceholder.typicode.com/todos/1 | jq -r '.title'"
```

#### Build step

```yaml
steps:
- name: "gcr.io/$PROJECT_ID/bash-curl-jq"
  args: ["curl -sSL https://jsonplaceholder.typicode.com/todos/1 | jq -r '.title' > title.txt"]
- name: ubuntu
  args: ["cat", "title.txt"]
```

## Building this builder

To build this builder, run the following command in this directory.

    $ gcloud builds submit . --config=cloudbuild.yaml
