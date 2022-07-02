Return-Path: <ksummit+bounces-741-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [IPv6:2604:1380:4040:4f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 686B0564019
	for <lists@lfdr.de>; Sat,  2 Jul 2022 14:43:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id CC9612E0C35
	for <lists@lfdr.de>; Sat,  2 Jul 2022 12:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815593C1E;
	Sat,  2 Jul 2022 12:43:47 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32851874
	for <ksummit@lists.linux.dev>; Sat,  2 Jul 2022 12:43:44 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LZsF11Ncvz4xTv;
	Sat,  2 Jul 2022 22:43:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1656765816;
	bh=WQ4WnFe5JFzVDW5GCPNDMOgfd3OoKMdauo5DWyskyzo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aR7Oilwh9xA0f/GqXOYT9MTaup8HUqXWRKF4UYGo7hVP5GqAcDjnc45ZE7ChcMZuP
	 ewts/5Kl3IticcIVH7RszlD3+W9xgpgjy5+mjKO+B37Yd+F9nlxafBUrDL2RbmajHi
	 eHhZFl4kxZWaMCdWyXtxnTooFMF81e3uBTnADpFJjRqsScbNRPC5QIqm7QNyhq38rp
	 uRlPhnIIjBwqmjG5f7RX5zR59F1iJUYrij5GU5nZGkjtxaXO04jb09O47JYTdOHNbJ
	 NFU6vn5Ry9LXNNADLTzQFpe2xPrKEjMrOdLjW9blr0uZu0zJIHj54Lj5XYr+W5YvXS
	 UfRkTL0Cge/pA==
Date: Sat, 2 Jul 2022 22:43:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Jonathan Corbet
 <corbet@lwn.net>, Markus Heiser <markus.heiser@darmarit.de>, Jani Nikula
 <jani.nikula@intel.com>, ksummit
 <ksummit-discuss@lists.linuxfoundation.org>, ksummit@lists.linux.dev
Subject: Re: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could
 be
Message-ID: <20220702224331.61607204@canb.auug.org.au>
In-Reply-To: <20220628120142.4fe254f7@sal.lan>
References: <87sfo3nh3t.fsf@meer.lwn.net>
	<20220618092447.5ebed314@sal.lan>
	<875ykrrb45.fsf@intel.com>
	<20220623105747.079ac92b@sal.lan>
	<87a6a38plu.fsf@meer.lwn.net>
	<20220624083307.159824bd@sal.lan>
	<963dd061-47ba-6f96-72e2-4f34cc952b8c@darmarit.de>
	<87fsjqyvlx.fsf@meer.lwn.net>
	<20220628084317.2f033ad5@sal.lan>
	<CAMuHMdW_EkQ8pSgJjrZtBXXkitRv2Wq+fP4wCnPmyvaPQO-kxA@mail.gmail.com>
	<20220628120142.4fe254f7@sal.lan>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1.lznEAmRRGeXWHzjraTC6S";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1.lznEAmRRGeXWHzjraTC6S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

On Tue, 28 Jun 2022 12:01:42 +0100 Mauro Carvalho Chehab <mchehab@kernel.or=
g> wrote:
>
> With RHEL9, SUSE 15 SP4 (plus CenOS and openSUSE Leap versions of them),
> plus Ubuntu 22.04, maybe we can change the default to recommend installing
> it via distro-provided packages. Yet, Debian bulseye has 2.5.0. Only
> bookworm, scheduled for mid 2023, will come with Sphinx > 2.

Debian current Stable (Bullseye) has python3-sphinx version 3.4.3
(python-sphinx is version 1.8.4).

--=20
Cheers,
Stephen Rothwell

--Sig_/1.lznEAmRRGeXWHzjraTC6S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmLAPXMACgkQAVBC80lX
0GwPBQf/asIzVF0oIZLduuSR2SvFSiMLJzN6OhtLdCppw9JOlAkzWqbEjJpJNJfb
dg/l2bXjioJmNCPFNSyyVeRVDcwnBTY2sc/n0JZ6ODPI3J+1uAW3Bw5Y2awECVsB
lkPR+TiyfwkDWDLMfHwDIaCHry0O2gRtk5xlqi87hFYvYp5A2gOG2opRrN33j7uF
LD4wzb/H2ohxMPqyaJo2mlYf6VGDyo/PkCwHPWHqlcOf7Q87+RQBixHqcoIGdfLh
mXvchIDBBWAPUAPrwFKwgaGCV+X2A/hU1+EVKidzm+2VbiRc6EfNpzNN6spRof3x
gocYgdR+Ko1tObusNV7GVM16Dkjvdw==
=WbhG
-----END PGP SIGNATURE-----

--Sig_/1.lznEAmRRGeXWHzjraTC6S--

