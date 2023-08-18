pkgname=apagnan-calamares-settings
pkgver=r17.1c8e3cb
pkgrel=1
pkgdesc="Settings used by the calamares instaler for Apagnan Linux"
arch=('any')
url="https://github.com/chipseater/apagnan-calamares-settings"
license=('GPL')

source=("$pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    # Create an empty directory at the root of the filesystem
    install -dm755 "$pkgdir/etc/calamares"
    cp -r "$pkgname/"* "$pkgdir/etc/calamares/"
}

