# CentOS Builder

The CentOS builder is a container that will run in the background and allow will
bind mount a directory */tmp/centos/rpms*.  Any 'src.rpm' that you put in that
shared directory will be built by the container and put
into */tmp/centos/rpms/out*.  This is somewhat like mock.


## How to run

```
sudo atomic run docker.io/baude/centos-builder:latest
```
This will pull and run the container.

## How to compile a package

```
# cd /tmp/centos-builder/rpms
# dnf download --source less
enabling updates-source repository
enabling fedora-source repository
Last metadata expiration check: 0:25:36 ago on Fri Mar 31 14:52:21 2017.
less-481-6.fc25.src.rpm                                                          464 kB/s | 348 kB     00:00    
# ls -l out/x86_64/
total 448
-rw-r--r--. 1 root root 152300 Mar 31 15:18 less-481-6.el7.centos.x86_64.rpm
-rw-r--r--. 1 root root 300344 Mar 31 15:18 less-debuginfo-481-6.el7.centos.x86_64.rpm
[bbaude@bbaude rpms]$ ls -l out/x86_64/
total 448
-rw-r--r--. 1 root root 152300 Mar 31 15:18 less-481-6.el7.centos.x86_64.rpm
-rw-r--r--. 1 root root 300344 Mar 31 15:18 less-debuginfo-481-6.el7.centos.x86_64.rpm
#
```

You can monitor progress of the build with the *docker logs -f <container>*
 command like so:

```
# docker logs -f dd816b4d45af320
warning: /rpms/less-481-6.fc25.src.rpm: Header V3 RSA/SHA256 Signature, key ID fdb19c98: NOKEY
warning: user mockbuild does not exist - using root
warning: group mockbuild does not exist - using root
warning: user mockbuild does not exist - using root
warning: group mockbuild does not exist - using root
warning: user mockbuild does not exist - using root
warning: group mockbuild does not exist - using root
warning: user mockbuild does not exist - using root
warning: group mockbuild does not exist - using root
warning: user mockbuild does not exist - using root
warning: group mockbuild does not exist - using root
warning: user mockbuild does not exist - using root
warning: group mockbuild does not exist - using root
warning: user mockbuild does not exist - using root
warning: group mockbuild does not exist - using root
warning: user mockbuild does not exist - using root
warning: group mockbuild does not exist - using root
warning: user mockbuild does not exist - using root
warning: group mockbuild does not exist - using root
warning: user mockbuild does not exist - using root
warning: group mockbuild does not exist - using root
warning: user mockbuild does not exist - using root
warning: group mockbuild does not exist - using root
warning: user mockbuild does not exist - using root
warning: group mockbuild does not exist - using root
warning: user mockbuild does not exist - using root
warning: group mockbuild does not exist - using root
warning: user mockbuild does not exist - using root
warning: group mockbuild does not exist - using root
Installing /rpms/less-481-6.fc25.src.rpm
Executing(%prep): /bin/sh -e /var/tmp/rpm-tmp.t8xMZW
+ umask 022
+ cd /root/rpmbuild/BUILD
+ cd /root/rpmbuild/BUILD
+ rm -rf less-481
+ /usr/bin/gzip -dc /root/rpmbuild/SOURCES/less-481.tar.gz
+ /usr/bin/tar -xf -
+ STATUS=0
+ '[' 0 -ne 0 ']'
+ cd less-481
+ /usr/bin/chmod -Rf a+rX,u+w,g-w,o-w .
+ echo 'Patch #1 (less-444-Foption.v2.patch):'
Patch #1 (less-444-Foption.v2.patch):
+ /usr/bin/cat /root/rpmbuild/SOURCES/less-444-Foption.v2.patch
+ /usr/bin/patch -p2 -b --suffix .Foption --fuzz=0
patching file forwback.c
Hunk #1 succeeded at 444 (offset 4 lines).
patching file funcs.h
patching file main.c
patching file screen.c
+ echo 'Patch #4 (less-394-time.patch):'
Patch #4 (less-394-time.patch):
+ /usr/bin/cat /root/rpmbuild/SOURCES/less-394-time.patch
+ /usr/bin/patch -p1 -b --suffix .time --fuzz=0

*** SHORTENED FOR BREVITY ***

Checking for unpackaged file(s): /usr/lib/rpm/check-files /root/rpmbuild/BUILDROOT/less-481-6.fc25.x86_64
Wrote: /rpms/out/x86_64/less-481-6.el7.centos.x86_64.rpm
Wrote: /rpms/out/x86_64/less-debuginfo-481-6.el7.centos.x86_64.rpm
Executing(%clean): /bin/sh -e /var/tmp/rpm-tmp.5qC9hB
+ umask 022
+ cd /root/rpmbuild/BUILD
+ cd less-481
+ /usr/bin/rm -rf /root/rpmbuild/BUILDROOT/less-481-6.fc25.x86_64
+ exit 0
Executing(--clean): /bin/sh -e /var/tmp/rpm-tmp.P0OMhm
+ umask 022
+ cd /root/rpmbuild/BUILD
+ rm -rf less-481
+ exit 0
+++++++++++++++++++++++++++++++++++++++
Done building less-481-6.fc25.src.rpm
+++++++++++++++++++++++++++++++++++++++

```

## Suggestions for improvement

File a github issue for your suggestion. I'll address it.
