######################################################################

### current login user
w
who

### login/logout history
last

### login failure info
lastb

### password expiration date
chage -l root
chage -l ${USER}

######################################################################

groupadd --gid ${GROUP_ID} ${GROUP_NAME}
useradd --uid ${USER_ID} --gid ${GROUP_ID} --create-home --home-dir ${HOME_DIRECTORY} ${USER_NAME} --shell /bin/bash
useradd --uid ${USER_ID} --user-group --create-home --home-dir ${HOME_DIRECTORY} ${USER_NAME} --shell /bin/bash
useradd --uid ${USER_ID} --gid ${GROUP_ID} --create-home --home-dir ${HOME_DIRECTORY} ${USER_NAME} --password ${PASSWORD} --shell /bin/bash
