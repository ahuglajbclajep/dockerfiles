# alpine-node-chromium-pandoc

Alpine3.8 + Node10.15.0 + Chromium71 + Pandoc2.5  
This image was created to "print" PDF using [puppeteer](https://github.com/GoogleChrome/puppeteer) from HTML generated with Pandoc.

```js
#!/usr/bin/env node

const puppeteer = require("puppeteer-core");
const exec = require("util").promisify(require("child_process").exec);
const mkdirp = path => require("fs").promises.mkdir(path, { recursive: true });

const html2pdf = async (html, pdf, format = "A5") => {
  const browser = await puppeteer.launch({
    executablePath: "/usr/bin/chromium-browser",
    args: ["--disable-dev-shm-usage"]
  });
  const page = await browser.newPage();
  await page.goto(`file:${__dirname}/${html}`);
  await page.pdf({
    path: pdf,
    printBackground: true,
    format
  });
  await browser.close();
};

mkdirp("dist")
  .then(() => exec(`pandoc -o dist/book.html ${options} chapters/*.md`))
  .then(() => html2pdf("dist/book.html", "dist/book.pdf"))
  .catch(console.log);
```

```sh
npm init -y && npm i puppeteer-core
chmod u+x index.js
docker run -it --rm -u `id -u`:`id -g` -v `pwd`:/root -w /root --cap-add=SYS_ADMIN ahuglajbclajep/alpine-node-chromium-pandoc /root/index.js
```

## Reference

- https://github.com/jgm/pandoc/blob/2.5/INSTALL.md#linux
- [k1LoW/docker-alpine-pandoc-ja](https://github.com/k1LoW/docker-alpine-pandoc-ja)
- https://github.com/GoogleChrome/puppeteer/blob/v1.11.0/docs/troubleshooting.md#running-on-alpine
- [Zenika/alpine-chrome](https://github.com/Zenika/alpine-chrome)
