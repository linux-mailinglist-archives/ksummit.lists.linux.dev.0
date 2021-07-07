Return-Path: <ksummit+bounces-294-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F15D3BEA8A
	for <lists@lfdr.de>; Wed,  7 Jul 2021 17:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id A8FA63E106B
	for <lists@lfdr.de>; Wed,  7 Jul 2021 15:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9AB2F80;
	Wed,  7 Jul 2021 15:18:00 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15211168
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 15:18:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2BEB261CA2;
	Wed,  7 Jul 2021 15:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625671079;
	bh=sT1sdu9CBxe57KkwD8JzCCiNy6IEERM7Vc7RYj0Y5L4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=grqvRE74J1jVMII/1xyYZbBRaNf+UUPOGBr9C7KYmlslSzsYY+Y1JCF1foRbP0ebf
	 ZPcrHoo/ayUAWeUL1LBm3/TpOKY2lq5jGzG0SBBpZDo0LkLkWqGrPGd6c96oDcf9Dw
	 uz1ZryUZTc60jZfDsI9qyojASKSkfWZ+EdlsbMe7OdK58NXKvWOimKrQOCUkSJWUQr
	 ZotIBokSuxC6yOyZ9PfifhSzA4SOrhv32TXk57l0/mBdzwTsw9wPQscEQfZWjcZ1ec
	 P/Myvtsv48M2elQ19MGJIvHOg5zbYQMwuiaJTOfih8rLZGBtVn7vLO9zifBy3HLAqX
	 ic20/lj2rC4xw==
Date: Wed, 7 Jul 2021 16:17:27 +0100
From: Mark Brown <broonie@kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Roland Dreier <roland@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <20210707151727.GC4394@sirena.org.uk>
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
 <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
 <20210707105000.GA4394@sirena.org.uk>
 <c24c61f498f43f589eafd423e51f997134d198b7.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eheScQNz3K90DVRs"
Content-Disposition: inline
In-Reply-To: <c24c61f498f43f589eafd423e51f997134d198b7.camel@HansenPartnership.com>
X-Cookie: I will never lie to you.
User-Agent: Mutt/1.10.1 (2018-07-13)


--eheScQNz3K90DVRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 07, 2021 at 12:34:31PM +0100, James Bottomley wrote:
> On Wed, 2021-07-07 at 11:50 +0100, Mark Brown wrote:

> > There *are* issues with people adopting it too enthusiastically - as
> > well as the memory lifetime issues that Laurent mentioned it's easy
> > for it to cause problems with interrupt handlers that are left live
> > longer than they should be and try to use things that were already
> > deallocated.

> Fixing this should not be beyond the wit of humankind, though.  If we
> delayed deallocation to module release, that would fix the interrupt
> issue, wouldn't it?  Perhaps all devres memory for devices should live

No, that's half the problem - as Greg says there's the issue of module
vs device lifespans, and you sometimes also have to take care with the
ordering of your allocations and unwindings within device startup and
teardown so you don't end up trying to do something like deliver an
interrupt to the subsystem core after having told the subsystem the
device was gone, or trying to process a final subsystem call that needs
interrupts after you've freed interrupts.

--eheScQNz3K90DVRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDlxYYACgkQJNaLcl1U
h9AIDQf9EmpmuwUMtQw7x5l+Q2L494ywj3hmBMDHF4WYF8x6tTXd/Of8WPTy5A2I
XiS/LGhQk7UEkCk3dbJDRThPEUUDcqu+ZpotvXRrAE15/CsfW+n0xsw/2lriNfvg
Ndcngn1792ih2ZDCBlvC/Kk/4ZS945VwZqZTTpvEWpq3CeGS9ujNihETxKg8mqWq
ys+9K7U0/vq+Q5dHyihhrFtQ0sef/jEm9gjFyQhysj+yFxjHp1avCkVSS0MAyGjn
BPSIhSaMYMusbY4P2B8cALqc/Iulh5JM3slvEXxEXGN9hif0q/qUEJR5M94EiYvo
Z5MNhwwY9a5dMeELE4p4qkcLSVQ4WA==
=8oxa
-----END PGP SIGNATURE-----

--eheScQNz3K90DVRs--

