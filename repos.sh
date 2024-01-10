#!/bin/bash
ODOO_VERSION=13.0
DEPTH_DEFAULT=1
ADDONS_PATH=./addons

# ecovis bank management
git clone https://github.com/xfacundoperez/odoo-addons-ac.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/odoo-addons-ac

# oca-reporting-engine
git clone https://github.com/oca/reporting-engine.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/oca-reporting-engine

# server-auth
git clone https://github.com/OCA/server-auth.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/server-auth