# Common contributor commands. Requires uv (https://docs.astral.sh/uv/).
# Run `make help` for the list of targets.

UV ?= uv

.PHONY: help install test test-all lint format format-check check run

help:
	@echo "ORION development targets"
	@echo "  make install       Install project + dev extras (uv sync)"
	@echo "  make test          Run tests, skip network-marked ones (CI default)"
	@echo "  make test-all      Run the full pytest suite"
	@echo "  make lint          Ruff lint"
	@echo "  make format        Ruff format (writes files)"
	@echo "  make format-check  Ruff format --check (CI)"
	@echo "  make check         lint + format-check + test (matches CI)"
	@echo "  make run           Start ORION (uv run orion)"

install:
	$(UV) sync

test:
	$(UV) run pytest -m "not network"

test-all:
	$(UV) run pytest

lint:
	$(UV) run ruff check .

format:
	$(UV) run ruff format .

format-check:
	$(UV) run ruff format --check .

check: lint format-check test

run:
	$(UV) run orion
