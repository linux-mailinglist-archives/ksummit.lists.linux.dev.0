Return-Path: <ksummit+bounces-1039-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8691B783105
	for <lists@lfdr.de>; Mon, 21 Aug 2023 21:43:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B70AD1C209DE
	for <lists@lfdr.de>; Mon, 21 Aug 2023 19:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C191211711;
	Mon, 21 Aug 2023 19:43:33 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7860911707
	for <ksummit@lists.linux.dev>; Mon, 21 Aug 2023 19:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92CC2C433C8;
	Mon, 21 Aug 2023 19:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692647012;
	bh=ECbZqBnQvMekEXoHuDPKvzpnLB5O6MZMwNc3lYsc5RA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TqCywXXJ28e+2ii4+5rGiXVvbyeTnz5SMwHj0Jp1EeySEynF165hCheD0hzyEjeJc
	 ee/Ywx3vbu8yYrNYDtaRJPa7aIrAZPUYtVvOxT5goVj6K0VAG7aUOqBVXUHx10yqSY
	 r2ZJ0vV6QvfJhMYg+lD4tnAWpeJgVQG9g0W7gq1RPtGRNkb5XFi80rYBu8fyIPDDla
	 VKnk+gl0Jnhm7ObdDz0sx5vh7YG1dfE5lngD7v+0xmJUO73D0w2+DsgAUx2mMyTDCf
	 LxYvveoQt+gta/aozRCAZDqUUaHZymMxGHG/glr70dSiJch6GJNB/aAYuhNi8WBbnW
	 ZfQkMzW4szE/w==
Date: Mon, 21 Aug 2023 21:43:29 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Transparency when rejecting patches without
 technical reason
Message-ID: <ZOO+YZrPNmop8it6@ninjato>
References: <ZN9ZfUVHrRhd+btc@shikoro>
 <CAHk-=wgQKBvXaSNVxy-2Q3KYeTbv-CGSTf3LSV3=O5howAPifA@mail.gmail.com>
 <ZODsKnm7B1Q0aPbx@shikoro>
 <CAHk-=whAAQi8EtCbaXx6rn63EfrvpeB10fQKqGCH1x8JfdM60g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tvjKOP6SJN+t1VBB"
Content-Disposition: inline
In-Reply-To: <CAHk-=whAAQi8EtCbaXx6rn63EfrvpeB10fQKqGCH1x8JfdM60g@mail.gmail.com>


--tvjKOP6SJN+t1VBB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> So unless you have a crystal ball and can predict what the next event
> that would cause us to not accept patches would look like, what is
> there to discuss?
>=20
> That's kind of my point.

First, thank you for these answers. They provide further information I
was initially looking for to get a better understanding of the
situation. I was simply wondering if we couldn't provide such
information right away, but maybe you are right with that it is hardly
forseeable and, thus, managable. It is probably easiest to ask the
involved people directly next time. And I am all with you, I sincerely
hope there will be no next time!


--tvjKOP6SJN+t1VBB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTjvlwACgkQFA3kzBSg
KbZLDxAAk/Wzk10tfIKkzmVI3BeSE2uBBnYNv/1x8orh/9PIe0WzAy24Y+YhugRb
MbLcGFxbFeoEzI3W36FY/E7vvSvEn6c9LzKIkcV1jnRl0LGXFFR7hrhnlF5yrsAb
sn22R3AHjaqNDpwpgW/cn696mB+YN3IYw9cmTP6UMWfR7/uYZh5LVVTsKk3HlWQh
68dL6LlT7knpTl7BT090wAtmaWXltBjjhIf1+LABdcJ8i4iSQNjsqp4GW3PNF+MQ
a47cJufH3EmB6y/kMkVfQv+yyCdTk/Jfflbu9XZIfsQEaTa4EIHNp7BcFLSUYUIL
RUzenRNj53WSI1JmbIvxYb4g2Xnt3uUZjJlypJGe8kGgStzVdMEt6W2CjHf17XIF
DEo+Cxr6TKrGz6IorfpVRfVFKGM6OuEbv1Rjw9zdVjmMOcRu5YQ89VX8BF+gZ2PL
Wqo/sLuie+Gggbqssb/Ify398+X/Tpez7STNUASDbYQOdYGrzdZlH+yJfFx1Mmx0
Cl9wt8/DPfqMVJsc43fk/YFcKaSElMdknSaWaYwsB+UwfD6qWu4rgxut+mf4T3D/
cT/g1vXhXwfgOX//z1U2rYmeisW4TEamkvCNQEXuLiVf1Zj43s2Ni6aPFVLa/IPp
4Zlva2BT/pJI6kbtDxRYMxsLq0vxzwZ4oL0180urWopJqTs6jDQ=
=vFzX
-----END PGP SIGNATURE-----

--tvjKOP6SJN+t1VBB--

