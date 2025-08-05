Return-Path: <ksummit+bounces-2071-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FBAB1BA71
	for <lists@lfdr.de>; Tue,  5 Aug 2025 20:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 329F7623050
	for <lists@lfdr.de>; Tue,  5 Aug 2025 18:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F7F72165E9;
	Tue,  5 Aug 2025 18:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GPrsijlo"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAE927707
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 18:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754419588; cv=none; b=uRCYhGr8wQJPB7w/Q3cXZ7WN0IkHWYD/APZLvoNemmCK54kpESdzStNUnPpEdr2MR9AXpiVhIGDhK6OJLmseUUsrHmxo3d9g/8P3D2b9POhJgCCli7eH8yUTn9CUD8+QnfS3pGjloUBvTtyoysAiqdIbkPcKXAkNFA9UB9gXD+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754419588; c=relaxed/simple;
	bh=awDGASnlk0o/FETfGK+WaDYrP0ZMV95hPdz0D2DIMM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SH+MJJGsYM8hE2A2fz4RhLf+9nU7oKx0uXNmVj1Si4VvQpD8ZeZCw5Urbe+MG1w/eIvhcUchggt48WAVEerTmMlAuTLy+VoSchmQlK7fPxAw2nwsnHyDXq61zqvpz06ENwhMsNu8ZKSnO4KEAjOaAppxZn4TQS7IpbyEfPZ4LQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GPrsijlo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61990C4CEF0;
	Tue,  5 Aug 2025 18:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754419588;
	bh=awDGASnlk0o/FETfGK+WaDYrP0ZMV95hPdz0D2DIMM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GPrsijlo0j5Q7loRA1bOvlZXjDiw2Uy3uLfee3FTekyL7pJFnpe088YVTohBe3FBH
	 4lC+3rYKAllr3BXmYIkGkCLxMjqbLTwfIUFgphZRAhNGEvEj9HCXhkx8hg71eoR0AN
	 tObz62s2HDb20MkiuH7fRy5cz9tqBbYhuQE1KSMyC0tGANsWj6WjUzXcRtNdaHVsbN
	 9nKibZwJQaaYECcv43exM6o0+fhTB8Dv2nYH9vgmHwbhBR4B22cduNhvX8kPF4+aP1
	 lIgN7tB6df+7tOYzFIj8fuGGgqDekvYFBRtsnok7MAEKIaazRoyYDIkELq3CSVYaES
	 +HVAOK9XEbJWg==
Date: Tue, 5 Aug 2025 19:46:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <e2356599-d855-4de7-a52c-7db6a3538fc6@sirena.org.uk>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <56e85d392471beea3322d19bde368920ba6323b6.camel@HansenPartnership.com>
 <ad8ea0a6-ca53-47f8-92ec-17e970184019@sirena.org.uk>
 <1840b821-800e-48cb-a372-012359cf4ae1@lucifer.local>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FiwlssLY1AGRokWa"
Content-Disposition: inline
In-Reply-To: <1840b821-800e-48cb-a372-012359cf4ae1@lucifer.local>
X-Cookie: Trap full -- please empty.


--FiwlssLY1AGRokWa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 05, 2025 at 07:01:01PM +0100, Lorenzo Stoakes wrote:

> However the point is that we can:

> - Generate scenarios relatively quickly that way.
> - Resulatant mistakes are at least _less_ impactful. And you'd hope, would come
>   out in the wash more easily.

> However, I wonder whether it might be better simply to restrict LLMs to test
> data generation or the like.

Yeah, test data seems much safer than test code since it's much more
constrained.  I'm definitely not 100% against trying things with code,
I'm more worried about people throwing something out there without
really looking at it properly since it's just test code.  With the
scenario generation for example the question is always if we'd be
happier with the test program being a scenario generator - sometimes the
answer is no (eg, because it's too expensive to run and you really need
to pick scenarios), sometimes the answer is yes even though the
resulting test program is more involved.

> These are again all exactly the kinds of things that make this an important
> topic to discuss I believe :)

Indeed, and I'm going to guess that it's going to be as much about
establishing taste as firm rules.

--FiwlssLY1AGRokWa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiSUX8ACgkQJNaLcl1U
h9Be0gf/Wa0DfxwGJ2PWCoG1ukLE5lMA+d/2OFMryYBP76Hk/LOeDYmH6MMg3cFY
dYBGkV8yMO9BXXNDX4p/RGl31CUpI/ZNaVc1zkmlMighdd8oAMt7birnDL5HEu0t
0Vng2tO/NbnbD5zHUoxTvY6p6lbqJxjcIgncP/2W5i/XNbWrwiQ+/fBfxZNDS4rt
exzyFbsUad5jaxODvtuDsQsWz4EfMOUoE3OhdaVCI7f4KRIod5345aDBlbI3dhro
BaLeB3ob2V06WcZLRVaWENoftFkHuygrz6Of4IZx7FMPo3/Tnt1Hyp57OTGNO5a/
kwe+N3Nz2UbmR2WRU5g8Mn8HpH7Ugg==
=KcX1
-----END PGP SIGNATURE-----

--FiwlssLY1AGRokWa--

