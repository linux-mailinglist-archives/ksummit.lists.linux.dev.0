Return-Path: <ksummit+bounces-621-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DD2411A9D
	for <lists@lfdr.de>; Mon, 20 Sep 2021 18:49:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 885823E0997
	for <lists@lfdr.de>; Mon, 20 Sep 2021 16:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAFE23FCB;
	Mon, 20 Sep 2021 16:49:22 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E0F3FC0
	for <ksummit@lists.linux.dev>; Mon, 20 Sep 2021 16:49:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BFB1461264;
	Mon, 20 Sep 2021 16:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632156561;
	bh=h5aUgFqlNI3WvfuA6oZ7bur008EatgMqOP4SEDUVcYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lmia3PFbFRoRc9VDHklXt9pvQP5DTBkldBDZkusl2lE6vp4MTh+QD8UzlIlcfGnc9
	 dbsLKxegn4zGIQ5z10+qidKJ1WKqFM2mivvfhlVW5UWMTY0DFsM4uN7qWIB9ifFhL5
	 j4OXfhGn/Gkuin31JRwxqoyvcdQXLCI+aIvjJzST72fgOs5Kgw4YmZxdGqt3if/0hn
	 5it4IeomIj4av3c5E5YHHJ/MbaXaeAX5QTPB1uqCMt6Q68YFfs9kXbSdGvlgxm6wT6
	 xdIPWpPt1RHLUElBOfTa3Bm1Y0+QQ6nWwlmmYytZLVWr5ERwynAwbHPWjalnD8SVdQ
	 OypSuHajRhzLA==
Date: Mon, 20 Sep 2021 17:48:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Laura Abbott <laura@labbott.name>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Dave Hansen <dave@sr71.net>,
	"tab-elections@lists.linuxfoundation.org" <tab-elections@lists.linuxfoundation.org>,
	ksummit@lists.linux.dev,
	"tech-board-discuss@lists.linuxfoundation.org" <tech-board-discuss@lists.linuxfoundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Tech-board-discuss] IMPORTANT: CIVS opt-in for Technical
 Advisory Board voting
Message-ID: <20210920164837.GK4192@sirena.org.uk>
References: <44ee2bfe-e4bc-b918-b908-7352ea012524@oxidecomputer.com>
 <dfa20866-0d00-9bd3-6078-5544cfa5b633@sr71.net>
 <CAMuHMdUUfm6u_Pz3qzA0V7tLZd7jhcwdyxU7L0SyC_EdyzwQxw@mail.gmail.com>
 <CAMuHMdVtHDQ2f0VKAdQFQV9dZJ5uFGD9yHvNviQ_k7AEfhN77w@mail.gmail.com>
 <bf22702e-01b2-214a-1650-da9e4ec3c2be@labbott.name>
 <20210920162329.GJ4192@sirena.org.uk>
 <5c88ae67-df7b-60ab-d087-bd244753c98f@labbott.name>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q5r20fdKX+PFtYHw"
Content-Disposition: inline
In-Reply-To: <5c88ae67-df7b-60ab-d087-bd244753c98f@labbott.name>
X-Cookie: diplomacy, n:
User-Agent: Mutt/1.10.1 (2018-07-13)


--q5r20fdKX+PFtYHw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 20, 2021 at 12:30:23PM -0400, Laura Abbott wrote:
> On 9/20/21 12:23, Mark Brown wrote:

> > Will we be getting some futher mail when we should vote?  I opted in but
> > didn't vote at that time - I saw the vote was listed but didn't realise
> > that voting was open since people still seemed to be nominating.

> Nominations are now closed and voting is now open. Please vote at your
> convenience.

How can I do this?  As (IIRC) Geert reported if you've activated your
mail then attempting to activate again causes CIVS to report "This email
address is already activated" with no link to any existing polls.

--q5r20fdKX+PFtYHw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFIu2QACgkQJNaLcl1U
h9AxXwf/UQk972ULeZVJbqG2yOA4OK4MtCm8iHoBSZZH4vRbiDhKV+YDIiqNEq1b
yAQNnh1eRyJwxF4TH/UHLN23rgNV+/QavvTnpZ0jVam6SVmDZSTHD3Pll2kiOBFF
ak252NZ70EKLZQ11D1Z9vl8uRbdgvLx+GDui9VMdIUg2dfbYCRxy2hg7wYKGCaIy
X/i58X41bI5N3ZpssXQWAo8Z00ZKL8LggkdVqRuhmlgf5cMI+thQyJFCb8kV3Yb5
n9mm5qM1vR5e2Uh55kakiCi2Vp8EPbwiKiOG5tdn3tM8BNYmCR5TFpoGhn8eZuA1
7NXqPlQDJFabX8EViPHCHMSrW9vRrA==
=sjK/
-----END PGP SIGNATURE-----

--q5r20fdKX+PFtYHw--

