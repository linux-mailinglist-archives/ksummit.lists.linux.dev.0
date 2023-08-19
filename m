Return-Path: <ksummit+bounces-1031-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9486781A7F
	for <lists@lfdr.de>; Sat, 19 Aug 2023 18:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B7D21C209F4
	for <lists@lfdr.de>; Sat, 19 Aug 2023 16:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F81819BC1;
	Sat, 19 Aug 2023 16:22:11 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B91019BB7
	for <ksummit@lists.linux.dev>; Sat, 19 Aug 2023 16:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9844BC433CD;
	Sat, 19 Aug 2023 16:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692462129;
	bh=7NftGz+RY9f9Ajl5FaqpP+570seasZAMre3cPy9w5H4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ws+ZEVjK8UgNaooXuhguBRV7D27nM1f6GFQ9CaGJohFvBrTw8ZRFpPowjvW9oxo2m
	 WUyafpINkL6Cx0b2KNCJbN0wvZG1lkRbExSS4FcrOpIOhUqBZdsJ2xKpcM77j3YLDq
	 L5SgL4mG/V7rcvTborWNl/aWQvTTQEDFhKGZFxd6nWvyLZ+N7UVdyLEP/sUn99rsCf
	 vDq5emJCGoamR6Hl9eesYGgBW/BAMZCt0q8Bn0YWsD/3Nn1EWMzaDz8tBgb6pdTLWu
	 GNinlqbg4PrG3C14tztRoH2DifjSkE02Cf4GHbRmVawEVGf/AN3qEq1yORTyh+I/3i
	 +kCx3S1CF+CpA==
Date: Sat, 19 Aug 2023 18:22:02 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Transparency when rejecting patches without
 technical reason
Message-ID: <ZODsKnm7B1Q0aPbx@shikoro>
References: <ZN9ZfUVHrRhd+btc@shikoro>
 <CAHk-=wgQKBvXaSNVxy-2Q3KYeTbv-CGSTf3LSV3=O5howAPifA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aB+2iWZCVGDGbVS2"
Content-Disposition: inline
In-Reply-To: <CAHk-=wgQKBvXaSNVxy-2Q3KYeTbv-CGSTf3LSV3=O5howAPifA@mail.gmail.com>


--aB+2iWZCVGDGbVS2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

> This wasn't even remotely a gray area.  It's not worth discussing.

I hope you understood that my wish for transparency was not about
discussing if the patches should have gone in or not. It is about
discussing or at least stating which reasons we have for not accepting
patches. From the netdev maintainers reply, I couldn't understand if
being "uncomfortable" was because of personal or juristic reasons. As a
result, I was unsure what to do if such patches would have landed in my
subsystem. If it was personal, then I may or may not have a different
opinion, OK. If it was jurisitc, then it might be wise to follow their
expertise. Of course, I could have asked the netdev maintainers. But if
it is written right away, it makes things easier, or so I thought...

Regards,

   Wolfram


--aB+2iWZCVGDGbVS2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTg7CQACgkQFA3kzBSg
KbZX4xAAobjsleFaKsU1Yf20NCuSO6KxWmTOCSU5fGdg2nlHqFcGcdLF4XEOaO7n
LmlpK8YOQngwU/MPk/H+tO0dTBs0kXxZDt5fPHUUzSIMxfWsFClb6UsIvhhP4QXm
waOWIC3GvgihkBjIZ+CGdcIb7q0sdIZEd/fTXBJXKirsMJupfdmC8vOelGlm56nm
gpqS+DhPd7ArV9VsUlRwxKyZ9yRngv/MA4igovXqeiXJGOVErX9x9b1ABpGwFbe+
SqqK1+zbJjwiwSHOAf9FTMJiknXvnO7VB161h2Qp4afCm9KFuWyNl1PfHXE0Zhj2
dhKQT5s7HGEDRhFU1s2vdnYWaYYWyiz4UL4fZs4jKfVHiAaru+U8FaayV1y6J+m5
swX1/Xqy0VkKg8MBVdbODJbU/+KLxUkWSU8B+LSelMrLyH2OVcwQoxC5KWvaBBA4
Q+khGKhUmxrsgfdOigJEifKCHsw/tqzQi/40La9XulkO+LK3miAHk7iFG5oEh0Xk
jEDJ+ADS9Q8/Ly+QzKYxcTxs2mAWrxlY3RL1TAEihYVKCP9W+MYHXs3V4hv2zRXx
HVtyqNK2X28gSDKiwREqYviCmUxaBXzk75Lut0zRITs/UilISZfSbu5IXWpbWM98
7dumOnCiWC+Y9Vs12kmZlFSHUmtP7hzYYl6bfPG73MoezgKAy5M=
=7KqA
-----END PGP SIGNATURE-----

--aB+2iWZCVGDGbVS2--

