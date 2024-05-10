.PHONY: build_container
build_container:
	podman build -t mambaenv:latest .

.PHONY: run_container
run_container:
	podman run -it --rm --device nvidia.com/gpu=all --ipc=host -v $(shell pwd):/mnt mambaenv:latest

.PHONY: install
install:
	pip install -e .

.PHONY: lock
install:
	conda-lock -f environment.yml -p linux-64
