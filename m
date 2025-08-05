Return-Path: <ksummit+bounces-2041-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACE0B1B7FE
	for <lists@lfdr.de>; Tue,  5 Aug 2025 18:09:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C36618A6EC2
	for <lists@lfdr.de>; Tue,  5 Aug 2025 16:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7533291C10;
	Tue,  5 Aug 2025 16:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jCIi4nyT"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E91329188C
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 16:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754410128; cv=none; b=tM5GHh09A6FuSpjqxewg/fX+7Qczo2YBRkuF3Bo1i83HPmeIb9YE16ieUThZv/oVb3YNFHp3lUq4l2QMCa0fm8ctGvxUQnETz/UBgYDgS6fYi1ocS56u2YX8BEvnHC6CbN1F+y61MpCFm94043hJlp2lErT/UcjouwTjM48pYDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754410128; c=relaxed/simple;
	bh=N3CPiiz32ewNBIzOfJDLFxqIYYR5+iOKcIgcrYjUryg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OR4swt1fR+wbcGK49qAcEX3pYiVw1h7b+Pl2bRO+w0D8wv12njaDn0IO4RP7lRN4K4hD0PkaSrioYYuYcmfWI8bHsC0KXKV8dzZOgZy7yXezoTcdT5an6OEpfpHe7PINlBOiksTR4OZIDuc2W7Ni2327ny4iMka85yhPX821Jjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jCIi4nyT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6664FC4CEF0;
	Tue,  5 Aug 2025 16:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754410128;
	bh=N3CPiiz32ewNBIzOfJDLFxqIYYR5+iOKcIgcrYjUryg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jCIi4nyTFK6nTujoka4iF/kM2oeBqlkZaWltVfBQibvBOkXRtN3gYqaStGV6v1hm4
	 KpewPISdvTWzQYVMgfzb+1Qvx7M0qFmyCxXkYXjobz1i4ROlWcO4nC0AOFswb42jDu
	 JlUf3E9sjfoD4MnhJ33kcQ0GiV/fPfrNWuIeSW0gMkNpE8hekHcmEBOaBV3CmMHdnp
	 EXMcVaEoIoHVFQR7TKOmW7tmYqbTHdwmk14n06st1WhJJnH6YsX8Aqc2ZUCVjRdHoc
	 aKpkMxBmYpo/2BUJEHH9HsgJaTO+dSvEGPXbWXdJlVaIq5XLJT6cMTsmvybNPyaX+0
	 iOJu0wa1Kr/ug==
Date: Tue, 5 Aug 2025 17:08:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiri Kosina <jkosina@suse.com>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The amount of -stable emails
Message-ID: <9dbe8a42-e43a-4beb-acfa-3ed1c069fa47@sirena.org.uk>
References: <162r47q9-rp56-67so-7032-2r1rn36p03n6@fhfr.pbz>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7mdgAxbV6SYKbKel"
Content-Disposition: inline
In-Reply-To: <162r47q9-rp56-67so-7032-2r1rn36p03n6@fhfr.pbz>
X-Cookie: Trap full -- please empty.


--7mdgAxbV6SYKbKel
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 05, 2025 at 05:38:55PM +0200, Jiri Kosina wrote:

> This proposal is coming as a followup to the brief IRC discussion that=20
> happened a few months back.

> The amount of e-mails that are coming (with maintainers directly CCed) as=
=20
> a result of patches being merged to -stable is so overwhelming that I am=
=20
> not sure that people are making any productive use of it whatsoever.

> I am personally pretty much ignoring most of it, as (a) I wouldn't have=
=20
> time to do anything else otherwise (b) I don't have a sufficient=20
> motivation / time to invest effort into stable in the fist place.

> I feel it'd be beneficial to discuss this, and (depending on the outcome)=
=20
> perhaps make it opt-in (or opt-out) at least, with people/subsystems=20
> having means how to be excluded from all that ... ?

One thing I'd really like to see there would be to avoid sending each
patch separately for every stable version, that just blows up the mail
volume hugely especially for those of us with subsystems that carry a
lot of quirks.  I'm sure the range of versions something is being pulled
back to could be expressed in a single mail instead, it's always some
range of versions being processed en masse rather than just a single
version.  The per version cover letter is more useful for replying with
test results but that doesn't need the whole series.

--7mdgAxbV6SYKbKel
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiSLIsACgkQJNaLcl1U
h9BJOwf9GbiSS532X9UpsMO5LIv2qt5llZ4+J01VrNHZ+ajIICSbIxJ6cTAnndGy
VO07i2/wbwowQ+gkk6ugo7PDoryEBXHsvxWmCoKAxF7FG7q0TmJ49QDFakPzQIRh
U/3t0AG6e4nONizTTZDKJJyqmzJ+8kDRq9X7I27yF1Kqk+eqOHmE8UGxFR0tV0UC
Gik5iTn0W7uVM2/1lYej/5L6q4eMG8bzx7MjgfALskuqa6Es0OiIhfrOW+kdH7Kp
J91z66pHRbUT9ZzOg6gXZ5M8VDI5aSnKLjZ9/h0SDsNXmYhDZ983jqO3o53f1b+g
fUno5LpXfFrr/x18uZXlgRLkdwvdYg==
=xqdd
-----END PGP SIGNATURE-----

--7mdgAxbV6SYKbKel--

