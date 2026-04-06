######################################################################

pnpm install -g @typespec/compiler

tsp --version

tsp code install

######################################################################

tsp init
tsp format **/*.tsp

tsp compile main.tsp
tsp compile main.tsp --output-dir .

