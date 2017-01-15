<<<<<<< HEAD
## Packer Templates

### Pre-requirements

#### Feel free to aquire packages from [all_apps.json](apps/all_apps.json)

* jq
* awscli
* docker
* packer
* ansible
* direnv

### How it works

1. All `env` variables should be placed in `.envrc` in the root directory.
2. `direnv` will execute `.envrc` as shell script when you `cd` in.
3. Your modified `env` variables persists 'till you exited out.
4. `make <smth>` with `@{CD} && command` is a some kind of cheating `direnv` vars keeper,
  allowing env vars to be implicitly overrided in a command's runtime.

#### Read carefuly

* [Makefile](Makefile)
* [cassandra.json](apps/cassandra/cassandra.json)

##### Sample .envrc

```console
# aws variables
AWS_ACCOUNT_ID=
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_DEFAULT_REGION=
AMI_NAME=cassandra
AMI_NAME_PREFIX=dev
AMI_BASE_IMAGE=
AMI_SSH_USERNAME=ec2-user
AMI_SSH_TIMEOUT=2m
AMI_BUILDER_INSTANCE_TYPE=m3.large
APP_NAME=cassandra
APP_VERSION=3.9
export "${!AWS_@}"
export "${!AMI_@}"
export "${!APP_@}"

# vim: filetype=sh
```

### Better to taste with

