Return-Path: <ksummit+bounces-2537-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAB1BE0D4B
	for <lists@lfdr.de>; Wed, 15 Oct 2025 23:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 847C44E9BA1
	for <lists@lfdr.de>; Wed, 15 Oct 2025 21:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7951A2FFDF2;
	Wed, 15 Oct 2025 21:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u4y1J9BO"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01242D3220
	for <ksummit@lists.linux.dev>; Wed, 15 Oct 2025 21:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760564425; cv=none; b=jq0dCS23ilDfBObVrt3cwhmEWWJt+0tESSGly4OaUwW5Q3fyHKgnaGqm/hBXWKh0su54twTxdknFMYohSzuLn0er6sKYdVrojd2QVio++pnUd3yeahfGB7TGXVxHxwRNqjh2e1mqjFrz71XssGoKNJC2b3dGtyHRte/7KLUKv+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760564425; c=relaxed/simple;
	bh=+vlv/7Q6O7jcv9EgQATGKpnNahPgU9YJu5guDWOd9LM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=spiKDQQzPA81f2kpBUYlF65vz8X+CuV3ZFESB0FM3oCHOumm8ahLjaOBXpNrfV2GEQ/M+BlZhHwgXRhecmD89DBeqmZcyatdhgO/Pfj1F0Ck/dUbMsj6X9rhUME18/4NBbKoxvw2uCOl2kT/6iVgeNJS6b6X33ddtbii8Ha0gqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u4y1J9BO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9381C4CEF8;
	Wed, 15 Oct 2025 21:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760564424;
	bh=+vlv/7Q6O7jcv9EgQATGKpnNahPgU9YJu5guDWOd9LM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u4y1J9BOlMHe9E9w+UeTChIXDqK3sMlVMKegLb2wUetosRPMkvSjC5zlGrwICPP+7
	 +/qrUR/MKEWyKiqNRDz5vxbAewPDXTZ9hNEy3FYUZ1N2VCglI7DFiXaK2kcbyVpK+i
	 wA2NAcFzJU/Nbi32SVax2h0gEUMs+w0SJokZPHtuVnHEcsZxp4tc8bskO6qLubkVTf
	 TZNeo6WKFIIwZrnaYkFvGMLNDz1haakS/Fu04BksaPh11CV+Z2wxOSQ3l4jI+4hq+d
	 3KzW1AUnMDGyHXi0Lpfg91QtVIYNGgwgxteGkS/K/y223GhRRB+bApGERyTNZRtcgM
	 SlxPsKPW+cguA==
Date: Wed, 15 Oct 2025 22:40:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	dan.j.williams@intel.com, Greg KH <gregkh@linuxfoundation.org>,
	Doug Anderson <dianders@chromium.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: Replacing Link trailers
Message-ID: <aed7a9d7-640c-4c79-84bf-77113dac0043@sirena.org.uk>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
 <68ee73dcd10ee_2f89910075@dwillia2-mobl4.notmuch>
 <2025101448-overtake-mortality-99c8@gregkh>
 <68efd54da845e_2f89910071@dwillia2-mobl4.notmuch>
 <20251015-versed-active-silkworm-bb87bd@lemur>
 <CAHk-=wiLMH5QBF+veebJgdh=e=Q5uz7AEF0sfWPRhSAXvg8ASg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dAncuYLcXXYc/Z/I"
Content-Disposition: inline
In-Reply-To: <CAHk-=wiLMH5QBF+veebJgdh=e=Q5uz7AEF0sfWPRhSAXvg8ASg@mail.gmail.com>
X-Cookie: Long life is in store for you.


--dAncuYLcXXYc/Z/I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 12:15:09PM -0700, Linus Torvalds wrote:

> And if people who have real workflows that use Link tags actually were
> to add them consciously, I wouldn't hate them so much.

Where people are adding the tags as a matter of routine it's commonly
because others find it useful to have them rather than for their own
direct benefit, the workflow is someone else's.  People come along later
and want to follow the trail back from git to the mailing list - for
example my main use case is that I've got a bisected test failure and
want to tell someone who might care about it while also checking to see
if the issue has already been reported.  Sure, dig will work for that
most of the time but it's heuristic based and it's something people have
to install. =20

I happen to already have tip of tree b4 to hand anyway for other reasons
so it's a relatively small speedbump for me personally but it's hard to
get enthusiastic about.


--dAncuYLcXXYc/Z/I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjwFMMACgkQJNaLcl1U
h9DgZAf7Bxt6oUw7Jn6WPFrZ9/4S3zdc+0XyRTcr15Gw0B/ZVSeFbvfO2RtVwqu0
gnasbxj7uBcNiOBftSprG9ZYHW7zbScy6qdwkgI82aLY54R44+ZXZeleWALwbSvp
bX9eD2ytZe5bXtJoZyIRG/UIIKnvTsOj1oE6E6ON6d2xxLxKAtByFtHbBX+/53Ba
TmXFmv0/TbGVUDpXV0EpaqYOjscsPCa82WhG5PWPfL2H2+LBDjrH9kdWUjFADqmu
LKa5uDW0rJTW5mpfK/6RHvGTepFJsiO0CTs2mlumscynCeVwzJ/V5fM7I1Z0Hgtf
N0C8gkYrYfUC6d73qh2/Ieyi83N6eA==
=P7Tn
-----END PGP SIGNATURE-----

--dAncuYLcXXYc/Z/I--

