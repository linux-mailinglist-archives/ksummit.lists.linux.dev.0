Return-Path: <ksummit+bounces-1064-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B9B7878F9
	for <lists@lfdr.de>; Thu, 24 Aug 2023 21:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 196C91C20ED4
	for <lists@lfdr.de>; Thu, 24 Aug 2023 19:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D6117FFA;
	Thu, 24 Aug 2023 19:58:18 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A004B17FF0
	for <ksummit@lists.linux.dev>; Thu, 24 Aug 2023 19:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F84DC433C8;
	Thu, 24 Aug 2023 19:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692907096;
	bh=6fTL1rMPZmY+HRwy2qp6eWClw3gCJWu/WGis1iqrmYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I6hkIy1x6KEZKzYCxLqEnP/myyO3O/18PXwJAXnoafJEWiYHS8k0K8xLlMm/WORR5
	 a9o5JehwuCZMeuYxXnN4kkLa63crYkLMhRwwya3Ki5O0LrjkliSSSgCs/KvaF4zZ6B
	 sZSrcyzRfGFC5mf3uszDNjRqem+2RYPhlevO0g4OUgI5NVhtLzGZBAiAzKkKYkywli
	 Dt9jRBzJVMH5fe/gJkiHjspX6J7NiP3OnLq1QTNPZldRe+YQXbfxDoDSXP1c+t9kZO
	 U9AuLbx3udgxaLkcMjqpWjlr+ztV0RUcNtwDBL3fnbhmWZm1/OfTO9pVZk63GqA/y1
	 J/k55ZRU4x4Cw==
Date: Thu, 24 Aug 2023 20:58:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: "Bird, Tim" <Tim.Bird@sony.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Dan Williams <dan.j.williams@intel.com>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] Between a rock and a hard place, managing
 expectations...
Message-ID: <ZOe2VIuCkmal5YpV@finisterre.sirena.org.uk>
References: <64e404a979f54_4c1f3294d3@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <2023082250-replace-rectangle-1d47@gregkh>
 <20230822142913.GB14596@pendragon.ideasonboard.com>
 <ZOaofrS7/lErEYB5@nvidia.com>
 <CACRpkdbt-GxDgGbpETJTjBXz6qH2yLFgTR8BVVU9EU1uj7tJ+Q@mail.gmail.com>
 <ZOePd+0Ncywxa5kZ@finisterre.sirena.org.uk>
 <BYAPR13MB25035A643E9E57FFFE06B644FD1DA@BYAPR13MB2503.namprd13.prod.outlook.com>
 <6c140552-9c1c-5038-35b3-443d60de31f1@acm.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Dgt7drZppyOA/g06"
Content-Disposition: inline
In-Reply-To: <6c140552-9c1c-5038-35b3-443d60de31f1@acm.org>
X-Cookie: Give him an evasive answer.


--Dgt7drZppyOA/g06
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 24, 2023 at 12:29:34PM -0700, Bart Van Assche wrote:

> The GKI indeed makes changes to the core kernel harder after its API has
> been frozen. Does carrier certification really require changes to the core
> kernel?

I don't know anything about the issue Tim was facing but I've definitely
run into issues during testing which were best fixed by extending the
core, sometimes it's not a straight bug in the core (which I'd guess
should be relatively easy to get a backport for, you can probably just
go via upstream stable) but rather that this is the appropriate layer to
handle whatever the issue is.  Teach the core about a concept, then tell
the core that your device does the thing which you've discovered needs
to be handled.

Note that I've got no experience working with GKI here, but unless
things have changed a lot there's not really any phase of the process
where there isn't substantial time pressure.

--Dgt7drZppyOA/g06
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTntlMACgkQJNaLcl1U
h9BZ3Af+KjwOmi91vjzTcHwYZmqD9B8mFIaohqH7AggCTgSzzxHLlkf11sxu8mCY
XvXtKN+pS2Qnpl/lhE3vr7fCwDWPrmk5tYC0zOtx9/j6gIsQ9Vd4rL5FAtAyOch5
641MsP32DZtQvMOVZH5sOPpwnGMi4undlritbKBKjIZAB1hz1SxmVBQOrDGThKEW
iHQDZmUH+LEeVQAhg6Ecf8LfHRs8p5r7bf5f0D2Ld7QR8mm8+Q3a9llRnhPqtmbT
qB1ECLl6j9+aOD9Pp+WSH1d5Ebfb01S/eBBu0UEXrHdActKA18bi0xXKL+7FFVB+
eqVBtef3ha77usxh80Qvmo39BzgJwA==
=0nQy
-----END PGP SIGNATURE-----

--Dgt7drZppyOA/g06--

