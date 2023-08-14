Return-Path: <ksummit+bounces-962-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5074877B56F
	for <lists@lfdr.de>; Mon, 14 Aug 2023 11:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09C5D281198
	for <lists@lfdr.de>; Mon, 14 Aug 2023 09:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D5B1A95F;
	Mon, 14 Aug 2023 09:27:12 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AA1A955
	for <ksummit@lists.linux.dev>; Mon, 14 Aug 2023 09:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF10C433C8;
	Mon, 14 Aug 2023 09:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692005230;
	bh=OC87z0DGHl/VbXRYDY7mhl4G09OriT5gWijD8LgBpII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ErcxBIC7FlecdjfUMv6lDBcuNTbu/wwBtv4WhGf5N010CuqRcJBtDWSjPZkleG2lh
	 crNypLL+I8tJrgOVk7aVvPdwn6rXfOMYuP0Ax6t2zS0ivx13b7+4h5qZN1X+jJDP9b
	 YcqsXlqfHw39v0Ij/W+ng5gDywNrmvzd35ZeqgiEPOQSYd2nSpELFsi91NN3rM+5cE
	 Nu4BslIPzoUwAh0vJ7tzmJslThfgl5gOY+yLkV0MFvDaycP0tMsfTB5C2/fTLX5poc
	 aCOVCYw0LXcU9U7a4Wap7nFUcV2Zo0fdtKyz8IKbHChhzqYRY+XXh/fMse2quH9dnp
	 URzb8Nhym2Diw==
Date: Mon, 14 Aug 2023 11:27:03 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Greg KH <greg@kroah.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Improving resource ownership and life-time in linux
 device drivers
Message-ID: <ZNnzZ7rytURGoby2@shikoro>
References: <CACMJSev18ZdTVDK7j3gCpzw4rAiaNMZRT4KSvLzd99H61XwMOA@mail.gmail.com>
 <2023081048-skittle-excusable-2c9f@gregkh>
 <20230810204713.GF402@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D6D9nhKGp3Y+ne+t"
Content-Disposition: inline
In-Reply-To: <20230810204713.GF402@pendragon.ideasonboard.com>


--D6D9nhKGp3Y+ne+t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> > I'm all for this, we need some major work in this area.

Obviuosly, +1 from me as well.

> Likewise. I will however not be physically present at the kernel summit
> this year, but plan to participate remotely.

This is possible? Would be great, I'd also like to attend this session
to share some more experiences which were out of scope for my talk at
EOSS.


--D6D9nhKGp3Y+ne+t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTZ82MACgkQFA3kzBSg
KbYXhw/7BzQjiziD62lhudK93Z9925t1N/hHzc3T+oEDZD472HMV/OkgoKTWz9Bo
z20BpT4UIpJLR0VM5FWVhlJSX6X8dfuFLMMXH6WCk6itDsAWJsm55N+bfsYmLbrZ
vBoZmSCaizpZSO3pYoCgwS5gfZAlCe/t+JTfk0ARilIrdv6fW88/C2dAwkD+Pr8x
jSyVHF6duIg75IleSEM4MR7/YtbLp9YI+PfBjDb7P6mJsjicB0j6WPqXTHrSsPDa
cjRwwbWB32N2yNhE+/ad1U5QGRGW0ZY6G8QwxGVKVdqQcei4rfkXnp8PwU8xevo3
Fnx3FSe7O5g2QQD3mOKRJ/h19Nz8mz6ancpEOLHWXlEr0wq+DcWTQXQr5QF15lb1
BRfQz9s/jJHeJYtTY5kv6XiMSKyK9fQIoCiLeP9DrgeMrST26pVXaxjhdKTs+6eN
WZ02itZU7KlF4CAE8BoBYhylJrjuY6Sp5pXCHPeEkGSpSuUe2AOLPt0LhppdBCvj
msXuDR6tg3JS+fWNwZ4z+7wKHGjR1AMM965zEfx7jIJCbcjWedbcJV7W98X0uAK7
xS/f6UTDRUa5Zk5h2hIPB8GbdVJpWUbMsrVrttCFGSLFbLnxN3Au0MVH/9VYsyj1
I7M/Lqv66W76VOl/7OBmhmynf6jKXXgD0HV3y8TxEdgMJ5vRI9g=
=iT4Q
-----END PGP SIGNATURE-----

--D6D9nhKGp3Y+ne+t--

