######################################################################

function fd() { echo "+ fd ${@}">&2; command fd "${@}"; }
function rg() { echo "+ rg ${@}">&2; command rg "${@}"; }
