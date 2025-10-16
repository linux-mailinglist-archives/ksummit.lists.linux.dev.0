Return-Path: <ksummit+bounces-2562-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D2BBE3EE4
	for <lists@lfdr.de>; Thu, 16 Oct 2025 16:36:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26D3018867CF
	for <lists@lfdr.de>; Thu, 16 Oct 2025 14:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1EE433A01B;
	Thu, 16 Oct 2025 14:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lmxVVRWZ"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F231F0991
	for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 14:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760625375; cv=none; b=NZZRLvvrISDbG87Ew1MprySsMjxuSpWeDIXXZ0hOdqZWmN+YoQP/eCyx0thYA+EsO26I+jGeXG8O1q9b8GeeZmm4lkf62U+NcPXnGgI9QpOSo93tePSA5+UgwpG8JUBbch5MUlqd7hA/ZvIKoCFXFmEHRABjs+cl57d5XSnu8kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760625375; c=relaxed/simple;
	bh=nCPaiJspITprischE8qe2vDbvjIpfKhLqZf4GuBTdnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eAGAFIg94+c6EVnU5Lq21x6gx4pURc8sTBandCqCKwS2byh3fd4xR8qH0ZFuKvzIaVL5E6ldCfcXqP5nz9cA2t6Ot6+gx0b+AimCRLBZ4Rbya5alVRQHDLW4HNl9zXU6iz8nvUr8cXjadzawtG/xeNO1BWxDLo1RNATvkRNrHdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lmxVVRWZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA25BC4CEF1;
	Thu, 16 Oct 2025 14:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760625374;
	bh=nCPaiJspITprischE8qe2vDbvjIpfKhLqZf4GuBTdnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lmxVVRWZIbQluUwLBG9oVendQwlr3MbaG4FuxPildFf4+yYeKMiGRVYcMplot+WgH
	 plnyq0sZjwXjYkRqFLYUmxLq6rOl6t1XrTn8TIzEYOwHE6QZ9eVcm5psHXTTqZgI0S
	 PqQx7idHxXG+2FDrkRFMJsFT0x8Nt4JWIfAyAGOCnZkHrDejTNrQN+9JANmFxPN0fe
	 i9KPPMF5sZpLt3ONv3zGnUask9iysGDpAzNstlv8ZF54d2Ji8og9f4O1LXx3aZWojb
	 /Nqzp109DdgbPKANiufNnaIyUQqnemI0xWdDRvrgJjlQea8jz7iWGdYTsQJE8U5NWH
	 /Bl4/13F7B9iA==
Date: Thu, 16 Oct 2025 15:36:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	dan.j.williams@intel.com, Doug Anderson <dianders@chromium.org>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: Replacing Link trailers
Message-ID: <0f5607e8-b0a0-460b-ad38-c9539a6523e8@sirena.org.uk>
References: <2025101448-overtake-mortality-99c8@gregkh>
 <68efd54da845e_2f89910071@dwillia2-mobl4.notmuch>
 <20251015-versed-active-silkworm-bb87bd@lemur>
 <CAHk-=wiLMH5QBF+veebJgdh=e=Q5uz7AEF0sfWPRhSAXvg8ASg@mail.gmail.com>
 <CAHk-=whCgsMuZ8heJ6ma3hCM_reG9+VYWfXorC=14n59TWg22g@mail.gmail.com>
 <2025101631-foyer-wages-8458@gregkh>
 <892a58917795bf5d29394bb5123dae2a6615ca08.camel@HansenPartnership.com>
 <2025101639-thwarting-press-f0f7@gregkh>
 <ef52db7e1d08eb03376fd9343c965aab4dc71ce5.camel@HansenPartnership.com>
 <20251016-vehement-kittiwake-of-joy-d6db8e@lemur>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1uoZhsgq7BBm63hQ"
Content-Disposition: inline
In-Reply-To: <20251016-vehement-kittiwake-of-joy-d6db8e@lemur>
X-Cookie: Whoever dies with the most toys wins.


--1uoZhsgq7BBm63hQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 16, 2025 at 09:00:49AM -0400, Konstantin Ryabitsev wrote:

> I recommend that we all stop beating the Link: trailer topic and sit on our
> hands until the above is either accepted or rejected by the git maintainers.

> IOW:

> - Keep current "mindless" Link: approach, with the patch.msgid.link domain for
>   automatically-added Link: trailers. It mitigates the problem of Linus
>   getting annoyed at the ambiguity, but keeps things working for maintainers
>   who are already dependent on these links being present.

> - Work with git maintainers to add commit provenance information into the
>   commit headers.

> - Reconvene at the upcoming maintainer summit to hammer out whatever remains
>   of the discussion.

> Would that work for everyone?

This seems sensible to me.

I will note that as a Debian stable user I'm expecting to get a new
version of git in roughly 2027, though I imagine there will be backports
available.

--1uoZhsgq7BBm63hQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjxAtYACgkQJNaLcl1U
h9C1sAf/ejMjV+ARjSDEOA/mbZtoX0BTCkHsFguCSZlB5gjopdkBGVPUQ7rR6J89
hAUCmJh7NiPAnFBDXlKcLL46VKn9vthejgEHK4pn5lAjtwf6l2aHRhI7CrVGU68o
wue0nRYJO6XrNCZGLkuSUEeQTa3CNIhcX7J0lFD+uIoQ+xCayGdBhgvSyo0JLgFT
QB7842Q+mUpHf5m2u5pz7Ms6TT0Q3D9B4xIM982cw+IQcrMXVkLaHTXeuIy3sl1T
4mc5bXncOBbO/1lbN4/X6eno6Ou18bjoPB8/m/Lj9pAQIlC4f9IT9AOK4ln6aaIS
7MT+vdka8LaLiyV8yLjLbCMofSk37A==
=Evkw
-----END PGP SIGNATURE-----

--1uoZhsgq7BBm63hQ--

