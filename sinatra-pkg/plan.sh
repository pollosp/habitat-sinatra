pkg_name=sinatra
pkg_origin=pollosp
pkg_version=0.0.2
pkg_maintainer="Omar"
pkg_license=('MIT')
pkg_source=https://www.hiszpanskinaluzie.pl/myapp.tar.gz
pkg_shasum=edecf223896e727bab351e7af68dc8477c4b2c90d2b73b92f5d1577760aac8c8
pkg_deps=(
core/ruby
core/coreutils
core/gcc-libs
)

pkg_build_deps=(
  core/cacerts
  core/bundler
  core/coreutils
  core/rsync
  core/make
  core/cmake
  core/gcc
  core/pkg-config
)

pkg_bin_dirs=(bin)
pkg_bin_dirs=(bin)
pkg_lib_dirs=(lib)
pkg_exports=( [port]=listening_port )
pkg_exposes=(port)

pkg_svc_run="start_rack"
pkg_svc_user="root"

do_verify() {
  return 0
}

do_build (){
  return 0 
}

do_install() {
  export BUNDLE_SILENCE_ROOT_WARNING=1 GEM_PATH
  GEM_PATH="$(pkg_path_for core/bundler)"
    cat > Gemfile <<GEMFILE
  source 'https://rubygems.org'
  gem 'sinatra'
GEMFILE

   bundle install --jobs "$(nproc)" --retry 5 \
    --path "$pkg_prefix/bundle" \
    --shebang=$(pkg_path_for ruby)/bin/ruby \
    --binstubs=$pkg_prefix/bin \
    --standalone
  pkg_lib_dirs+=$(find $pkg_prefix/bundle | grep '**/lib' | grep '\.so' | xargs dirname | sort -u)
  
  cp -vr $HAB_CACHE_SRC_PATH/* $pkg_prefix 
  echo "$pkg_prefix/bin/rackup -p 9292 -o 0.0.0.0 $pkg_prefix/config.ru" > $pkg_prefix/bin/start_rack
  chmod +x $pkg_prefix/bin/start_rack  
  fix_interpreter "$pkg_prefix/bin/*" core/coreutils bin/env
}
