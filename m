Return-Path: <ksummit+bounces-281-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id F04FC3BE6A3
	for <lists@lfdr.de>; Wed,  7 Jul 2021 12:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 08F531C0DEB
	for <lists@lfdr.de>; Wed,  7 Jul 2021 10:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 460122FAD;
	Wed,  7 Jul 2021 10:50:34 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FD772
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 10:50:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5FB96619A0;
	Wed,  7 Jul 2021 10:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625655032;
	bh=FliZbpFB/+KqrgFoOQwPELvURgyMhPCNqb0TsiHBqwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M4vI9mR/dyURbls6ws4LmxZIbpxMLFL7zjxFt2jTglvzmQmzrZXWHb16i0W2qZlH8
	 FCQURWdv+m0OxIiYrWG6XR4JFa3D17x7OVZf+0dKwblt8qGYdx2JwwJNjx5FPGl/sg
	 sz2hYB4h/OvpzLPOrejS8G8EqRvKvgCK/WHr531VbtEqncVIy1XD48OqHzkNCamI7h
	 mkMVeGZ/14qsHM3QEHFi3yu+jHShYj/MnnSXb5ZRYvoMTXQSzek0qJH/suDQTQZReF
	 PS9tZUy1NXo95fWiHtD7FUM+gYEa8WDn9Vj+xvdUaD469TCKj9tSGfRjuXnmuAxcWW
	 cHoRwM5QiVMuA==
Date: Wed, 7 Jul 2021 11:50:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Roland Dreier <roland@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <20210707105000.GA4394@sirena.org.uk>
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
 <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline
In-Reply-To: <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
X-Cookie: I will never lie to you.
User-Agent: Mutt/1.10.1 (2018-07-13)


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 06, 2021 at 10:36:14PM +0200, Linus Walleij wrote:
> On Tue, Jul 6, 2021 at 10:00 PM Roland Dreier <roland@kernel.org> wrote:

> > "devres" / devm_xxx was an attempt to deal with this in C, but it only
> > solves some cases of this and has not received a lot of adoption (we
> > can argue about the reasons).

> Really? From my point of view that is adopted all over the map.
> I add new users all the time and use it as much as I can when
> writing new drivers.

Yes, it's *super* widely used in most of the kernel.  Perhaps there's
some subsystems that reject it for some reason.

> I think it's a formidable success, people just need to learn to do it more.

There *are* issues with people adopting it too enthusiastically - as
well as the memory lifetime issues that Laurent mentioned it's easy for
it to cause problems with interrupt handlers that are left live longer
than they should be and try to use things that were already deallocated.

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDlhtgACgkQJNaLcl1U
h9CCcgf6A1aByFZCq8btFKJQUbiD3Ny5SPtFfNDMGtOz5BOylkUJTuR7s4lwOelP
4Wyb2pm6HQicW5+9TxAHNeKMM42jZkAB0DQgR/HUhpCEbjyrOwO3D0iOY7gOkOj+
Pm2JPA7Z2MJdjBaKfe3DLWRREmT2bhsOEzZMQOVzY/dSsQRa+uXbKFO42APeYZ1l
eL1ss+RnUNK2U0xWkP14liS9RlLNOKOY0UmuDWcUMkmzIbVDzRQ7d2Ed77GDPnCQ
dv9zeI2V8bM1EvKYALr9dQyRerv84rJu+hVzFLtH/TwZou5W5PorsXPJBky4xXKp
kjYdY883WiCqTE7yOqJFoqBWFvQINQ==
=H7Ne
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--

