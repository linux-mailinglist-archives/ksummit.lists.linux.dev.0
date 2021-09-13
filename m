Return-Path: <ksummit+bounces-550-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FB9408AB3
	for <lists@lfdr.de>; Mon, 13 Sep 2021 14:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id CF0FB1C0FAD
	for <lists@lfdr.de>; Mon, 13 Sep 2021 12:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F5A3FD7;
	Mon, 13 Sep 2021 12:05:23 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E283FD3
	for <ksummit@lists.linux.dev>; Mon, 13 Sep 2021 12:05:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1CF0A60F6F;
	Mon, 13 Sep 2021 12:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631534720;
	bh=9KAHLBTzmhtbb0OmRWn91J2kwtfVvLGqVmX4Mgxwejs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ngPbDC0juEwSHBPiGEZqGpic8okXYbv82agSP+Sz1J7C4jhArbA2xZ4KYMEI0bRO0
	 hHLUsdppV4rEosD6kDMcQgGZd86WaD1UwbDAGqOJ4Cvj52eXMiYk6T7e1LLDbVh6Di
	 hwCj74Xq1wcZlNEfkIv/9L3ecg6glt0yyvbTIpoaGrKXE7gWyj4BSYaMBU98asKyBG
	 p/gjWsc4Ij8N4vto/JA/85qYi/0qRLWNyDpqNyQwVtr2lsHKaD1RtgFGHfwq6Os144
	 IFnY6E8skf4zlMpGtZOKPAHXciwvOjVeF3vCUSsVHitya3QfyPnz7MN/vM6RlyhdT1
	 GaYE7QiQ261mg==
Date: Mon, 13 Sep 2021 13:04:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <20210913120441.GD4283@sirena.org.uk>
References: <877dfop2lx.fsf@meer.lwn.net>
 <20210911005214.71b55ac6@coco.lan>
 <YTvuYmqLESpGvXD7@pendragon.ideasonboard.com>
 <20210911023811.74b82f10@coco.lan>
 <YTx2iShbdcrY4SMk@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wULyF7TL5taEdwHz"
Content-Disposition: inline
In-Reply-To: <YTx2iShbdcrY4SMk@pendragon.ideasonboard.com>
X-Cookie: Above all else -- sky.
User-Agent: Mutt/1.10.1 (2018-07-13)


--wULyF7TL5taEdwHz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 11, 2021 at 12:27:37PM +0300, Laurent Pinchart wrote:
> On Sat, Sep 11, 2021 at 02:38:11AM +0200, Mauro Carvalho Chehab wrote:

> > > which we
> > > could consider as an alternative to the open userspace implementation
> > > (a topic worth discussing I believe).

> > Yeah, a public datasheet sounds an interesting requirement. It offers
> > a problem, though: maybe some details could be missed on it, which
> > would prevent any real open source userspace development.

> Absolutely, and I don't think we can come up with any process and
> technical measure that would prevent a vendor from cheating if they
> really want to. It will always be possible to hide some features behind
> reserved registers that wouldn't need to be programmed for basic
> operation but that would be crucial to optimize the quality or
> performances. This is regardless of whether we want to enforce openness
> of documentation in the form of datasheets or source code.

This is already very standard in some parts of the industry, even
between vendors and customers.  Sometimes it's done intentionally but
it's also often just that the actual practical configuration process
relies on some non-trivial test system and perhaps has as much art as
science involved.  It can also be a decision about managing support
costs which works for everyone involved on the business side - sometimes
the product being delivered includes the vendor doing a good deal of the
tuning for some combination of cost and complexity reasons.

> I'm not too concerned about this though. If we can address most of this
> issue with a clear process and message I think it would be a very good
> step forward already.

Yeah, I'm personally not so concerned about the callibration and tuning
side - ideally that would be fully open but like you say even without
that we've achieved something and there may not actually be anything
extant to open.

--wULyF7TL5taEdwHz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmE/PlgACgkQJNaLcl1U
h9Af7Qf+KdfBH10ey/3qoHvDuxgB6DjRKh6JHZEwZztPPlfDshSPulZzagBy2eD0
LW8/4aBnThEFf/lwpPCEM3ZgqIj3ZMsvjejV9wF1lclWXZ1+iwB2uJlPAypESZ0L
1C1oVfCDDyeYTgahMm6fICLMWX2Bllbqxg/k9sLE32ZlBEMMNAuxzlCpwl5JLE4h
wPiP2o62qmrhYEVKty1UhhTDJydyIMJ1CCeKTs/cLDSU1ojhdbhHi4fWi5YKm++p
XG3T13HNsI5kvyRXBc5h40h1IuwJOJpn5BtJHbnNQmDkPJm3mp8cK4sFKgYIQaae
meS18dtkt5T8mzE7u8NMuMSJjiN6bw==
=FW9Q
-----END PGP SIGNATURE-----

--wULyF7TL5taEdwHz--

