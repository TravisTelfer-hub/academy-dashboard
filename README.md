# Academy Dashboard - Encrypted Pages Deploy

Password-protected, read-only snapshot of the WP Academy retention dashboard,
served on GitHub Pages. Every page in `public/` is StatiCrypt-encrypted
(AES-256) client-side - this repo contains **no plaintext member data**.

## How it works

- The dashboard app (separate local project) exports a self-contained snapshot
  into `public-encrypted/` (gitignored - plaintext never gets committed).
- `make encrypt` encrypts it into `public/` with a password derived from
  `ENCRYPT_SECRET` in `.env` (HMAC-SHA256 per file - see `scripts/encrypt/`).
- A push to `main` deploys `public/` to GitHub Pages via Actions.

## Commands

```
make encrypt        # encrypt public-encrypted/ -> public/
make encrypt-show   # look up the password(s) without re-encrypting
make publish        # encrypt + commit + push (goes live)
```

The full refresh (re-export fresh data + encrypt + push) is run from the
dashboard project: `npm run publish-live`.

## Secrets

`ENCRYPT_SECRET` lives in `.env` (gitignored). Store it in a password manager -
every page password is derived from it and can be regenerated with
`make encrypt-show`.
