######################################################################

### hsts (after 12.2.1.4 / other releases require psu)
JAVA_OPTIONS="${JAVA_OPTIONS} -Dweblogic.http.headers.enableHSTS=true"
JAVA_OPTIONS="${JAVA_OPTIONS} -Dweblogic.http.headers.hsts.maxage=<max-age-seconds>"
JAVA_OPTIONS="${JAVA_OPTIONS} -Dweblogic.http.headers.hsts.includesubdomains=true"
JAVA_OPTIONS="${JAVA_OPTIONS} -Dweblogic.http.headers.hsts.preload=true"
