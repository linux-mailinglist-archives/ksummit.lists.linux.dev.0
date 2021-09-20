Return-Path: <ksummit+bounces-626-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B58411CD8
	for <lists@lfdr.de>; Mon, 20 Sep 2021 19:13:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 79A241C0EDD
	for <lists@lfdr.de>; Mon, 20 Sep 2021 17:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A21B3FCB;
	Mon, 20 Sep 2021 17:13:22 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE2429CA
	for <ksummit@lists.linux.dev>; Mon, 20 Sep 2021 17:13:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B17E661BFD;
	Mon, 20 Sep 2021 17:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632158001;
	bh=wfl+/NnUVvY43mktEA8yjZIL5NnPVp2ojIjw5W6uW3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HDUv3bZf8k+uYmrZDWxmLZImmbNcp0mAPa9dnE33CX3SNnW5AiyXV/Ix0tgzbfoSZ
	 JdifMpwjfPFnpPLmLLtpTt5imvid+UGkIRTzB6JXQBfHxotMa5T87vBb6coAuyv5c7
	 zGP12OfHwCSTXSEfK9Al0gSoohUq5drgmKeGTYTYBhAdo40/Rv2C2ABKdorSmRkckf
	 2fB6WTKBVaGdxaJ9xRj2WC+H5CLLcz/2uXUVIwbe7RfhhWfOT+apJjzIASZR1lmxeL
	 eRk5fQGrrSNzakOQwikaDZQgi2K9w3QDBZtrCCp3KeLl+zng2xBchUhsfP/u3MrohJ
	 xQM0qbkeKIIEw==
Date: Mon, 20 Sep 2021 18:12:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Laura Abbott <laura@labbott.name>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Dave Hansen <dave@sr71.net>,
	"tab-elections@lists.linuxfoundation.org" <tab-elections@lists.linuxfoundation.org>,
	ksummit@lists.linux.dev,
	"tech-board-discuss@lists.linuxfoundation.org" <tech-board-discuss@lists.linuxfoundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Tech-board-discuss] IMPORTANT: CIVS opt-in for Technical
 Advisory Board voting
Message-ID: <20210920171237.GM4192@sirena.org.uk>
References: <dfa20866-0d00-9bd3-6078-5544cfa5b633@sr71.net>
 <CAMuHMdUUfm6u_Pz3qzA0V7tLZd7jhcwdyxU7L0SyC_EdyzwQxw@mail.gmail.com>
 <CAMuHMdVtHDQ2f0VKAdQFQV9dZJ5uFGD9yHvNviQ_k7AEfhN77w@mail.gmail.com>
 <bf22702e-01b2-214a-1650-da9e4ec3c2be@labbott.name>
 <20210920162329.GJ4192@sirena.org.uk>
 <5c88ae67-df7b-60ab-d087-bd244753c98f@labbott.name>
 <20210920164837.GK4192@sirena.org.uk>
 <ebcaac1d-9b97-81d9-28eb-eeb51c51673f@labbott.name>
 <20210920165716.GL4192@sirena.org.uk>
 <0279daae-f1f9-b52c-6aef-f016914b21bc@labbott.name>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m0XfRaZG5aslkcJX"
Content-Disposition: inline
In-Reply-To: <0279daae-f1f9-b52c-6aef-f016914b21bc@labbott.name>
X-Cookie: diplomacy, n:
User-Agent: Mutt/1.10.1 (2018-07-13)


--m0XfRaZG5aslkcJX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 20, 2021 at 01:10:48PM -0400, Laura Abbott wrote:
> On 9/20/21 12:57, Mark Brown wrote:

> > It gives a list of all polls on activation but it seems like it doesn't
> > get that far on reactivations, it looks like it's generating an error
> > refusing to activate again before it gets that far.

> I just resent the links again. The e-mail server from CIVS can be a bit
> slow. Thanks everyone for your patience here.

That seems to have come through for me now - thanks!

--m0XfRaZG5aslkcJX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFIwQQACgkQJNaLcl1U
h9C+fAf/QdcerKG0a5zBUx9t5QxcK9CvK+j3FYPy3evrbsUqXGGNSUsAYlrjdcT2
0EnPxD3HOGN1YW+i3IfQzFt02zZNMrm9qXPg+iN9Kb8JhTd+Qvy4VwN0yRsU3VrW
cwfB/Y+fg1+jaYAgUwUGL/o7sQTF2448haT/MXup9uuo0GoyD7HrvGTLPyfpY9Z0
auDwqyo5Qt9XryuToHQJQBfgnmmHgQZnOOtMujiq/UxRDE1MFDWP5ZuExcKDNAVe
VzCbVvtkkWI41CEadj13UXY2OG6b4QTQNTamIfIfSQbm88Mn8YnI2SiM8SYIm6uq
T8Wx8al1lzebZwP3A4CZWfnd4rvnlw==
=hWdJ
-----END PGP SIGNATURE-----

--m0XfRaZG5aslkcJX--

