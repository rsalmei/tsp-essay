SHORTEN_LOGS=b=r'^    exchanging \d+-\d+.+\n';\
s=open('README.md').read();\
import re;\
s=re.sub(f'({b})(?:{b})+({b})', r'\1    ...\n\2', s, flags=re.MULTILINE);\
open('README.md', 'w').write(s)

all:
	@grep "^\w.*:" makefile | cut -d: -f1

convert: tsp_essay.ipynb
	jupyter nbconvert --to markdown --output README.md tsp_essay.ipynb

build: convert
	python -c "$(SHORTEN_LOGS)"
