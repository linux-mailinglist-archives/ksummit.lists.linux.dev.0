Return-Path: <ksummit+bounces-555-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0474091B7
	for <lists@lfdr.de>; Mon, 13 Sep 2021 16:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 388801C0AD1
	for <lists@lfdr.de>; Mon, 13 Sep 2021 14:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51453FDA;
	Mon, 13 Sep 2021 14:04:05 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812A03FC4
	for <ksummit@lists.linux.dev>; Mon, 13 Sep 2021 14:04:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B312C610A3;
	Mon, 13 Sep 2021 14:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631541844;
	bh=UM3kudsLrUUqZ26cGXw59E1idWgweEauRPzL0/9xxPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xl5h2TK3so3mPfdWmVoxRcO5+upZgUw9fDuCIxPh1tFnJEjrClGlSPBTst9aZIGj2
	 nbUdzyZKVrz0LooJnuAYNQl8Vdq+voBggXX5efLaqpBR3aSgdewWIIJlzrpwnxpGlu
	 QkLiICNGwzW991+YXw8y7yx40oU20CHHc1cqvUuXxLNjlZA8o0Sbj4x8wzSA3PY5JU
	 0vvIaINs4JqFOqBhwL7ihkAQSh9keGztxvoAhUBLUVIHqoPZim9+cO4Trhajavw5qh
	 N6nYIzI7BztPDIwBiOG5sTb0umE0fj+8KIv1CJuJYdn93HUNq99it+/oGUiuWP6Q9U
	 JijyhgjYjXhkw==
Date: Mon, 13 Sep 2021 15:03:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Josh Triplett <josh@joshtriplett.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <20210913140324.GE4283@sirena.org.uk>
References: <YTyFZufZHu9BSFxk@unreal>
 <YTyWANV/mSkQbYhj@pendragon.ideasonboard.com>
 <YTybN5QwAnLfSBZC@unreal>
 <YT0n0SaWnM8aVr/S@pendragon.ideasonboard.com>
 <YT2By1+yuo7rcu2D@unreal>
 <YT2rwbBR6ilHmwSZ@kroah.com>
 <YT26ebT6xXWsnVMw@unreal>
 <YT3/5kJuhw/QVqrw@kroah.com>
 <YT4LgkK+ejUWljEh@unreal>
 <YT4QCHwnqZL/rl0z@kroah.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ffoCPvUAPMgSXi6H"
Content-Disposition: inline
In-Reply-To: <YT4QCHwnqZL/rl0z@kroah.com>
X-Cookie: Above all else -- sky.
User-Agent: Mutt/1.10.1 (2018-07-13)


--ffoCPvUAPMgSXi6H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 12, 2021 at 04:34:48PM +0200, Greg KH wrote:
> On Sun, Sep 12, 2021 at 05:15:30PM +0300, Leon Romanovsky wrote:

> > https://lore.kernel.org/all/YT2zryAKHc%2F5R2IH@unreal/
> > "To be used" means some open PR to existing package or request for
> > inclusion for new packages.

> But again, distros will not take things that are not already in the
> kernel.

Or, mainly for the community distros which are open to people
volunteering to package things, can't be relied on to do validation
beyond checking that the package is distributable and that the installed
files integrate into the distro in roughly the right form.  That's not
really a meaningful form of back pressure from our point of view.

> > > But how do you define Android's userspace?  Just one vendor?  2 vendors?
> > > 10 vendors?  There is major userspace fragmentation in Android userspace
> > > in many places, the user/kernel boundry being one of the big ones as
> > > many of us have found out over the past years.  And many of us are
> > > working to resolve this, but it's not so simple at times, and I have
> > > many examples if you want specifics.

> > Lauerent suggested AOSP
> > https://lore.kernel.org/all/YTyWANV%2FmSkQbYhj@pendragon.ideasonboard.com/

> Vendors can not get code into AOSP for various reasons that only Google
> understands.  There are many millions, if not billions of Android
> devices out there with user/kernel apis that are not upstream nor in
> AOSP because Google doesn't want to take them, or because the vendor can
> not go through those hoops (international law is tricky at times...)

Right, if you're not one of the main SoC vendors working on something
that's a main application of Android it can be very hard to get anyone
to give you the time of day.

--ffoCPvUAPMgSXi6H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmE/WiwACgkQJNaLcl1U
h9ALvwf/eqn+G/taK/yp4Z6fVENHgUC3pcoxF0UctcziSMQI8dsF4sSONtT8CaTl
S7XoBXXiSQyQmlxvkxoh14R4OFdFQMBrNcYgZs39+hdj5siiiOGvfwmb8KNfkIcA
Kp0gHhxXN4tDWUpmnYynB5sV1I3dqQ8QZDWYlyO9bclxDuUnTi4XYdrNlzQugqB8
rCsRumA1vdVckImCooyPiXsrI30eUqywrBq8WK8wUfDNqsLGDH4knK9YDzW4g/H5
yeVDQrgznX5eUV+y9M3EKeUFQgumoCUx0+lvNncGmOXVMj0RTQ87t/+vfc8DvA7e
phAso5PuCpH2wD4C/6JbLJ86UgWz0A==
=9Pa4
-----END PGP SIGNATURE-----

--ffoCPvUAPMgSXi6H--

