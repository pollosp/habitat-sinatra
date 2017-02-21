pkg_name=sinatra
pkg_origin=pollosp
pkg_version=0.0.1
pkg_maintainer="Omar"
pkg_license=('MIT')
pkg_source=https://www.hiszpanskinaluzie.pl/myapp.tar.gz
pkg_shasum=1d015e655e1b0d0467da5f299824b8231b5a8c0920a45f121d620be73d1c2890
pkg_deps=(core/ruby)
pkg_build_deps=(core/patch core/make core/gcc)
pkg_bin_dirs=(bin)
pkg_lib_dirs=(lib)
pkg_exports=(
  [port]=serverport
)

pkg_svc_run="ruby /app/myapp.rb"
pkg_svc_user="root"
pkg_interpreters=(bin/ruby)

do_verify() {
  return 0
}

do_build (){
gem update --system --no-document
}

do_install() {
  mkdir /app
  cp -vr  $HAB_CACHE_SRC_PATH/* /app/
  gem install sinatra --no-document
}
