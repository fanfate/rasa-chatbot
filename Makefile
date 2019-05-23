.PHONY: clean train-nlu train-core cmdline server

TEST_PATH=./

help:
	@echo "    clean"
	@echo "        Remove python artifacts and build artifacts."
	@echo "    train-nlu"
	@echo "        Trains a new nlu model using the projects Rasa NLU config"
	@echo "    train-core"
	@echo "        Trains a new dialogue model using the story training data"
	@echo "    action-server"
	@echo "        Starts the server for custom action."
	@echo "    cmdline"
	@echo "       This will load the assistant in your terminal for you to chat."


clean:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f  {} +
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info
	rm -rf docs/_build

run:
	make run-actions&
	make run-core

run-api:
	make run-actions&
	make run-http

train-nlu:
	python -m rasa_nlu.train -c config/nlu_config.json --data data/nlu_data.json -o models --fixed_model_name nlu --project current --verbose

train-core:
	python -m rasa_core.train -d data/domain.yml -s data/stories.md -o models/current/dialogue -c config/policies.yml
	
run-actions:
	python -m rasa_core_sdk.endpoint --actions actions
	
run-http:
	python -m rasa_core.run --enable_api -d models/current/dialogue -u models/current/nlu --endpoints endpoints.yml

run-core:
	python -m rasa_core.run --nlu models/current/nlu --core models/current/dialogue --endpoints endpoints.yml
	
run-online:
	python -m rasa_core.train --online -o models/current/dialogue -d data/domain.yml -s data/stories.md --endpoints endpoints.yml

cmdline:
	python -m rasa_core.run -d models/current/dialogue -u models/current/nlu --endpoints endpoints.yml
	
action-server:
	python -m rasa_core_sdk.endpoint --actions actions

nlu-server:
	python -m rasa_nlu.server -c config/nlu_config.yml --path models

train-interactive:
	python -m rasa_core.train interactive --core models/current/dialogue --nlu models/current/nlu --endpoints endpoints.yml



