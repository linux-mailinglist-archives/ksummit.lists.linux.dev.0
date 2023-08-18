Return-Path: <ksummit+bounces-1029-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1309A7812F1
	for <lists@lfdr.de>; Fri, 18 Aug 2023 20:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E962F1C2117A
	for <lists@lfdr.de>; Fri, 18 Aug 2023 18:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F521AA6F;
	Fri, 18 Aug 2023 18:36:52 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D4D19BCE
	for <ksummit@lists.linux.dev>; Fri, 18 Aug 2023 18:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D50B2C433CA;
	Fri, 18 Aug 2023 18:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692383810;
	bh=TFXFeFj9aeF9Tz3JUIajkdinSpsbymOGZpsd5GTVab4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DuSXIr+ZWsovEaDWAgOP0PxhMOmtwMXUsUkGvk+To+JdCTNN/5+WxKj1Zv/y2xNIy
	 6jt8VtvvOsXD2sC0fmDFER8uKrItGbvlWwD4e04pMju9McKQvkF8qj7JCG/J2uewjE
	 qCJ9zMKSymC7WUf4LOvaGJi6RTereaVcFQ80TADtITWF+qOQhlvfcs/G5Qr45TGF0J
	 F0X+EhWTuhiiGHVRYZywjNrBOb9L6UB9W7q3YVJ5Pya0diEfMkKfiDA0k0FImZNys9
	 vx3ptWLJooS4v3kWHP6azDnXjcMd8fktkRCd9hdQIO2VYgXyq7SKd6c/DyDAXVGzik
	 PO5wYDV7S4omg==
Date: Fri, 18 Aug 2023 19:36:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev,
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <15756423-d769-4dc2-8d24-04b37f20f2be@sirena.org.uk>
References: <20230816180808.GB2919664@perftesting>
 <ZN0uNrpD8JUtihQE@bombadil.infradead.org>
 <20230817093914.GE21668@pendragon.ideasonboard.com>
 <44814ed5-7bab-4e56-9ca6-189870f97f41@lunn.ch>
 <20230817081957.1287b966@kernel.org>
 <CAADnVQ+6=RjVziJG6rXwiC0+dEKGTGFNPUgsa4dyPP66NyTbog@mail.gmail.com>
 <CACRpkdbfSzNwkwnew-5YN4j4yBjgh=fCiaKdPmiRbViTdOcXkw@mail.gmail.com>
 <20230818152629.GA13558@pendragon.ideasonboard.com>
 <ZN-Q8AsMwaQ4JMP4@char.us.oracle.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Flq7FkOHhRs0j2yF"
Content-Disposition: inline
In-Reply-To: <ZN-Q8AsMwaQ4JMP4@char.us.oracle.com>
X-Cookie: Your aim is high and to the right.


--Flq7FkOHhRs0j2yF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 18, 2023 at 11:40:32AM -0400, Konrad Rzeszutek Wilk wrote:
> On Fri, Aug 18, 2023 at 06:26:29PM +0300, Laurent Pinchart wrote:

> > Maybe part of the solution here, to share the maintenance burden, is to
> > expect contributors, especially the ones with large financial resources,
> > to spent a certain percentage of their time reviewing code that is in
> > their area of expertise but not in their area of business interest.

> May I add an point that I had struggled in the past with (and it could
> be very well this is not an issue in your subsystem in which case please
> ignore it):

> This idea assumes you trust them to have the same level of expertise
> that you have.

> That is say they do a review but miss the more esoteric semantics (say
> hardware quirks that are documented but only for folks that *grok* the
> hardware). You may know it, but they don't. You accept their patches and
> months later it all blows up. You are unhappy, Linus is screaming about
> it. Burn-out ++.

For those of us working more with drivers for embedded systems this can
be a bit different in that for a lot of drivers realistically nobody is
going to have access to the hardware outside of a fully integrated
product, including you.  I remember talking with someone submitting
drivers for devices like that and them being surprised that I was much
more focused on if the driver was a pain for subsystem integration and
ongoing maintainance than if this undocumented thing I had no access to
worked.

Of course it's not like you can completely ignore things and some
drivers get more exposure to general users than others, but it does help
quite a bit to feed into the risk profile of patches.

> Perhaps the question should be: How to grow the community so that members
> collectively have the same knowledge as you?

And also identify the areas where that's already happening and actually
take advantage of that fact.

--Flq7FkOHhRs0j2yF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTfujwACgkQJNaLcl1U
h9Dpigf8D4+UUObhsJXsAH+8psL/mwUsPLH51mk1fgQHOmhtDJ616A+AwXAzK+gS
OELWpEb/LFulSMOjZzFnEiBE/FADoKYd6vsHYg9ZO+Vh/kG9BQdlwii7OYcJOsWi
khyi8fTrCyxw5QZG6XgMNavHIep0Vsplg2F3a7S1cAAd8skoRVB1wKKLTQdl0AwW
dY5xWkipf885DJlC6kRVF736v8r18ABIiuVb426Rqapr2PEjXNQpvfKYpP+DXZYp
+yxUQZh4stadhcCwBRbEptOjUjJMQtpm8tTuQETSXeEIo3sJAeLVIv6mPYdG6zzA
O2TcBxEXokY0Bir3APFJTAAJjgtnIg==
=lXzx
-----END PGP SIGNATURE-----

--Flq7FkOHhRs0j2yF--

