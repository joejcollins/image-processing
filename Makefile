# Consistent set of make tasks.
.DEFAULT_GOAL:=help  # because it's is a safe task.

ENV_NAME = aqua-marina

clean: # Remove the environment.
	conda remove --name $(ENV_NAME) --all --yes
	rm -rf *.egg-info
	find . -name "*.pyc" -exec rm -f {} \;
	find . -type f -name "*.py[co]" -delete -or -type d -name "__pycache__" -delete

env: # Create a environment or if is it there already, add the local package.
	conda init
	-conda env create --file environment.yml
	conda run --name $(ENV_NAME) pip install --editable .

.PHONY: help
help: # Show help for each of the makefile recipes.
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

report:  # Environment report
	conda info
	conda list --name $(ENV_NAME)
	conda run --name $(ENV_NAME) pip list -v

test: # Run the tests in the conda environment.
	conda run --name $(ENV_NAME) pytest ./tests
