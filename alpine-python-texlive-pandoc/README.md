# alpine-python-texlive-pandoc

Alpine3.8 + Python3.7.1 + TeXLive2018 + Pandoc2.4  
This image was created to run filters using [pandocfilters](https://github.com/jgm/pandocfilters) or [panflute](https://github.com/sergiocorreia/panflute) such as [pandoc-minted](https://github.com/nick-ulle/pandoc-minted).

This image also contains `pip`, `tlmgr` and `pandoc-citeproc`.
However, contains only minimal collections anout the TeX Live, please `tlmgr install` if necessary.

## Reference

- https://github.com/jgm/pandoc/blob/master/INSTALL.md#linux
- https://www.tug.org/texlive/acquire-netinstall.html
- [k1LoW/docker-alpine-pandoc-ja](https://github.com/k1LoW/docker-alpine-pandoc-ja)
- [aruneko/texlive](https://github.com/aruneko/texlive)
