serve:
	@echo 'Run application'
	uvicorn app.main:app --reload --host 0.0.0.0 --port 8000

add-test-deps:
	@echo 'Add packages to test application'
	poetry add pytest httpx mypy pylint --group test

run-tests:
	@echo 'Run tests'
	poetry run pytest

run-type:
	@echo 'Run typing check'
	poetry run mypy ./

run-lint:
	@echo 'Run pylint'
	poetry run pylint ./app

prod-install:
	@echo 'Install dependencies without tests'
	poetry install --without test

docker-build:
	@echo 'Build docker image'
	docker build . --tag prod-fastapi

docker-run:
	@echo 'Run docker image'
	docker run -p 8000:8000 --env-file .env prod-fastapi