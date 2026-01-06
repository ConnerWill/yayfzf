# Maintainer: Conner Will (DampSock) <conner.will@connerwill.com>
#shellcheck disable=2148,2034,2154

pkgname=yayfzf
pkgver=1.0.5
pkgrel=0
pkgdesc="AUR package fzf finder to search, install, remove, and manage packages using yay"
arch=("any")
url="https://github.com/ConnerWill/${pkgname}"
license=("GPL")
depends=('bash' 'fzf' 'yay')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
  ## Install package
  install -vDm 775 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  ## Install documentation
  install -vDm 644 "${srcdir}/docs/README.md" -t "${pkgdir}/usr.share/doc/${pkgname}/"

  ## Install completions
  install -vDm 644 "${srcdir}/completion/_${pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -vDm 644 "${srcdir}/completion/${pkgname}_completion.sh" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  #install -vDm 644 "${srcdir}/completion/${pkgname}_completion.sh" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}_completion.sh"
}
