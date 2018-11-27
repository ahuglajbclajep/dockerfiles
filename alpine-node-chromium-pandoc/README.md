# alpine-node-chromium-pandoc

Alpine3.8 + Node10.9.0 + Chromium + Pandoc2.2.3.2  
This image was created to "print" PDF using [puppeteer](https://github.com/GoogleChrome/puppeteer) from HTML generated with Pandoc.

```js
const puppeteer = require("puppeteer-core");
const exec = require("util").promisify(require("child_process").exec);
const mkdirp = path => require("fs").promises.mkdir(path, { recursive: true });

const html2pdf = async (html, pdf, papersize) => {
  const browser = await puppeteer.launch({
    executablePath: "/usr/bin/chromium-browser",
    args: ["--disable-dev-shm-usage"]
  });
  const page = await browser.newPage();
  await page.goto(`file:${__dirname}/${html}`);
  await page.pdf({
    path: pdf,
    printBackground: true,
    format: papersize
  });
  await browser.close();
};

mkdirp("dist")
  .then(() => exec(`pandoc -o dist/book.html ${options} chapters/*.md`))
  .then(() => html2pdf("dist/book.html", "dist/book.pdf", "A5"))
  .catch(console.log);
```

## Reference

- https://github.com/jgm/pandoc/blob/master/INSTALL.md#compiling-from-source
- [k1LoW/docker-alpine-pandoc-ja](https://github.com/k1LoW/docker-alpine-pandoc-ja)
- https://github.com/GoogleChrome/puppeteer/blob/master/docs/troubleshooting.md#running-on-alpine
- [Zenika/alpine-chrome](https://github.com/Zenika/alpine-chrome)

By the way, pandoc did not have to build from source 😇
