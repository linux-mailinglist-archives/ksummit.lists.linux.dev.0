Return-Path: <ksummit+bounces-1080-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87760796E37
	for <lists@lfdr.de>; Thu,  7 Sep 2023 02:48:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3F602814D1
	for <lists@lfdr.de>; Thu,  7 Sep 2023 00:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F860A3F;
	Thu,  7 Sep 2023 00:48:10 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542E5A28
	for <ksummit@lists.linux.dev>; Thu,  7 Sep 2023 00:48:08 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1c09673b006so3175345ad.1
        for <ksummit@lists.linux.dev>; Wed, 06 Sep 2023 17:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694047687; x=1694652487; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6xiTqCZfUuOaZiyeOYi2J8iopikWSUHIkvjjbcjN5Ig=;
        b=aKVpm6HOeJ/Ux3Rwo9u1pnn8BsSWPejnpj5N+c/N3wUMnYDivr/a0v8fOH9dk1PbnY
         H2kQEupWRmAKPGCVZXKaMxpMzplcaSr0Yt3ZuCctUC40ioI8SLTO71ECf5WrNkwbdW0+
         K9myUvfB66o8LW8MMAEOEUR84i7wxXYfzvfdQGreVbsr7sR78v6OPNJIv1mg7BYDyAil
         FnuAOpPbIixFkbufZzp5KEwACIypX3fj0qngSrPwHxpb0T7tHpNng8ANJJB3YQEV1fCz
         6qoS0r+v3F6AY34nJaiA5bDz+Hzr5oYW4bUEH8Gns7z5Jb3NlESdsGWxABP3ldLz+LPP
         Ycpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694047687; x=1694652487;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xiTqCZfUuOaZiyeOYi2J8iopikWSUHIkvjjbcjN5Ig=;
        b=dE88qBUGHx7N/Uq0Kcjh1NbNxvrq7DjNCswZiXiNs5dYzs4j8YD58y28N64avP5+WD
         Mpiex3lZQdI8JlbmYRy25MmJb12IbPXvH1oEIdiCCQMtHhBMnDr0lLAQhePD4QwgaKox
         t5g6PeEHXsYDRV2BA1ZUFt8idsvNWFSTZTzdCO42gpITEJcYuzoxV+jnIBOL3aK46ZmC
         bj7N1sxfuyHDngG43RGnuaVQWestv72qvNBIqwBoUiQLTiOh22D3kDwurn3Qx30mBNoH
         uuM3x8tTVeix0fndSCS6obbwnGPcrVamrJxmcstjBel9Z20gK/CX90xuqmswJIsAGNKU
         ac/A==
X-Gm-Message-State: AOJu0YzK1Ky67DLlrcvCt9UOTl8kwDT1mQJZm1wPzAwQ6OajBPgw7pOp
	jeHiv3ANdkBCuRQO8l4VEDI=
X-Google-Smtp-Source: AGHT+IEY9xYAsQYYGkJv4GkODYYJ6ajlHZ7BGVWUymi1OSJPOe8x8ywPl2pbJ8Fsuxc4C7a6jaFbqQ==
X-Received: by 2002:a17:903:1109:b0:1bb:d280:5e0b with SMTP id n9-20020a170903110900b001bbd2805e0bmr16710589plh.18.1694047687539;
        Wed, 06 Sep 2023 17:48:07 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id g6-20020a170902c38600b001b87d3e845bsm11636314plg.149.2023.09.06.17.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 17:48:07 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 30A57817F2CA; Thu,  7 Sep 2023 07:48:04 +0700 (WIB)
Date: Thu, 7 Sep 2023 07:48:04 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <ZPkdxMh7jt5A7x67@debian.me>
References: <ZO9NK0FchtYjOuIH@infradead.org>
 <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="POqXAfAGR5zFhSYW"
Content-Disposition: inline
In-Reply-To: <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>


--POqXAfAGR5zFhSYW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 06, 2023 at 03:32:28PM -0700, Guenter Roeck wrote:
> On 8/30/23 07:07, Christoph Hellwig wrote:
> > Hi all,
> >=20
> > we have a lot of on-disk file system drivers in Linux, which I consider
> > a good thing as it allows a lot of interoperability.  At the same time
> > maintaining them is a burden, and there is a lot expectation on how
> > they are maintained.
> >=20
> > Part 1: untrusted file systems
> >=20
> > There has been a lot of syzbot fuzzing using generated file system
> > images, which I again consider a very good thing as syzbot is good
> > a finding bugs.  Unfortunately it also finds a lot of bugs that no
> > one is interested in fixing.   The reason for that is that file system
> > maintainers only consider a tiny subset of the file system drivers,
> > and for some of them a subset of the format options to be trusted vs
> > untrusted input.  It thus is not just a waste of time for syzbot itself,
> > but even more so for the maintainers to report fuzzing bugs in other
> > implementations.
> >=20
> > What can we do to only mark certain file systems (and format options)
> > as trusted on untrusted input and remove a lot of the current tension
> > and make everyone work more efficiently?  Note that this isn't even
> > getting into really trusted on-disk formats, which is a security
> > discussion on it's own, but just into formats where the maintainers
> > are interested in dealing with fuzzed images.
> >=20
> > Part 2: unmaintained file systems
> >=20
> > A lot of our file system drivers are either de facto or formally
> > unmaintained.  If we want to move the kernel forward by finishing
> > API transitions (new mount API, buffer_head removal for the I/O path,
> > ->writepage removal, etc) these file systems need to change as well
> > and need some kind of testing.  The easiest way forward would be
> > to remove everything that is not fully maintained, but that would
> > remove a lot of useful features.
> >=20
> > E.g. the hfsplus driver is unmaintained despite collecting odd fixes.
> > It collects odd fixes because it is really useful for interoperating
> > with MacOS and it would be a pity to remove it.  At the same time
> > it is impossible to test changes to hfsplus sanely as there is no
> > mkfs.hfsplus or fsck.hfsplus available for Linux.  We used to have
> > one that was ported from the open source Darwin code drops, and
> > I managed to get xfstests to run on hfsplus with them, but this
> > old version doesn't compile on any modern Linux distribution and
> > new versions of the code aren't trivially portable to Linux.
> >=20
> > Do we have volunteers with old enough distros that we can list as
> > testers for this code?  Do we have any other way to proceed?
> >=20
> > If we don't, are we just going to untested API changes to these
> > code bases, or keep the old APIs around forever?
> >=20
>=20
> In this context, it might be worthwhile trying to determine if and when
> to call a file system broken.
>=20
> Case in point: After this e-mail, I tried playing with a few file systems.
> The most interesting exercise was with ntfsv3.
> Create it, mount it, copy a few files onto it, remove some of them, repea=
t.
> A script doing that only takes a few seconds to corrupt the file system.
> Trying to unmount it with the current upstream typically results in
> a backtrace and/or crash.

Did you forget to take the checksum after copying and verifying it
when remounting the fs?

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--POqXAfAGR5zFhSYW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZPkdwwAKCRD2uYlJVVFO
oy8pAP0Z5qmUJsEAD+6yij0ybOFmAUw5+ifdA3NrJK675IcAqwEA4FVjK4Y1copi
hfW5YCSuY2VMkr43cApyoGgv34xjnwg=
=Ct+D
-----END PGP SIGNATURE-----

--POqXAfAGR5zFhSYW--

