name 'littleobi-base-linux'
maintainer 'Tarak Patel'
maintainer_email 'pateltarak3@gmail.com'
license 'All Rights Reserved'
description 'Installs/Configures littleobi-base-linux'
version '0.1.0'
chef_version '>= 15.0'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/littleobi-base-linux/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/littleobi-base-linux'

depends 'yumgroup'
depends 'selinux'

depends 'linux_patching'
depends 'resolver'
depends 'firewalld'
depends 'yum-centos'

depends 'yum'