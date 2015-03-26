---
CPAN:
  build_dir: .cpan/build
  bzip2: ../mingw32/bin/bzip2.exe
  cpan_home: .cpan
  ftp: ''
  gzip: ../mingw32/bin/gzip.exe
  histfile: .cpan/histfile
  keep_source_where: .cpan/sources
  make: ../mingw32/bin/dmake.exe
  make_install_make_command: ../mingw32/bin/dmake.exe
  makepl_arg: ''
  patch: ../msys/bin/patch.exe
  tar: ../msys/bin/tar.exe
  unzip: ../mingw32/bin/unzip.exe
  prefs_dir: .cpan/prefs
  pager: ../mingw32/bin/less.exe
  wget: ../mingw32/bin/wget.exe
minicpan:
  local: repo/CPAN
  exact_mirror: 1
HomeDir:
  my_home: .
  my_data: .
Config:
  archlib: perl/lib
  archlibexp: perl/lib
  bin: perl/bin
  binexp: perl/bin
  incpath: ../mingw32/include
  installarchlib: perl/lib
  installbin: perl/bin
  installbin: perl/bin
  installhtml1dir: ''
  installhtml3dir: ''
  installhtmldir: ''
  installhtmlhelpdir: ''
  installman1dir: ''
  installman3dir: ''
  installprefix: perl
  installprefixexp: perl
  installprivlib: perl/lib
  installscript: perl/bin
  installsitearch: perl/site/lib
  installsitebin: perl/site/bin
  installsitehtml1dir: ''
  installsitehtml3dir: ''
  installsitelib: perl/site/lib
  installsiteman1dir: ''
  installsiteman3dir: ''
  installsitescript: 'perl/site/bin'
  installstyle: perl/lib
  installusrbinperl: ~
  installvendorarch: 'perl/vendor/lib'
  installvendorbin: 'perl/bin'
  installvendorhtml1dir: ''
  installvendorhtml3dir: ''
  installvendorlib: 'perl/vendor/lib'
  installvendorman1dir: ''
  installvendorman3dir: ''
  installvendorscript: 'perl/bin'
  ld: g++.exe
  _libpthfix_part1: ../mingw32/lib
  _libpthfix_part2: ../mingw32/mingw32/lib
  _libpthfix_part3: ../mingw32/lib/gcc/mingw32/4.9.2
  lddlflags: '-mdll -s -L"$archlib\CORE" -L"$_libpthfix_part1"'
  ldflags: '-s -L"$archlib\CORE" -L"$_libpthfix_part1"'
  ldflags_nolargefiles: '-s -L"$archlib\CORE" -L"$_libpthfix_part1"'
  libpth: $_libpthfix_part1 $_libpthfix_part2 $_libpthfix_part3
  perlpath: perl/bin/perl.exe
  prefix: perl
  prefixexp: perl
  privlib: perl/lib
  privlibexp: perl/lib
  scriptdir: perl/bin
  scriptdirexp: perl/bin
  sitearch: perl/site/lib
  sitearchexp: perl/site/lib
  sitebin: perl/site/bin
  sitebinexp: perl/site/bin
  sitelib: perl/site/lib
  sitelibexp: perl/site/lib
  siteprefix: perl/site
  siteprefixexp: perl/site
  man1dir: ''
  man1direxp: ''
  man3dir: ''
  man3direxp: ''
  vendorarch: perl/vendor/lib
  vendorarchexp: perl/vendor/lib
  vendorbin: perl/bin
  vendorbinexp: perl/bin
  vendorhtml1dir: ''
  vendorhtml3dir: ''
  vendorlib: perl/vendor/lib
  vendorlibexp: perl/vendor/lib
  vendorman1dir: ''
  vendorman3dir: ''
  vendorprefix: perl/vendor
  vendorprefixexp: perl/vendor
  vendorscript: perl/bin
  sitescript: perl/site/bin
  sitescriptexp: perl/site/bin
  vendorscriptexp: perl/bin
  usrinc: mingw/include
Env:
  PATH:
    - mingw/bin
    - perl/bin