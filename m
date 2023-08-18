Return-Path: <ksummit+bounces-1017-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEF2780B55
	for <lists@lfdr.de>; Fri, 18 Aug 2023 13:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43DD72823BC
	for <lists@lfdr.de>; Fri, 18 Aug 2023 11:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C01CE182CC;
	Fri, 18 Aug 2023 11:44:05 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A9CA52
	for <ksummit@lists.linux.dev>; Fri, 18 Aug 2023 11:44:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2701C433CA
	for <ksummit@lists.linux.dev>; Fri, 18 Aug 2023 11:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692359043;
	bh=1789hXFrbT6Mgjtme0idsBK7pw2BUQcM/Qre5kQEC8s=;
	h=Date:From:To:Subject:From;
	b=jHvbms0L2iqb++kbee/46FuT/OG4nv2KgGCCq9a5Dt8gL6jcoE14wkdTRnp0rIWOw
	 zpB0UEuGwgDHdfKJx0qZg3GqPG4yGHtuumZybu/X1BVD9YLTr/h2XU6rMUOiczZuM3
	 3X2GzFVr1wckCoxfD2RAryivnEviYP+R1NVGuNHgvkKNMuZqKVCJ2ZbvZc5o0fmKmj
	 +RZVOW4AAhQt4Vt+lacCaRWu/Px3mZkiTR+zxo/oV7o9CoWtztpKaSax7MjACFoFG2
	 12XMFccmguJtcnRxC3phtIgVn7gSSG7nQOaCqSR9NGXGF3koFEfpwALLK4gsVo+QUQ
	 2VWbWU+6aT9Mg==
Date: Fri, 18 Aug 2023 13:43:57 +0200
From: Wolfram Sang <wsa@kernel.org>
To: ksummit@lists.linux.dev
Subject: [MAINTAINERS SUMMIT] Transparency when rejecting patches without
 technical reason
Message-ID: <ZN9ZfUVHrRhd+btc@shikoro>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VCLkVpzNXDUUEazj"
Content-Disposition: inline


--VCLkVpzNXDUUEazj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

this obviously aims at the rejection of networking patches from Baikal
Electronics in March. I only got to know about this yesterday when
reading comments about Debian now supporting the LoongArch architecture.

I admit I thought we accept / reject patches purely because of technical
reasons. If this turns out not to be possible, can we at least agree on
giving detailed reasons then? Like, was it a personal opinion? Was it
because of sanctions? Without reasons as in [1], it makes discussion
harder. And I think we need discussions here to negotiate common
grounds.

With regards,

   Wolfram

[1] https://lwn.net/ml/netdev/20230314103316.313e5f61@kernel.org/


--VCLkVpzNXDUUEazj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTfWXkACgkQFA3kzBSg
KbZu1g/+Lo0STyGYir9yhj2UljdHeUQMLTaRTMitY1SYf9ml+4nuasXRpRvLw3UB
XA4PUUDFQKSYgctuEAU4FS5tyOiBr1Ooh8RljY8JhDqGQ72lD08066d+GfBvGI2H
gHgT07Oo5UD8gD4Li7Yp6F9VwfHcRz+xTdZwfTSCv3ilPd2sfxmDUJvok+KpYqsF
8kMb6jn40AYeUuOo8HviMfu5YXj30QZot1aEyQ0Iy8RYHjiLRQrnXfLBhDU1K0XM
mUm30D4G2Xkn/9fMzizuTRQPnLUsz3RPBwnZP9qNmYOtYcynQDiMdAknHgr3/6in
r5ldLmhfP8LgZVg24vRdMjwd/GkuCDckvVUWCFQCSgFgnd5fS5XyyLsMM9xVfjue
DCm2w3T/FQFHoDytjrscZBpOiEM+S8nuq4XprBiQf8GC894UOuktV1IXXafmZupk
S129M0F41pBneRptsW5n9HTbVBqVCtrdo7oYb2feo7wSaRKTnGZK6g9Gh7vUvfqx
M2OfH4Eh6W5o+iJIhMWu6MZxB5IIuqMXMRaITO6rqY+ZgNvxDQkZYaQo1Ii2ViWY
x/xHlLZSDMPz8RXd9GolMoPiikwmQvBT6IEWv4Gr9asmXOn+xcT32+xjGaZSTZ1Q
ItEYaBYe2aKYczeKRzJVD8ayNEqRjfgRPot8aieHBa5ektmem68=
=IrB6
-----END PGP SIGNATURE-----

--VCLkVpzNXDUUEazj--

