Return-Path: <ksummit+bounces-2553-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FA7BE37AF
	for <lists@lfdr.de>; Thu, 16 Oct 2025 14:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8923F19C60D7
	for <lists@lfdr.de>; Thu, 16 Oct 2025 12:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D461232F77E;
	Thu, 16 Oct 2025 12:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k8lesNyN"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC3C2E0B68
	for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 12:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760618964; cv=none; b=qJZqmMv2x5APyUt1/9RliwAuuoJ/KiOVKEntRrXhYbXT7kbxw//EtOLLQzCkkNMdUnrAfZhVKYSAlksKH2HEjFKOeVg0ppvgHGPtujeI64nT8rLng5z2nU7hZowBBUyOloTEPm4b9cSqNIGLG4p9HhHVuJHt7jQgBXw7glj4/j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760618964; c=relaxed/simple;
	bh=J9imasuIydEkH6xkbVTMMtqgRLKIUvkgYeNNYYfSIpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HrgpDDQrdd2KM2MBPx6wv0DWPNtbuwlDOdo2Gk1ZJr4BM05LnZZ61FH7NRy3dfz9gZmujlOHmUgtHvmj/DtTCIk86BsLOOdDU01mjHkr+/7UTPhJrOaxXO3cCj/zuSZAT8pcHLWhfPZzCfuVYzD+VuewTfU4thXW/AlUt3F+uVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k8lesNyN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC80C4CEF1;
	Thu, 16 Oct 2025 12:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760618964;
	bh=J9imasuIydEkH6xkbVTMMtqgRLKIUvkgYeNNYYfSIpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k8lesNyNEPE7njbtHzw1Gy4lIkcuoLwuHxVnP0Qyp6Fop+MQDN03asl/yJCHU/X3x
	 XYCiyIDDs19ILmy5URdJAaYSqWt0AnzVeoHqXpeQ5q+ANX9VJLJMoEU7Ih9LLHyLHS
	 YZE+ncPW9xMMou1QW1LWtho6v8s95UDOqtOhyS0GID7QsQ027VajjLTLqhdJIucOyi
	 s0q4Pf8gmzbO8NjqIgWza2uLDIH6kDwEPjutI4TuEtjEodC0Upb7DFdDoOrQZrqDsK
	 KsCCGEK2UUMxRgfwK5Za3o12eaDvufqrVaAW8vHv0pGsC+/vjEWqHiFHOhGgAWnvMo
	 QR4bP1Y9ToN1g==
Date: Thu, 16 Oct 2025 13:49:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	dan.j.williams@intel.com, Doug Anderson <dianders@chromium.org>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: Replacing Link trailers
Message-ID: <41b142a6-9a15-4011-b483-e0bc11928305@sirena.org.uk>
References: <68ee73dcd10ee_2f89910075@dwillia2-mobl4.notmuch>
 <2025101448-overtake-mortality-99c8@gregkh>
 <68efd54da845e_2f89910071@dwillia2-mobl4.notmuch>
 <20251015-versed-active-silkworm-bb87bd@lemur>
 <CAHk-=wiLMH5QBF+veebJgdh=e=Q5uz7AEF0sfWPRhSAXvg8ASg@mail.gmail.com>
 <CAHk-=whCgsMuZ8heJ6ma3hCM_reG9+VYWfXorC=14n59TWg22g@mail.gmail.com>
 <2025101631-foyer-wages-8458@gregkh>
 <892a58917795bf5d29394bb5123dae2a6615ca08.camel@HansenPartnership.com>
 <2025101639-thwarting-press-f0f7@gregkh>
 <1de36a0c-a197-441d-82eb-29f96581a8b2@efficios.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6PNpOxVswbauoRXH"
Content-Disposition: inline
In-Reply-To: <1de36a0c-a197-441d-82eb-29f96581a8b2@efficios.com>
X-Cookie: Whoever dies with the most toys wins.


--6PNpOxVswbauoRXH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 16, 2025 at 08:34:59AM -0400, Mathieu Desnoyers wrote:

> The "Link:" tag is unfortunately a bag of holding for all sorts of
> links. So if Linus interprets the "Link:" tag as a link to relevant
> URLs with an implied meaning "see also" or "more relevant info
> here", then whatever else gets added under "Link:" with a different
> purpose is seen as noise.

> One possible solution would be to introduce a new tag such as
> "Link-Origin: https://..." or just "Origin: https://..." or
> whatever better name we can collectively come up with.

> That way the semantic should be obvious to everyone.

As mentioned in other threads the goal with using patch.msgid.link as
the domain for the simple list archive links was basically that, to
provide an easy way to identify through simple inspection that this is
just a link to the original patch.  It does have the advantage of
already being fairly widely deployed.

--6PNpOxVswbauoRXH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjw6c8ACgkQJNaLcl1U
h9BtGgf/dnzyvf6Kua/B33mSKzAk1IsHbEzYIPFiNJkYkgnSm24WdJnn92t86tsA
wwUz3J3A3KDcLLnMwS5nMHLBfsjSb8YxEqCagzD+ukm8hMpcWrqsLRMrLSh4pIJC
3o4Nsfm89mtnWdf7YWOtVIGBbXuOj9GCoA24fB1vGIpHeJ0o47jKugf8MwVjswJY
GanKVFYS3S57NCLLTJW9dfWKro45//ahAbYJeK1v4C6UYy8MeRnAwnWbTconeHyF
gbODdp+cBbXzIzRBjrDK+xJZDRGEJD+1ZslYLHwPpfL5MA27KFmdkaz/8rn320cj
sVoqbgX5rzW2+0Mtbj2Om0x67yAqNw==
=HEq4
-----END PGP SIGNATURE-----

--6PNpOxVswbauoRXH--

