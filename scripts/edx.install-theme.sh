#!/bin/bash

cd /root
rm -rf edx.conf-ecampusafrique
rm -rf /edx/app/edxapp/edx-platform/themes/ecampusafrique

git clone https://github.com/ecampusafrique/edx.conf-ecampusafrique.git
chown edxapp -R edx.conf-ecampusafrique
chgrp www-data -R edx.conf-ecampusafrique

# Install json config files
cp /root/edx.conf-ecampusafrique/conf/lms.env.json /edx/app/edxapp/lms.env.json
cp /root/edx.conf-ecampusafrique/conf/lms.auth.json /edx/app/edxapp/lms.auth.json
cp /root/edx.conf-ecampusafrique/conf/cms.env.json /edx/app/edxapp/cms.env.json
cp /root/edx.conf-ecampusafrique/conf/cms.auth.json /edx/app/edxapp/cms.auth.json

chmod 644 /edx/app/edxapp/*.env.json
chmod 755 /edx/app/edxapp/*.auth.json

# Install custom themes
sudo cp -R /root/edx.conf-ecampusafrique/themes /edx/app/edxapp/edx-platform/
sudo chown edxapp -R /edx/app/edxapp/edx-platform/themes
sudo chgrp edxapp -R /edx/app/edxapp/edx-platform/themes


#/edx/bin/supervisorctl restart lms
#/edx/bin/supervisorctl restart cms
#/edx/bin/supervisorctl restart edxapp_worker:
