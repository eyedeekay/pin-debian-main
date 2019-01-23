# pin-debian-main

Force the use of i2p from Debian's repositories instead of from the project
repo's or the PPA. It's a work in progress, I'm going to fix the linter errors
shortly.

## What simple thing does it fix?

Existing i2p users who are using the i2p Debian repo or the i2p PPA occasionally
experience friction in situations where they are upgrading from an old, to the
new long-term-service release(Xenial-to-Bionic). It may occur on other upgrades
to Bionic as well. This is because there are now two versions of the i2p
packages available for them to download.

## What it installs:

[This file:](etc/apt/preferences.d/use-debian-i2p-i2pd)

Which contains:

        Package: i2p
        Pin: release o=Debian
        Pin-Priority: 500

        Package: i2pd
        Pin: release o=Debian
        Pin-Priority: 500

        Package: i2p
        Pin: release o=Ubuntu
        Pin-Priority: 500

        Package: i2pd
        Pin: release o=Ubuntu
        Pin-Priority: 500

        Package: i2p
        Pin: release o=I2P
        Pin-Priority: -10

        Package: i2p
        Pin: release o=LP-PPA-i2p-maintainers-i2p
        Pin-Priority: -10

        Package: i2pd
        Pin: release o=LP-PPA-purplei2p-i2p
        Pin-Priority: -10

This causes the system to blacklist i2p and i2pd from the project sources and
force them to replaced with the ones from the distribution. **Also it means**
**that it will *never* be eligible for upstreaming to Debian, but that's OK**
**because unless you have the PPA installed, you don't need it.**
