### Soundcloud repost blockrule for uBlock Origin

    ##li.soundList__item:-abp-has(> div.activity > div[aria-label*="reposted by"])

    ##li.soundList__item:-abp-has(div[aria-label*="reposted by"])

### Pure CSS YouTube embed scaling

Based on container padding and viewport width. Needs more math if container isn't 100% wide.

```css
iframe {
  max-width: calc((100vw - (var(--container-padding) * 2)) * 1) !important;
  max-height: calc(
    (100vw - (var(--container-padding) * 2)) * 0.5625
  ) !important;
}
```