* [JSON Editor Online](http://www.jsoneditoronline.org)
* [JQ Playground](https://jqplay.org)

### Sample output

```console
kyxap@workbench:~/cassandra-packer$ make validate
Template validated successfully.
kyxap@workbench:~/cassandra-packer$ make build
amazon-ebs output will be in this color.

==> amazon-ebs: Force Deregister flag found, skipping prevalidating AMI Name
    amazon-ebs: Found Image ID: ami-4d87fc5a
==> amazon-ebs: Creating temporary keypair: packer_587aba07-f201-39de-5bb0-c72736afb15c
==> amazon-ebs: Creating temporary security group for this instance...
==> amazon-ebs: Authorizing access to port 22 the temporary security group...
==> amazon-ebs: Launching a source AWS instance...
    amazon-ebs: Instance ID: i-058885b26b4d3fddd
==> amazon-ebs: Waiting for instance (i-058885b26b4d3fddd) to become ready...
==> amazon-ebs: Waiting for SSH to become available...
==> amazon-ebs: Connected to SSH!
==> amazon-ebs: Provisioning with shell script: /tmp/packer-shell952343680
==> amazon-ebs: Uploading files/. => /opt/scripts
==> amazon-ebs: Provisioning with shell script: /tmp/packer-shell454024263
    amazon-ebs: + yum install -yy yum-utils psmisc procps util-linux xfsprogs java-1.8.0-openjdk-devel
    amazon-ebs: Loaded plugins: priorities, update-motd, upgrade-helper
    amazon-ebs: Package yum-utils-1.1.31-34.28.amzn1.noarch already installed and latest version
    amazon-ebs: Package psmisc-22.20-8.12.amzn1.x86_64 already installed and latest version
    amazon-ebs: Package procps-3.2.8-30.14.amzn1.x86_64 already installed and latest version
    amazon-ebs: Package util-linux-2.23.2-26.27.amzn1.x86_64 already installed and latest version
    amazon-ebs: Resolving Dependencies
    amazon-ebs: --> Running transaction check
    amazon-ebs: ---> Package java-1.8.0-openjdk-devel.x86_64 1:1.8.0.111-1.b15.25.amzn1 will be installed
    amazon-ebs: --> Processing Dependency: java-1.8.0-openjdk = 1:1.8.0.111-1.b15.25.amzn1 for package: 1:java-1.8.0-openjdk-devel-1.8.0.111-1.b15.25.amzn1.x86_64
    amazon-ebs: --> Processing Dependency: libawt_xawt.so(SUNWprivate_1.1)(64bit) for package: 1:java-1.8.0-openjdk-devel-1.8.0.111-1.b15.25.amzn1.x86_64
    amazon-ebs: --> Processing Dependency: libawt_xawt.so()(64bit) for package: 1:java-1.8.0-openjdk-devel-1.8.0.111-1.b15.25.amzn1.x86_64
    amazon-ebs: ---> Package xfsprogs.x86_64 0:3.2.2-2.20.amzn1 will be installed
    amazon-ebs: --> Running transaction check
    amazon-ebs: ---> Package java-1.8.0-openjdk.x86_64 1:1.8.0.111-1.b15.25.amzn1 will be installed
    amazon-ebs: --> Processing Dependency: java-1.8.0-openjdk-headless = 1:1.8.0.111-1.b15.25.amzn1 for package: 1:java-1.8.0-openjdk-1.8.0.111-1.b15.25.amzn1.x86_64
    amazon-ebs: --> Running transaction check
    amazon-ebs: ---> Package java-1.8.0-openjdk-headless.x86_64 1:1.8.0.111-1.b15.25.amzn1 will be installed
    amazon-ebs: amzn-main/latest/filelists_db                            | 5.1 MB     00:00
    amazon-ebs: amzn-updates/latest/filelists_db                         | 2.0 MB     00:00
    amazon-ebs: --> Processing Dependency: lksctp-tools for package: 1:java-1.8.0-openjdk-headless-1.8.0.111-1.b15.25.amzn1.x86_64
    amazon-ebs: --> Running transaction check
    amazon-ebs: ---> Package lksctp-tools.x86_64 0:1.0.10-7.7.amzn1 will be installed
    amazon-ebs: --> Finished Dependency Resolution
    amazon-ebs:
    amazon-ebs: Dependencies Resolved
    amazon-ebs:
    amazon-ebs: ================================================================================
    amazon-ebs: Package                   Arch   Version                    Repository    Size
    amazon-ebs: ================================================================================
    amazon-ebs: Installing:
    amazon-ebs: java-1.8.0-openjdk-devel  x86_64 1:1.8.0.111-1.b15.25.amzn1 amzn-updates  12 M
    amazon-ebs: xfsprogs                  x86_64 3.2.2-2.20.amzn1           amzn-main    1.7 M
    amazon-ebs: Installing for dependencies:
    amazon-ebs: java-1.8.0-openjdk        x86_64 1:1.8.0.111-1.b15.25.amzn1 amzn-updates 227 k
    amazon-ebs: java-1.8.0-openjdk-headless
    amazon-ebs: x86_64 1:1.8.0.111-1.b15.25.amzn1 amzn-updates  39 M
    amazon-ebs: lksctp-tools              x86_64 1.0.10-7.7.amzn1           amzn-main     89 k
    amazon-ebs:
    amazon-ebs: Transaction Summary
    amazon-ebs: ================================================================================
    amazon-ebs: Install  2 Packages (+3 Dependent packages)
    amazon-ebs:
    amazon-ebs: Total download size: 53 M
    amazon-ebs: Installed size: 146 M
    amazon-ebs: Downloading packages:
    amazon-ebs: (1/5): java-1.8.0-openjdk-1.8.0.111-1.b15.25.amzn1.x86_6 | 227 kB     00:00
    amazon-ebs: (2/5): java-1.8.0-openjdk-devel-1.8.0.111-1.b15.25.amzn1 |  12 MB     00:00
    amazon-ebs: (3/5): java-1.8.0-openjdk-headless-1.8.0.111-1.b15.25.am |  39 MB     00:00
    amazon-ebs: (4/5): lksctp-tools-1.0.10-7.7.amzn1.x86_64.rpm          |  89 kB     00:00
    amazon-ebs: (5/5): xfsprogs-3.2.2-2.20.amzn1.x86_64.rpm              | 1.7 MB     00:00
    amazon-ebs: --------------------------------------------------------------------------------
    amazon-ebs: Total                                               71 MB/s |  53 MB  00:00
    amazon-ebs: Running transaction check
    amazon-ebs: Running transaction test
    amazon-ebs: Transaction test succeeded
    amazon-ebs: Running transaction
    amazon-ebs:   Installing : lksctp-tools-1.0.10-7.7.amzn1.x86_64                         1/5
    amazon-ebs:   Installing : 1:java-1.8.0-openjdk-headless-1.8.0.111-1.b15.25.amzn1.x86   2/5
    amazon-ebs:   Installing : 1:java-1.8.0-openjdk-1.8.0.111-1.b15.25.amzn1.x86_64         3/5
    amazon-ebs:   Installing : 1:java-1.8.0-openjdk-devel-1.8.0.111-1.b15.25.amzn1.x86_64   4/5
    amazon-ebs:   Installing : xfsprogs-3.2.2-2.20.amzn1.x86_64                             5/5
    amazon-ebs: Verifying  : lksctp-tools-1.0.10-7.7.amzn1.x86_64                         1/5
    amazon-ebs: Verifying  : 1:java-1.8.0-openjdk-1.8.0.111-1.b15.25.amzn1.x86_64         2/5
    amazon-ebs: Verifying  : 1:java-1.8.0-openjdk-headless-1.8.0.111-1.b15.25.amzn1.x86   3/5
    amazon-ebs: Verifying  : xfsprogs-3.2.2-2.20.amzn1.x86_64                             4/5
    amazon-ebs: Verifying  : 1:java-1.8.0-openjdk-devel-1.8.0.111-1.b15.25.amzn1.x86_64   5/5
    amazon-ebs:
    amazon-ebs: Installed:
    amazon-ebs: java-1.8.0-openjdk-devel.x86_64 1:1.8.0.111-1.b15.25.amzn1
    amazon-ebs: xfsprogs.x86_64 0:3.2.2-2.20.amzn1
    amazon-ebs:
    amazon-ebs: Dependency Installed:
    amazon-ebs: java-1.8.0-openjdk.x86_64 1:1.8.0.111-1.b15.25.amzn1
    amazon-ebs: java-1.8.0-openjdk-headless.x86_64 1:1.8.0.111-1.b15.25.amzn1
    amazon-ebs: lksctp-tools.x86_64 0:1.0.10-7.7.amzn1
    amazon-ebs:
    amazon-ebs: Complete!
    amazon-ebs: + yum-config-manager --enable epel
    amazon-ebs: Loaded plugins: priorities, update-motd, upgrade-helper
    amazon-ebs: ================================== repo: epel ==================================
    amazon-ebs: [epel]
    amazon-ebs: async = True
    amazon-ebs: bandwidth = 0
    amazon-ebs: base_persistdir = /var/lib/yum/repos/x86_64/latest
    amazon-ebs: baseurl =
    amazon-ebs: cache = 0
    amazon-ebs: cachedir = /var/cache/yum/x86_64/latest/epel
    amazon-ebs: check_config_file_age = True
    amazon-ebs: cost = 1000
    amazon-ebs: deltarpm_metadata_percentage = 100
    amazon-ebs: deltarpm_percentage =
    amazon-ebs: enabled = 1
    amazon-ebs: enablegroups = True
    amazon-ebs: exclude =
    amazon-ebs: failovermethod = priority
    amazon-ebs: gpgcadir = /var/lib/yum/repos/x86_64/latest/epel/gpgcadir
    amazon-ebs: gpgcakey =
    amazon-ebs: gpgcheck = True
    amazon-ebs: gpgdir = /var/lib/yum/repos/x86_64/latest/epel/gpgdir
    amazon-ebs: gpgkey = file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6
    amazon-ebs: hdrdir = /var/cache/yum/x86_64/latest/epel/headers
    amazon-ebs: http_caching = all
    amazon-ebs: includepkgs =
    amazon-ebs: ip_resolve =
    amazon-ebs: keepalive = True
    amazon-ebs: keepcache = False
    amazon-ebs: mddownloadpolicy = sqlite
    amazon-ebs: mdpolicy = group:small
    amazon-ebs: mediaid =
    amazon-ebs: metadata_expire = 21600
    amazon-ebs: metadata_expire_filter = read-only:present
    amazon-ebs: metalink =
    amazon-ebs: minrate = 0
    amazon-ebs: mirrorlist = https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=x86_64
    amazon-ebs: mirrorlist_expire = 86400
    amazon-ebs: name = Extra Packages for Enterprise Linux 6 - x86_64
    amazon-ebs: old_base_cache_dir =
    amazon-ebs: password =
    amazon-ebs: persistdir = /var/lib/yum/repos/x86_64/latest/epel
    amazon-ebs: pkgdir = /var/cache/yum/x86_64/latest/epel/packages
    amazon-ebs: priority = 99
    amazon-ebs: proxy = False
    amazon-ebs: proxy_dict =
    amazon-ebs: proxy_password =
    amazon-ebs: proxy_username =
    amazon-ebs: repo_gpgcheck = False
    amazon-ebs: report_instanceid = False
    amazon-ebs: retries = 10
    amazon-ebs: skip_if_unavailable = False
    amazon-ebs: ssl_check_cert_permissions = True
    amazon-ebs: sslcacert =
    amazon-ebs: sslclientcert =
    amazon-ebs: sslclientkey =
    amazon-ebs: sslverify = True
    amazon-ebs: throttle = 0
    amazon-ebs: timeout = 30.0
    amazon-ebs: ui_id = epel/x86_64
    amazon-ebs: ui_repoid_vars = releasever,
    amazon-ebs: basearch
    amazon-ebs: username =
    amazon-ebs:
    amazon-ebs: + yum remove -yy java-1.7.0
    amazon-ebs: Loaded plugins: priorities, update-motd, upgrade-helper
    amazon-ebs: Resolving Dependencies
    amazon-ebs: --> Running transaction check
    amazon-ebs: ---> Package java-1.7.0-openjdk.x86_64 1:1.7.0.121-2.6.8.1.69.amzn1 will be erased
    amazon-ebs: --> Finished Dependency Resolution
    amazon-ebs:
    amazon-ebs: Dependencies Resolved
    amazon-ebs:
    amazon-ebs: ================================================================================
    amazon-ebs: Package             Arch    Version                       Repository      Size
    amazon-ebs: ================================================================================
    amazon-ebs: Removing:
    amazon-ebs: java-1.7.0-openjdk  x86_64  1:1.7.0.121-2.6.8.1.69.amzn1  @amzn-updates   90 M
    amazon-ebs:
    amazon-ebs: Transaction Summary
    amazon-ebs: ================================================================================
    amazon-ebs: Remove  1 Package
    amazon-ebs:
    amazon-ebs: Installed size: 90 M
    amazon-ebs: Downloading packages:
    amazon-ebs: Running transaction check
    amazon-ebs: Running transaction test
    amazon-ebs: Transaction test succeeded
    amazon-ebs: Running transaction
    amazon-ebs: Erasing    : 1:java-1.7.0-openjdk-1.7.0.121-2.6.8.1.69.amzn1.x86_64       1/1
    amazon-ebs: Verifying  : 1:java-1.7.0-openjdk-1.7.0.121-2.6.8.1.69.amzn1.x86_64       1/1
    amazon-ebs:
    amazon-ebs: Removed:
    amazon-ebs: java-1.7.0-openjdk.x86_64 1:1.7.0.121-2.6.8.1.69.amzn1
    amazon-ebs:
    amazon-ebs: Complete!
    amazon-ebs: + rpm --import http://rpm.datastax.com/rpm/repo_key
    amazon-ebs: + yum-config-manager --add-repo http://rpm.datastax.com/datastax-ddc/3.9
    amazon-ebs: Loaded plugins: priorities, update-motd, upgrade-helper
    amazon-ebs: adding repo from: http://rpm.datastax.com/datastax-ddc/3.9
    amazon-ebs:
    amazon-ebs: [rpm.datastax.com_datastax-ddc_3.9]
    amazon-ebs: name=added from: http://rpm.datastax.com/datastax-ddc/3.9
    amazon-ebs: baseurl=http://rpm.datastax.com/datastax-ddc/3.9
    amazon-ebs: enabled=1
    amazon-ebs:
    amazon-ebs:
    amazon-ebs: + yum-config-manager --enable datastax-ddc
    amazon-ebs: Loaded plugins: priorities, update-motd, upgrade-helper
    amazon-ebs: + yum install -yy datastax-ddc jemalloc python27-pip
    amazon-ebs: Loaded plugins: priorities, update-motd, upgrade-helper
    amazon-ebs: epel/x86_64/metalink                                     |  14 kB     00:00
    amazon-ebs: epel/x86_64                                              | 4.3 kB     00:00
    amazon-ebs: http://s3-mirror-us-east-1.fedoraproject.org/pub/epel/6/x86_64/repodata/repomd.xml: [Errno -1] repomd.xml does not match metalink for epel
    amazon-ebs: Trying other mirror.
    amazon-ebs: epel/x86_64                                              | 4.3 kB     00:00
    amazon-ebs: http://mirror.cs.princeton.edu/pub/mirrors/fedora-epel/6/x86_64/repodata/repomd.xml: [Errno -1] repomd.xml does not match metalink for epel
    amazon-ebs: Trying other mirror.
    amazon-ebs: epel/x86_64                                              | 4.3 kB     00:00
    amazon-ebs: https://pubmirror1.math.uh.edu/fedora-buffet/epel/6/x86_64/repodata/repomd.xml: [Errno -1] repomd.xml does not match metalink for epel
    amazon-ebs: Trying other mirror.
    amazon-ebs: epel/x86_64                                              | 4.3 kB     00:00
    amazon-ebs: http://archive.linux.duke.edu/pub/epel/6/x86_64/repodata/repomd.xml: [Errno -1] repomd.xml does not match metalink for epel
    amazon-ebs: Trying other mirror.
    amazon-ebs: epel/x86_64                                              | 4.3 kB     00:00
    amazon-ebs: http://mirror.cs.pitt.edu/epel/6/x86_64/repodata/repomd.xml: [Errno -1] repomd.xml does not match metalink for epel
    amazon-ebs: Trying other mirror.
    amazon-ebs: http://mirrors.nebo.edu/public/epel/6/x86_64/repodata/repomd.xml: [Errno 12] Timeout on http://mirrors.nebo.edu/public/epel/6/x86_64/repodata/repomd.xml: (28, 'Connection timed out after 30001 milliseconds')
    amazon-ebs: Trying other mirror.
    amazon-ebs: epel/x86_64                                              | 4.3 kB     00:00
    amazon-ebs: http://mirror.unl.edu/epel/6/x86_64/repodata/repomd.xml: [Errno -1] repomd.xml does not match metalink for epel
    amazon-ebs: Trying other mirror.
    amazon-ebs: epel/x86_64                                              | 4.3 kB     00:00
    amazon-ebs: http://csc.mcs.sdsmt.edu/epel/6/x86_64/repodata/repomd.xml: [Errno -1] repomd.xml does not match metalink for epel
    amazon-ebs: Trying other mirror.
    amazon-ebs: epel/x86_64                                              | 4.3 kB     00:00
    amazon-ebs: https://mirrors.cat.pdx.edu/epel/6/x86_64/repodata/repomd.xml: [Errno -1] repomd.xml does not match metalink for epel
    amazon-ebs: Trying other mirror.
    amazon-ebs: epel/x86_64                                              | 4.3 kB     00:00
    amazon-ebs: https://pubmirror2.math.uh.edu/fedora-buffet/epel/6/x86_64/repodata/repomd.xml: [Errno -1] repomd.xml does not match metalink for epel
    amazon-ebs: Trying other mirror.
    amazon-ebs: epel/x86_64                                              | 4.3 kB     00:00
    amazon-ebs: http://ftp.osuosl.org/pub/fedora-epel/6/x86_64/repodata/repomd.xml: [Errno -1] repomd.xml does not match metalink for epel
    amazon-ebs: Trying other mirror.
    amazon-ebs: epel/x86_64                                              | 4.3 kB     00:00
    amazon-ebs: http://mirror.cc.columbia.edu/pub/linux/epel/6/x86_64/repodata/repomd.xml: [Errno -1] repomd.xml does not match metalink for epel
    amazon-ebs: Trying other mirror.
    amazon-ebs: epel/x86_64                                              | 4.3 kB     00:00
    amazon-ebs: https://mirrors.lug.mtu.edu/epel/6/x86_64/repodata/repomd.xml: [Errno -1] repomd.xml does not match metalink for epel
    amazon-ebs: Trying other mirror.
    amazon-ebs: epel/x86_64                                              | 4.3 kB     00:00
    amazon-ebs: http://ftp.linux.ncsu.edu/pub/epel/6/x86_64/repodata/repomd.xml: [Errno -1] repomd.xml does not match metalink for epel
    amazon-ebs: Trying other mirror.
    amazon-ebs: epel/x86_64                                              | 4.3 kB     00:00
    amazon-ebs: http://mirrors.mit.edu/epel/6/x86_64/repodata/repomd.xml: [Errno -1] repomd.xml does not match metalink for epel
    amazon-ebs: Trying other mirror.
    amazon-ebs: epel/x86_64                                              | 4.3 kB     00:00
    amazon-ebs: http://download-i2.fedoraproject.org/pub/epel/6/x86_64/repodata/repomd.xml: [Errno -1] repomd.xml does not match metalink for epel
    amazon-ebs: Trying other mirror.
    amazon-ebs: epel/x86_64                                              | 4.3 kB     00:00
    amazon-ebs: https://mirror.chpc.utah.edu/pub/epel/6/x86_64/repodata/repomd.xml: [Errno -1] repomd.xml does not match metalink for epel
    amazon-ebs: Trying other mirror.
    amazon-ebs: epel/x86_64                                              | 4.3 kB     00:00
    amazon-ebs: http://mirror.es.its.nyu.edu/epel/6/x86_64/repodata/repomd.xml: [Errno -1] repomd.xml does not match metalink for epel
    amazon-ebs: Trying other mirror.
    amazon-ebs: epel/x86_64                                              | 4.3 kB     00:00
    amazon-ebs: http://mirror.oss.ou.edu/epel/6/x86_64/repodata/repomd.xml: [Errno -1] repomd.xml does not match metalink for epel
    amazon-ebs: Trying other mirror.
    amazon-ebs: epel/x86_64                                              | 4.3 kB     00:00
    amazon-ebs: epel/x86_64/group_gz                                     | 150 kB     00:00
    amazon-ebs: epel/x86_64/updateinfo                                   | 736 kB     00:00
    amazon-ebs: epel/x86_64/primary_db                                   | 5.9 MB     00:00
    amazon-ebs: rpm.datastax.com_datastax-ddc_3.9                        | 2.4 kB     00:00
    amazon-ebs: rpm.datastax.com_datastax-ddc_3.9/primary_db             | 4.2 kB     00:00
    amazon-ebs: 976 packages excluded due to repository priority protections
    amazon-ebs: Package python27-pip-6.1.1-1.23.amzn1.noarch already installed and latest version
    amazon-ebs: Resolving Dependencies
    amazon-ebs: --> Running transaction check
    amazon-ebs: ---> Package datastax-ddc.noarch 0:3.9.0-1 will be installed
    amazon-ebs: --> Processing Dependency: datastax-ddc-tools for package: datastax-ddc-3.9.0-1.noarch
    amazon-ebs: ---> Package jemalloc.x86_64 0:3.3.1-1.8.amzn1 will be installed
    amazon-ebs: --> Running transaction check
    amazon-ebs: ---> Package datastax-ddc-tools.noarch 0:3.9.0-1 will be installed
    amazon-ebs: --> Finished Dependency Resolution
    amazon-ebs:
    amazon-ebs: Dependencies Resolved
    amazon-ebs:
    amazon-ebs: ================================================================================
    amazon-ebs: Package         Arch   Version         Repository                         Size
    amazon-ebs: ================================================================================
    amazon-ebs: Installing:
    amazon-ebs: datastax-ddc    noarch 3.9.0-1         rpm.datastax.com_datastax-ddc_3.9  28 M
    amazon-ebs: jemalloc        x86_64 3.3.1-1.8.amzn1 amzn-main                         111 k
    amazon-ebs: Installing for dependencies:
    amazon-ebs: datastax-ddc-tools
    amazon-ebs: noarch 3.9.0-1         rpm.datastax.com_datastax-ddc_3.9 5.3 k
    amazon-ebs:
    amazon-ebs: Transaction Summary
    amazon-ebs: ================================================================================
    amazon-ebs: Install  2 Packages (+1 Dependent package)
    amazon-ebs:
    amazon-ebs: Total download size: 28 M
    amazon-ebs: Installed size: 36 M
    amazon-ebs: Downloading packages:
    amazon-ebs: (1/3): datastax-ddc-3.9.0-1.noarch.rpm                   |  28 MB     00:05
    amazon-ebs: (2/3): datastax-ddc-tools-3.9.0-1.noarch.rpm             | 5.3 kB     00:00
    amazon-ebs: (3/3): jemalloc-3.3.1-1.8.amzn1.x86_64.rpm               | 111 kB     00:00
    amazon-ebs: --------------------------------------------------------------------------------
    amazon-ebs: Total                                              5.2 MB/s |  28 MB  00:05
    amazon-ebs: Running transaction check
    amazon-ebs: Running transaction test
    amazon-ebs: Transaction test succeeded
    amazon-ebs: Running transaction
    amazon-ebs:   Installing : datastax-ddc-tools-3.9.0-1.noarch                            1/3
    amazon-ebs:   Installing : datastax-ddc-3.9.0-1.noarch                                  2/3
    amazon-ebs:   Installing : jemalloc-3.3.1-1.8.amzn1.x86_64                              3/3
    amazon-ebs: Verifying  : datastax-ddc-3.9.0-1.noarch                                  1/3
    amazon-ebs: Verifying  : jemalloc-3.3.1-1.8.amzn1.x86_64                              2/3
    amazon-ebs: Verifying  : datastax-ddc-tools-3.9.0-1.noarch                            3/3
    amazon-ebs:
    amazon-ebs: Installed:
    amazon-ebs: datastax-ddc.noarch 0:3.9.0-1        jemalloc.x86_64 0:3.3.1-1.8.amzn1
    amazon-ebs:
    amazon-ebs: Dependency Installed:
    amazon-ebs: datastax-ddc-tools.noarch 0:3.9.0-1
    amazon-ebs:
    amazon-ebs: Complete!
    amazon-ebs: + pip install cassandra-driver
    amazon-ebs: You are using pip version 6.1.1, however version 9.0.1 is available.
    amazon-ebs: You should consider upgrading via the 'pip install --upgrade pip' command.
    amazon-ebs: Collecting cassandra-driver
    amazon-ebs: Downloading cassandra-driver-3.7.1.tar.gz (211kB)
    amazon-ebs:     100% || 212kB 1.2MB/s
    amazon-ebs: Requirement already satisfied (use --upgrade to upgrade): six>=1.6 in /usr/lib/python2.7/dist-packages (from cassandra-driver)
    amazon-ebs: Requirement already satisfied (use --upgrade to upgrade): futures in /usr/lib/python2.7/dist-packages (from cassandra-driver)
    amazon-ebs: Installing collected packages: cassandra-driver
    amazon-ebs: Running setup.py install for cassandra-driver
    amazon-ebs: Successfully installed cassandra-driver-3.7.1
    amazon-ebs: + chkconfig cassandra on
    amazon-ebs: + service cassandra start
    amazon-ebs: Starting Cassandra: OK
    amazon-ebs: PLEASE IMPLEMENT ME! /opt/scripts/ansible.sh
==> amazon-ebs: Stopping the source instance...
==> amazon-ebs: Waiting for the instance to stop...
==> amazon-ebs: Deregistered AMI cassandra-3.9, id: ami-dc9d71ca
==> amazon-ebs: Creating the AMI: cassandra-3.9
    amazon-ebs: AMI: ami-90977b86
==> amazon-ebs: Waiting for AMI to become ready...
==> amazon-ebs: Modifying attributes on AMI (ami-90977b86)...
    amazon-ebs: Modifying: users
==> amazon-ebs: Modifying attributes on snapshot (snap-03074bf656bec6fa2)...
==> amazon-ebs: Adding tags to AMI (ami-90977b86)...
    amazon-ebs: Adding tag: "Platform": "Amazon Linux"
    amazon-ebs: Adding tag: "Release": "2016.09.1"
    amazon-ebs: Adding tag: "CreatedAt": "20170114235343"
    amazon-ebs: Adding tag: "SourceAmi": "ami-4d87fc5a"
==> amazon-ebs: Snapshot tags:
==> amazon-ebs: Tagging snapshot: snap-03074bf656bec6fa2
==> amazon-ebs: Terminating the source AWS instance...
==> amazon-ebs: Cleaning up any extra volumes...
==> amazon-ebs: No volumes to clean up, skipping
==> amazon-ebs: Deleting temporary security group...
==> amazon-ebs: Deleting temporary keypair...
Build 'amazon-ebs' finished.

==> Builds finished. The artifacts of successful builds are:
--> amazon-ebs: AMIs were created:

us-east-1: ami-90977b86

```
=======
# packer-cassandra
Working hard
>>>>>>> 509fb59b04292674700fa279c72a64420d6e880b
