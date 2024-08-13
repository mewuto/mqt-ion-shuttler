.PHONY: build
build:
	docker build --no-cache -t mqt_shuttler .

run:
	docker run -p 9000:8888 -v $(shell pwd):/home/jovyan/work -d --name mqt_shuttler_container mqt_shuttler

clean:
	docker rm -f mqt_shuttler_container
	docker rmi mqt_shuttler

# jn:
# 	jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root

# get_token:
# 	docker logs mqt_shuttler_container
