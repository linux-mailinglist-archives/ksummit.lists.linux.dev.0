Return-Path: <ksummit+bounces-1273-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC4F908DB5
	for <lists@lfdr.de>; Fri, 14 Jun 2024 16:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C568828951A
	for <lists@lfdr.de>; Fri, 14 Jun 2024 14:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA6510A12;
	Fri, 14 Jun 2024 14:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mx5rEU5G"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B5AFC08
	for <ksummit@lists.linux.dev>; Fri, 14 Jun 2024 14:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718376209; cv=none; b=CrBv9aMOpupKnfaCUx7vcEpLfJdrNhHJ97lJTx8GZEwMASrZirw9aEuFGwnqLKiprXZeGaUyXiY5X269JYt3knHYIQhCWCAXBPnthDryF+VKHv/2x81VUuV64ZbgkG1dBf2VFBkbP8SeNVJBuOETeQqYm5+F8Bm84TthQIS5n8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718376209; c=relaxed/simple;
	bh=3NzEdYn4QHYlt1iS9yKMR+AK/ZDI1JMJaqrojsKbbvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sXqQwWl78h2DtbAH/Gl2HZXvKefMMYtftAtcoDf//xoOZ3a2CGI9VBzjXwi9yVMevuSMnJlxMNU8pzo5nAumVudcFc0lxHcjtSP0Su9Dtiz45Ggh2gI+JLC3bE2RmrOw4kUznRLbXK8YaQ1yrUWQ4zOQ8HxAJ8oahR+cRg5Qjis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mx5rEU5G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BAEEC2BD10;
	Fri, 14 Jun 2024 14:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718376209;
	bh=3NzEdYn4QHYlt1iS9yKMR+AK/ZDI1JMJaqrojsKbbvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mx5rEU5GStVr6ojJeuZ/bsraKAhSaV1OA0PBcLEVweDJT3zgRpTazJfBEfXHaaxn1
	 xiR1QEQ7sTcc8yhLKBinOiIEs225oc0u79juPLlPr2oeinEfoyFqGLRnWQPGKl861B
	 NFg9F2FWLI41BJRwS9oy21GpBRNfuTubhhP+caMOc58FFYvwjlT5R6OhP16dWf8MnM
	 JN+qTNH0nuUCrRN8mN7wEQE75V8KS1YHa08Iboc8W1+S4ZQrGtfiU9kzsAXvPW8Y7u
	 UhU4NbnFqup0CDi/3/ffSVO9hVvdIPk1o9YogtU1rmK41N4ue9uJl5OGJHxFYhU7HH
	 9uHcy2HmqRspw==
Date: Fri, 14 Jun 2024 15:43:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jan Kara <jack@suse.cz>, Thorsten Leemhuis <linux@leemhuis.info>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <ZmxXBi1-QeN5ivAe@finisterre.sirena.org.uk>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <20240613095917.eeplayyfvl6un56y@quack3>
 <20240613-rustling-chirpy-skua-d7e6cb@meerkat>
 <87plsjoax6.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZR7VRnqLt0JwihWh"
Content-Disposition: inline
In-Reply-To: <87plsjoax6.fsf@mail.lhotse>
X-Cookie: Your love life will be... interesting.


--ZR7VRnqLt0JwihWh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 15, 2024 at 12:29:09AM +1000, Michael Ellerman wrote:
> Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:

> > I suggest we move away from the practice of using Link: trailers to indicate
> > the patch provenance to using Message-Id: trailers for the same purpose. This
> > solves multiple problems:

> > 1. disambiguates Link: trailers so they point to relevant online discussions
> > 2. allows tooling like b4, patchwork, etc, to reliably match commits to
> >    submissions for the purposes of better code review automation
> > 3. allows stable and similar projects to better track series grouping for
> >    commits

> Message-Id: sucks, I want a link I can open with a single click.

> At your suggestion I switched to using https://msgid.link/ as the target
> for patch links, eg:

>   Link: https://msgid.link/20240529123029.146953-2-mpe@ellerman.id.au

> Which gives the reader a hint that the link is just to the submission.

> I don't really care if the tag is "Link:", but it has to be a URL, not
> just a bare message-id that I have to cut and paste like it's the stone
> age.

Actually now that you mention it some terminals (GNOME I think?) have a
feature where they'll identify strings with an @ in them as e-mail
addresses and if you click on one they'll try to fire up some GUI mail
client with a new e-mail addressed to that.  This interacts poorly with
using message IDs a lot.

--ZR7VRnqLt0JwihWh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZsVwUACgkQJNaLcl1U
h9CMFQf/QCbG9aIKQoj6/MTIbNUVz7XTdx2bNFxZVbaDZe45vYCEXS8pdFlHqKCR
yyBOX8LdAayYmWrjQK4bbgHVTiClfpWmSeFOwMg1OxYfk1s+6mOtGU+SsnuBhgqS
9I29eXTd5qwTSqkbfNGMmzQHQuewetWNxDG0WpBF43slT89PLJ6UEvSBQMDi7deA
HHuxOovnoUXxkA9en0oNV/cMWd2rqffX8VOoCfJOSzAO2qPCFjdPFAK89Ddowrb/
Z4WFB5W2XMjuu46OjdJolqrj+v/f7kKBlGVm6WC8yzuzrHV9yQ3eSOOc081xAewI
rRXyRUssnt6AZuLabomKqX9oLu0ybQ==
=Jjz1
-----END PGP SIGNATURE-----

--ZR7VRnqLt0JwihWh--

