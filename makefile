
all:
	@grep "^\w.*:" makefile | cut -d: -f1

build:
	jupyter nbconvert --to markdown --output README.md tsp_essay.ipynb
