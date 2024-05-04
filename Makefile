.PHONY: serve serve-dev

serve-dev: .make/poetry_install
	poetry run eidolon-server -m local_dev resources

serve: .make/poetry_install
	poetry run eidolon-server resources

.make:
	@mkdir -p .make

.make/poetry_install: .make poetry.lock
	poetry install
	poetry env use 3.11
	@touch .make/poetry_install

poetry.lock: pyproject.toml
	@poetry lock --no-update
	@touch poetry.lock

%:
	@: