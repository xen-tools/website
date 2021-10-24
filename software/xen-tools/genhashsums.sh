#!/bin/sh

dir=`dirname $0`
cd $dir

ver=`ls -v1 xen-tools-*.tar.gz.asc | tail -1 | sed -e 's/^xen-tools-//;s/\.tar\.[a-z0-9]*\.asc$//'`
deb=`ls -v1 xen-tools_*.deb | tail -1 | sed -e 's/^xen-tools_//;s/_all\.deb$//'`
tarfile=xen-tools-${ver}.tar.gz
debfile=xen-tools_${deb}_all.deb

size_tar=`env LC_ALL=C ls -lh "$tarfile" | awk '{print $5}' | sed -e s/K/k/`
size_deb=`env LC_ALL=C ls -lh "$debfile" | awk '{print $5}' | sed -e s/K/k/`

md5_tar=`md5sum "$tarfile" | awk '{print $1}'`
sha1_tar=`sha1sum "$tarfile" | awk '{print $1}'`
sha256_tar=`sha256sum "$tarfile" | awk '{print $1}' | sed -e 's/\(................................\)/\1\n                /g'`
sha512_tar=`sha512sum "$tarfile" | awk '{print $1}' | sed -e 's/\(................................\)/\1\n                /g'`

md5_deb=`md5sum "$debfile" | awk '{print $1}'`
sha1_deb=`sha1sum "$debfile" | awk '{print $1}'`
sha256_deb=`sha256sum "$debfile" | awk '{print $1}' | sed -e 's/\(................................\)/\1\n                /g'`
sha512_deb=`sha512sum "$debfile" | awk '{print $1}' | sed -e 's/\(................................\)/\1\n                /g'`

echo "<p>The most recent stable version of Xen Tools is <strong>${ver}</strong> and you can download it via the following link:</p>
<ul>
<li>Sources: <a href=\"xen-tools-${ver}.tar.gz\">xen-tools-${ver}.tar.gz</a> - $size_tar
  <ul>
    <li>MD5: $md5_tar</li>
    <li>SHA1: $sha1_tar</li>
    <li>SHA256: $sha256_tar</li>
    <li>SHA512: $sha512_tar</li>
    <li><a href=\"xen-tools-${ver}.tar.gz.asc\">GPG signature</a></li>
  </ul>
</li>
<li>Debian package: <a href=\"xen-tools_${deb}_all.deb\">xen-tools_${deb}_all.deb</a> - $size_deb
  <ul>
    <li>MD5: $md5_deb</li>
    <li>SHA1: $sha1_deb</li>
    <li>SHA256: $sha256_deb</li>
    <li>SHA512: $sha512_deb</li>
  </ul>
</li>
</ul>
"
