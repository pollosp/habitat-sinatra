pkg_name=sinatra
pkg_origin=pollosp
pkg_version=0.0.2
pkg_maintainer="Omar"
pkg_license=('MIT')
pkg_source=https://www.hiszpanskinaluzie.pl/myapp.tar.gz
pkg_shasum=a991e21e6559937473a0ff7da42d7efd35e3949d868331a43570962add71d042
pkg_deps=(core/ruby)
pkg_build_deps=(core/patch core/make core/gcc)
pkg_bin_dirs=(bin)
pkg_lib_dirs=(lib)
pkg_exports=( [port]=listening_port )
pkg_exposes=(port)

pkg_svc_run="rackup -o 0.0.0.0 -p $pkg_exposes /app/config.ru"
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
