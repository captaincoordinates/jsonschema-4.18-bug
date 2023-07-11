from json import load

from jsonschema import validate, RefResolver


def validate_against_schema(document_path: str, schema_path: str) -> None:
    with open(document_path, "r") as f:
        document = load(f)
    with open(schema_path, "r") as f:
        schema = load(f)
    try:
        validate(
            instance=document,
            schema=schema,
            resolver=RefResolver(
                base_uri=f"file://{schema_path}",
                referrer=schema,
            ),
        )
    except Exception as e:
        print(e)
        exit(1)


if __name__ == "__main__":
    validate_against_schema(
        document_path="/schema/a.schema.json",
        schema_path="/schema/core-meta.schema.json",
    )
