.PHONY: clean train-nlu train-core cmdline server

TEST_PATH=./

help:
	@echo "- train-nlu:"
	@echo "    训练NLU"
	@echo "- train-core:"
	@echo "    训练CORE"
	@echo "- train-interactive:"
	@echo "    交互性训练"
	@echo "- run-core:"
	@echo "    命令行运行:"
	@echo "- run-web:"
	@echo "    网页运行"



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

run-web:
	make run-server&
	make run-view

train-nlu:
	python -m rasa_nlu.train -c config/nlu_config.json --data data/nlu_data.json -o models --fixed_model_name nlu --project current --verbose

train-core:
	python -m rasa_core.train -d data/domain.yml -s data/stories.md -o models/current/dialogue -c config/policies.yml
	
run-actions:
	python -m rasa_core_sdk.endpoint --actions actions
	
run-core:
	python -m rasa_core.run --nlu models/current/nlu --core models/current/dialogue --endpoints endpoints.yml

train-interactive:
	python -m rasa_core.train interactive --core models/current/dialogue --nlu models/current/nlu --endpoints endpoints.yml

run-server:
	python bot.py

run-view:
	python view/manage.py runserver 0.0.0.0:8000



