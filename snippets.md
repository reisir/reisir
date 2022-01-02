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

### PHP validate GitHub webhook w/ secret

```php
<?php

/// Remember to set GITHUB_WEBHOOK_SECRET in /etc/environment

$cmd = 'git pull';
$sig_check = 'sha256=' . hash_hmac('sha256', Request::getContent(), $_ENV['GITHUB_WEBHOOK_SECRET']);

if (hash_equals($sig_check, Request::header('X-Hub-Signature-256'))) { 
	passthru($cmd);
} else {
	http_response_code(403);
	die("Forbidden\n");
}
```
