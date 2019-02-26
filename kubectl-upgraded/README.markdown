# kubectl-upgraded cloud builder

This builder extends the standard `gcr.io/cloud-builders/kubectl` with an upgraded `kubectl` installation. 

This is required for features in `kubectl` that are not yet available in the `kubectl` version installed by `gcloud` (`1.10.x`).

### Building this builder
To build this builder, run the following command in this directory.
```sh
$ gcloud builds submit --config=cloudbuild.yaml .
```

## Using this builder

Use this the same as you would use `gcr.io/cloud-builders/kubectl`, simply replace the image name with `gcr.io/${PROJECT_ID}/kubectl-upgraded` after you've built this image.
