.PHONY: all

all: deps site

deps:
	npm install
	cp -r node_modules/bootstrap/dist/ assets/lib/bootstrap/
	cp -r node_modules/popper.js/dist/ assets/lib/popper.js/
	cp -r node_modules/jquery/dist/ assets/lib/jquery/

site:
	jekyll build

serve:
	jekyll serve

clean:
	rm -rf _site/
	rm -rf node_modules/
	rm -f package-lock.json
	cd assets/lib/ && \
		rm -rf bootstrap/ && \
		rm -rf popper.js/ && \
		rm -rf jquery/
