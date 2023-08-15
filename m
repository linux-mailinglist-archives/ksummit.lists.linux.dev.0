Return-Path: <ksummit+bounces-988-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A7477D492
	for <lists@lfdr.de>; Tue, 15 Aug 2023 22:47:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 034E41C20E5E
	for <lists@lfdr.de>; Tue, 15 Aug 2023 20:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3643E182C0;
	Tue, 15 Aug 2023 20:47:49 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B9417ACA
	for <ksummit@lists.linux.dev>; Tue, 15 Aug 2023 20:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43690C433C8;
	Tue, 15 Aug 2023 20:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692132467;
	bh=QqLkChhJQ8vm6fzv96JMGmuZKwfWrIUZcXhzDlsfP0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qw2XDmyY64bwvZ6FRMGqzlr/h4TpLjTeMbXsjQ5tkUC6bFvaxb6N89DCPr0XWwAvM
	 RyDgaTTNlVqVHWnCG9xcsjlTULoMuemjvqSM5i6DacIFY8IXX2KDnhI4bm+lNcuu4z
	 PHAetmHnzjxGRVZT1Z7nKIWOq+WcBSpvHMMCHDftkVCdSCZs2yDdz/ZMgImJ1O796T
	 E95kPuCYRr0oqwzDGuQPXj5/UIdVzupIVj5pyETbYMniK2mBI59PU3JShjQKLL4ggo
	 hH/AP0JvxRUb+hNmIoAorrTyYXmJdphKk/c0rX+AS2k6X18jXIaZJpZz9gU+rclsDr
	 c6GQc5V5tfycQ==
Date: Tue, 15 Aug 2023 21:47:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Dave Hansen <dave@sr71.net>, Sasha Levin <sashal@kernel.org>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Quality standards for embargoed code
Message-ID: <f7b680ae-915b-4783-a177-117553356df6@sirena.org.uk>
References: <ZNuuvS5BtmjcazIv@sashalap>
 <53f0072b-91c0-0136-a689-f31e8508a862@sr71.net>
 <ZNvBomFMyZTYm7ye@sashalap>
 <e4d1bf8f-cbb5-935d-1a55-7650dff591ab@sr71.net>
 <2023081510-monument-sagging-2125@gregkh>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ys9THEPeFCXhDHot"
Content-Disposition: inline
In-Reply-To: <2023081510-monument-sagging-2125@gregkh>
X-Cookie: Darth Vader sleeps with a Teddywookie.


--ys9THEPeFCXhDHot
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 15, 2023 at 09:57:46PM +0200, Greg KH wrote:

> Anyway, the main reason we have NOT added testers (nor allowed
> developers to use the test systems from their employer) is that those
> test systems are able to be accessed by a huge/unknown number of other
> people, none of who should have access to the potential changes under
> development.

> If that can be solved, with a "private" kernelci/lkft/openssf/whatever
> test instance, that would be wonderful.  Ideally it should be the
> responsibility of the hardware vendor for which we are fixing their
> broken hardware with kernel changes to provide this for us.

I think we could usefully have such systems or scripts available which
people could use at their option as part of setting the baseline,
ideally something based on free software so people can stand the stack
up themselves if they want.  Probably there will be occasions when it
gets used, if only by upstream people, and it's less stop energy to
point people at something they can concretely use rather than a list of
tests which people might not already know how to run.  If it's just a
list of requirements there's more chance people might mess up running in
ways that non-obviously don't actually test the thing.

> I know that Linaro has made some lkft access available to some of us in
> the past with "private" test systems, but that was a long time ago and I
> don't think I have access to that anymore with their most recent rewrite
> of their backend.  Oh, and their systems primarily test ARM cpus, of
> which we generally do NOT use the embargoed-hw system because those CPUs
> usually don't have these types of problems :)

They do have a bunch of qemu stuff (though it's not super comprehensive
in terms of things like firmware combos since they're more focused on
runtime testing) and while that's not the world emulation would catch
some of the wider spread issues we see.  OTOH the infra software isn't
published.

--ys9THEPeFCXhDHot
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTb5G4ACgkQJNaLcl1U
h9AMEQf/dIwcsGfmQHJNj7bXqK7YAziUyDYQM8Cc9ACR9OSNn8uPC2mOUhDnsB9J
Wbqu0LkJUWAIWtaTy3vjx2Z4gwK55EUWtfvL2Lyrvgq3/1UhPqNXbrB2pCun/uiB
kWp4Sh7gpwzaHm8CpY9VYX1ta7jvpMSeud0FcsOh0kiqwerxs69bXoykTYzxjKuY
lgywshmn6Q/D2KssfBOy5cAxa8zMiJeloNU/IPFaKrAGelzFerPSaReH5d6njAS4
PUvs28wSCqXllhRbsTBG5eW3se5m+ULNWJJW+2OGrx8bHmF9sLV6AZxVRGWiOdx9
UK7RVP4mOk4wez6FmBKsBovcGmt/QQ==
=Sec5
-----END PGP SIGNATURE-----

--ys9THEPeFCXhDHot--

