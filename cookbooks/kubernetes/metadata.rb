name 'kubernetes'
maintainer 'Tarak Patel'
maintainer_email 'pateltarak3@gmail.com'
license 'All Rights Reserved'
description 'Installs/Configures kubernetes'
version '1.0.0'
chef_version '>= 15.0'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/kubernetes/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/kubernetes'
depends 'selinux' 
depends 'yumgroup' 
depends 'resolver' 
depends 'firewalld' 

