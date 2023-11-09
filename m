Return-Path: <ksummit+bounces-1204-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 109567E6978
	for <lists@lfdr.de>; Thu,  9 Nov 2023 12:22:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E063D1C20C24
	for <lists@lfdr.de>; Thu,  9 Nov 2023 11:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676E3199DF;
	Thu,  9 Nov 2023 11:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KED8DCTe"
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7CE199CA;
	Thu,  9 Nov 2023 11:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC0EC433C8;
	Thu,  9 Nov 2023 11:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699528914;
	bh=H38QywGmimFcFLqGSrhNg/50t8gDbDPxUY8+7C78Uxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KED8DCTeK8yx2Nixj43JmuDhRVnnjDg8DEcxbDFG4ew3vtLsYCwyyJKbbB9evlxSK
	 Fxk8GqYXpm6XkMamLZfu5cv2jmfXtPBde4d+vDue/2edYBKooYqTxpsE8MChjKOS3Z
	 vv/sGrosvzEGDJCl7CdFQ6OV5WTsvX+HTl8pZp5snY0JTuCrszXECySUdiLzU4W2r9
	 3MzNBeyEKVSnDfFH8+9CdUChMabPw92Ny1QTxw67fncmVlTxysrgHmzvZBSUmAqvcv
	 4A4wxAOBPpmCftHnwVIZ6SDVMrXSsarNN2Ap5rhN88zr4TwK33zj3DQlmhqUTWPQCa
	 bWJcfalit4d/g==
Date: Thu, 9 Nov 2023 11:21:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Joe Perches <joe@perches.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, ksummit@lists.linux.dev
Subject: Re: [workflows]RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <ZUzAzl9I7h9bjMp0@finisterre.sirena.org.uk>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
 <20231106110547.6956a430@gandalf.local.home>
 <280f404dcaab5a1cee2cc67f829c1d85aa91d772.camel@perches.com>
 <ZUu68zEzrlDVenA1@finisterre.sirena.org.uk>
 <6737487f097401510c87f38239d2f75e22fca46d.camel@perches.com>
 <20231108140415.46f84baa@gandalf.local.home>
 <985f7533f6d6e28f78d695b34a24702c3dd4eb1c.camel@perches.com>
 <20231108143447.12d73140@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W63gAsQP+c+BrACA"
Content-Disposition: inline
In-Reply-To: <20231108143447.12d73140@gandalf.local.home>
X-Cookie: Slow day.  Practice crawling.


--W63gAsQP+c+BrACA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 08, 2023 at 02:34:47PM -0500, Steven Rostedt wrote:
> Joe Perches <joe@perches.com> wrote:

> > > Right. For example, I use linux-trace-kernel@ to add patches to patch=
work,
> > > but I prefer the discussions to be done on LKML. =20

> > How would that work?  Especially with get_maintainer?

> The way it works now. Just Cc both lists. What's the problem with that?

So that's just CC the list and then both the patch and discussion end up
on both lists, which one you use is more of a personal thing with your
workflow.

> TRACING
> M:      Steven Rostedt <rostedt@goodmis.org>
> M:      Masami Hiramatsu <mhiramat@kernel.org>
> L:      linux-kernel@vger.kernel.org
> L:      linux-trace-kernel@vger.kernel.org
> S:      Maintained

That wouldn't be affected since it's an explicit thing in the entry for
the subsystem - it's not being picked up by the wildcard entry or by=20
get_maintainers just automatically adding a CC to LKML to everything
even without it being explicitly listed.

--W63gAsQP+c+BrACA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVMwM0ACgkQJNaLcl1U
h9BPBQf+MYfl4RArXFFiXIV1CdIYOPN4LUl6Ve1LY/AwvAzgdf57NogzfyJv0OyM
UJHD/g8hx3DdCzS9u0rj19u+7LFheC7LVYijOy8//pRM1m84pv3wfZjrsmIg6c5Y
+z4cnT6zHsu2DS77k204hjko1Sy/vbWcRVuTbYZZR8M/93bguo+hMteZQfxI+LY0
Ac7GMwrYcOj6xrIUBIcrjoYzo68WN+KYgA6sFIteMI0WgwEDinWybLmhKxdjoeRi
M/JD0ojXscTxV3sT2B3nFSESoARsaCY1UUF2JkSGyO43bg1QK5Dy6lQ5S8c/D0z4
XFIRT+3MWDfaEwSw1JGamOEpti5ttA==
=0v/c
-----END PGP SIGNATURE-----

--W63gAsQP+c+BrACA--

