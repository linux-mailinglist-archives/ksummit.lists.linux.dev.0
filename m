Return-Path: <ksummit+bounces-2337-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B59BB531B6
	for <lists@lfdr.de>; Thu, 11 Sep 2025 14:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C55D8A0201D
	for <lists@lfdr.de>; Thu, 11 Sep 2025 12:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0C263128D4;
	Thu, 11 Sep 2025 12:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QuCV+SN/"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C221A2387
	for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 12:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757592340; cv=none; b=ts6sfdCx1r4V7tSKsZx5SY5njQ3/tDQqaaljcSqCb47TQ8zPKdBZKth2FpNob0PnEW0301UBL821VcrjFRWDjBmTvVijNBVbAi76PdvncozapfzAP5U0U26J+x5EZb60kWUaQQrEO36SZM/6vk5NL3DoRyNWGw0n+L60V0goIhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757592340; c=relaxed/simple;
	bh=nihS1JSutMtOxyXvGDxP3taLG0TKFQ2R0FJDCahEX/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WpaGBrylRyDkUWnyE8t2XyFyiNBfn+GMLF+ve8XNnKg4L4mHpktdp3D1spogUMeUIWcWRsDs/RMqGhMiAmDrmxyCXpKJLN/Gfa+cC0Gw/dAkkxjTthaDRPBoy0lUcsWckaLX6hQpjS6juzAb+RTNDYZBrl1Ua+4HR587ZMaM8B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QuCV+SN/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AEB9C4CEF0;
	Thu, 11 Sep 2025 12:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757592340;
	bh=nihS1JSutMtOxyXvGDxP3taLG0TKFQ2R0FJDCahEX/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QuCV+SN/DD9Va2kg65DIF8w317GPfMJi+DoymKrV8yesuLFrfztcOzyVef2TmlS0v
	 4Vp7aB99rCP9VjElJiCH/tPIWt7NiMMvsb6M5sSj5eMNVkuDeS4dNXpGpCMI/ahYla
	 WoxEtob0eTu9S52OxieLVRNi2gcnEukUzCYVqTPVjMcWBMBBtszjkfZ2+5lClnFYb6
	 xbCzvwqE8g08TZTkMRE3BOtpXrJRO1xnxG373H1x/lIegWemCTIAOleZg0Hr+sG6Nt
	 0jbFHF/w+bhUXQTuOH2zlv5JoSVQvSZ8hZxTcG1J2EUicAgSnp22Wu2hs2sI5fNeck
	 VxxtJDMNQlBSQ==
Date: Thu, 11 Sep 2025 13:05:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Hidden commits from next (aka why
 maintainers hoard them in backpack)
Message-ID: <14357de0-ca64-4605-87d3-64d3015d973e@sirena.org.uk>
References: <299e6601-a83e-4e5d-9dd9-12ae796cd913@kernel.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v4W00nyOW6/A32ou"
Content-Disposition: inline
In-Reply-To: <299e6601-a83e-4e5d-9dd9-12ae796cd913@kernel.org>
X-Cookie: Your domestic life may be harmonious.


--v4W00nyOW6/A32ou
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 01:04:19PM +0200, Krzysztof Kozlowski wrote:

> I don=E2=80=99t see a good reason to keep valid, proper patches - collect=
ed by
> trusted sub-maintainers and intended for upstream submission - out of
> linux-next. If a sub-maintainer is trusted in collecting patches and
> sending them to the upstream maintainer, these commits should be visible
> in the linux-next.

> I have occasionally asked sub-maintainers to add their trees to the
> linux-next, and sometimes this worked. In other cases it could not work
> for various reasons, e.g. workflow of the upstream maintainer or
> reluctance to share commits early. These reasons are what I would like
> to discuss and, hopefully, improve.

Yes, this is especially frustrating when it's fixes trees and you end up
with breakage in -next for a week or whatever while you wait for a fix
to make it's way to the upstream maintainer's tree.  If that's something
like a boot or build break it can obscure a bunch of other testing, not
just the issue itself, which is even less helpful.  Where this is a
problem I really don't understand the reasoning of the relevant
maintainers.

Mostly people are totally happy to put their trees in -next and either
forgot or simply weren't aware they could do it.

> Identifying the patches
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> There are two cases here for patches committed by sub-maintainers, but
> never fed to next:
> 1. The upstream maintainer took them via pull request.
> 2. The upstream maintainer rebased everything - changing commit date (to
> add their own Signed-off-by? otherwise why would you rebase a pull
> request from someone you trust?).

There is the case where people send things to the list as a patch series
with a pull request in the cover letter, the stuff in the pull request
hasn't actually been reviewed yet.  Not sure how common that is, I have
discussed a workflow like that with some of the people who send to me
but I'm not actually doing it myself.  None of the cases you found
immediately look like that.

You might also catch cases where there was a pre-next test phase, that
lasting two weeks should be very unusual though.

--v4W00nyOW6/A32ou
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjCuw8ACgkQJNaLcl1U
h9AqBgf+JVt+sRZnuiUvvwUU57Pg8bCvmS8hZbhdCynjQ31gRZimXBIyrfQitwIr
V049Sd4sF+6Zfti42WnqHdNvrPuOgI6ewXu2TT13dzC2PwgnlZyNObMUvDTA0zvp
ptrON1bry3OTZ1AkPJk8DdMR+tPq9jYw0Vuv713hT68PGBQCEYGm3rTDt9TSOX3D
9rBTouOu4j03sc6OwW6TtmAg58MXOEEWwOw6qKQIAs2x0moWjmpXhxGxkU8VL4md
9ho6PgcBESv2RweNC9kjz3o6Dbm28nxDL36AQlsW7T8x+CTLxMEvh3miADTEDL23
g9fzGe0GiJaWBZ6Ktj7bV9eQPDUFLA==
=dfXs
-----END PGP SIGNATURE-----

--v4W00nyOW6/A32ou--

