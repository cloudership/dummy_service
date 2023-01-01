# Dummy Service

This service provides one endpoint returns an empty 200 response. It is used for testing
and development purposes.

# Run

```shell
poetry init # first time only

poetry run python dummy.py
```

Access the OpenAPI UI at http://127.0.0.1:5000/ui/

# Use

Once initialized, invoke it:

```shell
curl --include http://localhost:5000/
```
