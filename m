Return-Path: <ksummit+bounces-549-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F194089E7
	for <lists@lfdr.de>; Mon, 13 Sep 2021 13:11:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id A51F53E1059
	for <lists@lfdr.de>; Mon, 13 Sep 2021 11:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 972E33FD7;
	Mon, 13 Sep 2021 11:11:18 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7813FD3
	for <ksummit@lists.linux.dev>; Mon, 13 Sep 2021 11:11:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6EA5160FE6;
	Mon, 13 Sep 2021 11:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631531476;
	bh=8PyDkb2gyBouM/JF2vkn1YKWrY8Vf0fBj3xwcHpJMmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nfrgFbTEZmEK9tBOxLiIUdghYlqkol2C5RnM2sK1LzNZBAJI7v6xynP9F8MzINdMj
	 ZywPOsMmcf5fAujbvSsVYASEtcbuWhmAqMlh5nAlW0WX8YGS+2r4gDpQkN8WQ5YS2v
	 FW3seM5btbOy5uJ6hL18T6T1z6nZV0ym/8ccH8JS3+av4cZF2EJeMRfhVHJZTcruII
	 wBsYQinvPvyERe3+9KplllgtawYe2vcUREY4pqcFD4Io0DAY5hazVDL77D5kz/QZBS
	 hVsTPEEoDL6/xf47RJr7E6tqQOsA63uye1nUIZ5AENZuzXRhkuSaWu1eYM69e1rVtN
	 +U9s1d5JB8PlA==
Date: Mon, 13 Sep 2021 12:10:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Josh Triplett <josh@joshtriplett.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <20210913111036.GA4283@sirena.org.uk>
References: <877dfop2lx.fsf@meer.lwn.net>
 <20210911005214.71b55ac6@coco.lan>
 <YTvuDsrUNhg/VXD0@localhost>
 <87ilz8c7ff.ffs@tglx>
 <YTv2YvLmzlJA4+tc@pendragon.ideasonboard.com>
 <20210911102007.77b8a189@rorschach.local.home>
 <YT0o91bQ7+O5yBVu@pendragon.ideasonboard.com>
 <20210911184205.778393d3@rorschach.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline
In-Reply-To: <20210911184205.778393d3@rorschach.local.home>
X-Cookie: Above all else -- sky.
User-Agent: Mutt/1.10.1 (2018-07-13)


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 11, 2021 at 06:42:05PM -0400, Steven Rostedt wrote:
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> > If you wanted GPU drivers to have tests in tools/selftests, you'd have
> > to move Mesa to the kernel :-)

> Some selftests have dependencies. It could require that Mesa is
> installed to run the tests, otherwise it just returns "unsupported".

There are some constraints on selftests for usability reasons, adding
too many dependencies and too exotic a set of dependencies works against
that - we already disable the BPF tests by default because it is not
reasonable for people who are not actively working on BPF to be able to
get the dependencies needed for the testsuite up and running and it was
causing disruption to people trying to actually use kselftest for actual
testing.  Of course there's a balancing act here with having the tests
picked and used by people but the kernel is such a big piece of software
it seems reasonable to expect that we're not going to end up with
everything in one place, and if it's not solving a practical problem for
the people actively working with the tests it really doesn't seem like a
good use of the limited time people have to work on quality stuff.

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmE/MasACgkQJNaLcl1U
h9Bu+Af/d8/UJK6JA0ySS/qnGCbSRB5ttev0IW5H/0bXraJyvpJzdJBmv6bGRcxS
IAIA4r1od4yAX91AmJimR73T1XLw4CfMWxXCM3gippMfZ4YntFsybhyz84l4tHnF
WEiAgMMr8A4JOYekK6C3H+6UXxkZkB0+prJyke1hq1soeI1HrGU6I3KM0yfNmvIG
dK3uUac08jCOFE5n03KafVDEXcbNP2RGmdV79l8iVFuhHthfWqHp2ij6aMzGCUva
9o4Gw3X2+Z3+bOtxSxDuFFYtonOYgdjId4TYLulhxaJc4Au6jg+4zze/CFe4GJGI
FSdstk3GQJRu1O5l7pu7IzfWf69vYg==
=RKtH
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--

