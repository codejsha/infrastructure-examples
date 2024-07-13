######################################################################

choco install -y $package

choco uninstall -y $package

choco list --local-only

choco upgrade --confirm all
