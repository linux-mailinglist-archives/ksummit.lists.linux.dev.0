Return-Path: <ksummit+bounces-1022-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90113780FEB
	for <lists@lfdr.de>; Fri, 18 Aug 2023 18:10:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C04711C20CD0
	for <lists@lfdr.de>; Fri, 18 Aug 2023 16:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC4419BB4;
	Fri, 18 Aug 2023 16:10:18 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A93E182B5
	for <ksummit@lists.linux.dev>; Fri, 18 Aug 2023 16:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9C66C433C7;
	Fri, 18 Aug 2023 16:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692375016;
	bh=9XmgBHrNNNvGQtBo1aBpISDikDlaDV0vhJfr2lYw3aA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hSRTTHXK3BtR65wlgLQl7o/WEXHtdcdDMTY22q0dLF+tgR9ndi0UOBUWgakBRa0JT
	 +4moOmktc6HKPCl1zUswZS+M3L2PDqZ1LRM+fkgNkITL/IAIhuM6FHL+5wGbvomod2
	 DM+yZHAAdfNoiLvI8wUX+pzCPY0JlOlF9RoJNEQmyZUqReagmAgdF16x3TyrUeNYwg
	 pSbEGrRr2uRRQ4pfU0BAOhB2uyBRiQSE6LZR/GQGQ5lV8xe9PCGErdGFWirgYqhDm3
	 BNYyNcVHg5IA0IpX50HRQtAk8ZCXywBWD5QNQvQRDcXckHmtr/2sTqjlFks1sVZUzt
	 u7Jo3j5GWhU5Q==
Date: Fri, 18 Aug 2023 17:10:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev,
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <e1b0f9e6-8e40-4365-868b-8340153e6a9c@sirena.org.uk>
References: <20230816180808.GB2919664@perftesting>
 <ZN0uNrpD8JUtihQE@bombadil.infradead.org>
 <20230817093914.GE21668@pendragon.ideasonboard.com>
 <44814ed5-7bab-4e56-9ca6-189870f97f41@lunn.ch>
 <20230817081957.1287b966@kernel.org>
 <CAADnVQ+6=RjVziJG6rXwiC0+dEKGTGFNPUgsa4dyPP66NyTbog@mail.gmail.com>
 <CACRpkdbfSzNwkwnew-5YN4j4yBjgh=fCiaKdPmiRbViTdOcXkw@mail.gmail.com>
 <20230818152629.GA13558@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="weAUELek/DUak90e"
Content-Disposition: inline
In-Reply-To: <20230818152629.GA13558@pendragon.ideasonboard.com>
X-Cookie: Your aim is high and to the right.


--weAUELek/DUak90e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 18, 2023 at 06:26:29PM +0300, Laurent Pinchart wrote:
> On Fri, Aug 18, 2023 at 03:55:11PM +0200, Linus Walleij wrote:

> > The DRI/DRM community has group maintainership that works a little
> > bit.
> > Essentially it boils down to ask people to review your stuff and you
> > will review and also merge their stuff in return.
> > Sometimes this works.
> > Especially if you are a circle of acquaintances working full
> > time on similar things, yay! So much support.
> > When you are a sporadic contributor it doesn't work as well.
> > Because you cannot always find some matching contribution to
> > review and you feel like begging.
> > So different solutions for different contributors may be needed.

> I've also experienced mixed results from "trading reviews". It's
> certainly nice on paper, and it works sometimes, especially when asking
> contributors to review patches that are directly related to their
> business interest. I remember asking a contributor from a large company
> to help me with reviews, to free some of my time to review their
> patches. The contributor helped with reviewing third-party contributions
> to the driver they're actively working on. When I asked for help
> reviewing an entirely separate driver that their employer had no
> business interest in, however, I faced the "we're busy and don't have
> time" argument.

> Maybe part of the solution here, to share the maintenance burden, is to
> expect contributors, especially the ones with large financial resources,
> to spent a certain percentage of their time reviewing code that is in
> their area of expertise but not in their area of business interest.

That issue with people having the background knowledge needed to
adequately review things they don't have specific experience with can be
a problem here.  It's not typically *harmful* other than issues with
people doing disproportionately pedantic reviews (which can be a
problem) but you do still need to keep an eye on things it can feel a
bit make work so there's a balance with making it an explicit
requirement.

--weAUELek/DUak90e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTfl94ACgkQJNaLcl1U
h9ASkgf/QcF/ksskyU25RqQxbdTnyPWgKzXWgyUo0Zs8EkeJODXJ7SMbgCuSvmn3
anQuvBBS5tuqzUvSngbluHPsF0mqdEjASsSIGD/rZFaK8yg0YZaDlcZzwMw+1seC
2vzGUJaEUtr2vJ5VrU5J9DLLNBfl3sI8ETBjRDrQri0BqoAZPfxBY/yNOZ2V10qq
BUL19yygRts5aXoK9qS29NHeeIFrCeuJ8snQ6TPqvj1U9HSQIe6qLFizHXAAokEI
Fp/WBKukwhQFg1a/yi6fhXkXpF3MuZm06FQ2Qgy/JAHXyOO3UgCkW5trk2iWX86T
YrFctnV5XjD36B2TCGJzC1WHGeC2hQ==
=+hu8
-----END PGP SIGNATURE-----

--weAUELek/DUak90e--

