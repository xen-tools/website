all:
	wmk -a .

clean:
	find . -name '*.html' -type f -exec rm -v '{}' ';'
