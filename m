Return-Path: <ksummit+bounces-348-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E243C15A0
	for <lists@lfdr.de>; Thu,  8 Jul 2021 17:03:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id EB1DC3E10DD
	for <lists@lfdr.de>; Thu,  8 Jul 2021 15:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5BDD2F80;
	Thu,  8 Jul 2021 15:02:53 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D834672
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 15:02:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF94E613AA;
	Thu,  8 Jul 2021 15:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625756572;
	bh=zIOZ/tJrC9Ugp/h9+l7Oo1fdfsDrne6uErIg3Z15N8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e8S54Z+8r7wwvTea5655FeB58pDDlXCXGHvQgyaB04Zz+09PygJD54qMGYhKds7al
	 HYy9MOViRdSOXodPiCrMIJlqiOnrvdAnIMRn6/dkf4xXJVrcaoZ8OomDJeBKRlR7bV
	 +X9YxySgUYp6aL9T78JUZ7zu/tF+tkShQxO21qwaGBcl8JjiZNOnnjijfYcvmwBXkG
	 HlLE7/+JjCFNPzcOxFG7rtIQPUQFmYpLpVHk3I66Px4J+q2sFwfeGmlg6A9LbLhJnS
	 7UgCNH57o7yZz+S/m4oFKORRo1KXkEH5ZAjqUZl9VkhajgeKOKl7ZRAlbqBvw8Zzx4
	 DqAbQB08uF7tA==
Date: Thu, 8 Jul 2021 16:02:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Wedson Almeida Filho <wedsonaf@google.com>, Jan Kara <jack@suse.cz>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <20210708150218.GB4106@sirena.org.uk>
References: <CANiq72=qa2jMUKyfPmH1q1jr8n_Tm7FMy0QyWRhhpinUrvMiNA@mail.gmail.com>
 <YOXL6Th+pot9+Fp3@kroah.com>
 <YOXd9WoafgBr1Nkv@google.com>
 <YOXibDV8mHT1e6ec@kroah.com>
 <YOX+N1D7AqmrY+Oa@google.com>
 <20210707203827.GI18396@quack2.suse.cz>
 <YOY0HLj5ld6zHJHU@google.com>
 <YOaW/pR0na5N9GiT@kroah.com>
 <CANiq72kEfZ1NxSNrcDpavkq256YsiZSLkV_EABPZPQAE=VkaVg@mail.gmail.com>
 <YOcSo3ilu+ACDnBJ@kroah.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R3G7APHDIzY6R/pk"
Content-Disposition: inline
In-Reply-To: <YOcSo3ilu+ACDnBJ@kroah.com>
X-Cookie: You do not have mail.
User-Agent: Mutt/1.10.1 (2018-07-13)


--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 08, 2021 at 04:58:43PM +0200, Greg KH wrote:

> Ok, what "model" would be better?  We need a "base object" that has
> solid lifecycle rules.  Right now we do have that, but it's just not the
> easiest to use for complex objects where we have multiple objects with
> different lifecycles that all interact together.  The v4l example is the
> best, but the input layer also has this type of issue.

Audio too, the hardware is very similar v4l here with a lot of
mix'n'match of separate devices to make one user visible thing which is
itself exposed via multiple device nodes.

--R3G7APHDIzY6R/pk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDnE3oACgkQJNaLcl1U
h9BaPwf+J9s1d+ss80Td/0OppfbPvzW3xd8uH+m0N/YZNdP3WRTfzCozbeOfvIbb
gWhwUZg1WUEhQGsHv4oy6Nloo9rtVa4/eEomoSZQ8mUnycrhqJBHYzdDcJOYnH3z
tt/ymbhBXMX0oH17mTih2BuNo505PHLHBHVNA9eEEBKDBngTn2SL8ftAGoBZFdBi
cBR+GX3b5EIcxNJHq44kX1AmDL8R5R9LU3iEJuYNKrrfYA2ZfJLWBMBTunwd1JX6
/ZrkCDem4AZny2T0cQjzwthZrCCvEZEBAEOFP/pyA1h13hxTMkmK21zk43NmkCrX
9K0yF9N4pVFurLqyRNHQggyjxv5oDQ==
=DfRT
-----END PGP SIGNATURE-----

--R3G7APHDIzY6R/pk--

