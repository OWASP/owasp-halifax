.PHONY: all

PYTHON_VERSION=$(shell python -c 'import sys; print("%i" % (sys.hexversion<0x03000000))')

all: deps lint site

deps:
	bundle install --quiet
	npm install
	cp -r node_modules/bootstrap/dist/ assets/lib/bootstrap/
	cp -r node_modules/popper.js/dist/ assets/lib/popper.js/
	cp -r node_modules/jquery/dist/ assets/lib/jquery/
	cp -r node_modules/fullcalendar/dist/ assets/lib/fullcalendar/
	cp -r node_modules/moment/min/ assets/lib/moment/
	cp -r node_modules/qtip2/dist/ assets/lib/qtip2/
site:
	jekyll build -q
	./build.sh

serve:
	cd _site/ && \
		if [ ${PYTHON_VERSION} -eq 0 ]; then \
			python3 -m http.server 4000; \
		else \
			python2 -m SimpleHTTPSever 4000; \
		fi

lint:
	find . -name _site -prune -o -name '*.html' | xargs -I {} htmlhint {}
	find assets/pages/ assets/lib/theme/ -name _site -prune -o -name '*.js' | xargs -I {} jshint {}

clean:
	rm -rf _site/
	rm -rf node_modules/
	rm -f package-lock.json
	rm -f Gemfile.lock
	cd assets/lib/ && \
		rm -rf bootstrap/ && \
		rm -rf popper.js/ && \
		rm -rf jquery/ && \
		rm -rf fullcalendar/ && \
		rm -rf moment/ && \
		rm -rf qtip2/
