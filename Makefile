all:
	wmk

clean:
	find . -name '*.html' -type f -exec rm -v '{}' ';'
