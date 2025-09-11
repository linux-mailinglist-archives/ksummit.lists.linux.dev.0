Return-Path: <ksummit+bounces-2353-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EE7B53415
	for <lists@lfdr.de>; Thu, 11 Sep 2025 15:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9CD93BF861
	for <lists@lfdr.de>; Thu, 11 Sep 2025 13:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85C6341655;
	Thu, 11 Sep 2025 13:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMdGz5G+"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB70341649
	for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 13:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757598049; cv=none; b=nH8iAFK5beWy9N8X3LfLW1Fp3viotIoZVqGGOIo2jg5BBJPtjfg6PGp5qBJe5q4hgvmFzPBryTSCCPbuuvCRnb9hQIDbNETokHVKI9XjEHG/N12zkUS1ACIgkhhmdHkpkhVK/cs5McSUMbPzuVG6QOIZIB7xa1LH3TAuA2qfhHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757598049; c=relaxed/simple;
	bh=6bk4x8239VTh1K7S07rKZ8U7MJcsaxDgMTChzEuwg+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYRK1R77lDCY7e2q9yELfuCxglXMUa+Bc6Z7f7/RkJnAy913Gh3l/dHgi/OFoloLLgC1gz6F+8toGeoSDpfA7Kj59drbGWlNdZPXNe1njfRf4WJXxtUE9vuctT9tF31JJzErOmqBvuB9g/KThEEMyQr8oCOxNvgYCZ/SU0bmps8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMdGz5G+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F13C4CEF0;
	Thu, 11 Sep 2025 13:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757598049;
	bh=6bk4x8239VTh1K7S07rKZ8U7MJcsaxDgMTChzEuwg+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GMdGz5G+ZkThqKYifSqkVmABZippGjg3/aij6MgygL+ndRm0p9UkawQNAQY+2/l0+
	 CnOPCn94XXJZ7czJYTv/3gRhvwysJu1ByyYW9X6WU4zE31wKtDps8gjEtfx66i5d0T
	 AyCuIsenbv+JHhZQbx+nO3onJmWKbMOUjznRLCOap1RpK30XNpG91crrAE72PPOTiw
	 rXFvT3W8AljPwvtM3OiAUy8QnNRJPMrsDJ9xb0I1IVKeYJuyX2V4CsFnEUFQjaiysp
	 2KQR52R01DvUtUDKtqa1wRtBEAmsF83SG/SEsVZO+yXO9Gwn0Ha31+L+X+sl+ccYNd
	 KLuGvHRNp6Q4w==
Date: Thu, 11 Sep 2025 14:40:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Hidden commits from next (aka why
 maintainers hoard them in backpack)
Message-ID: <e7a60ee9-77fe-4729-a58d-441543792de7@sirena.org.uk>
References: <299e6601-a83e-4e5d-9dd9-12ae796cd913@kernel.org>
 <20250911122711.GC8177@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4GWKxE+KCXnsYrHE"
Content-Disposition: inline
In-Reply-To: <20250911122711.GC8177@pendragon.ideasonboard.com>
X-Cookie: Your domestic life may be harmonious.


--4GWKxE+KCXnsYrHE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 03:27:11PM +0300, Laurent Pinchart wrote:
> On Thu, Sep 11, 2025 at 01:04:19PM +0200, Krzysztof Kozlowski wrote:

> > There are two cases here for patches committed by sub-maintainers, but
> > never fed to next:
> > 1. The upstream maintainer took them via pull request.
> > 2. The upstream maintainer rebased everything - changing commit date (to
> > add their own Signed-off-by? otherwise why would you rebase a pull
> > request from someone you trust?).

> I've heard a maintainer saying that Linus doesn't like subsystem trees
> to have lots of merges. Any help debunking that would be appreciated.

AIUI it's a quality of merges issue rather than a number of merges
issue, if the merge commits all have commit messages that convey useful
information about something that makes sense then you should be fine.
If the merge commits are all just default messages not so much.  Things
like taking a pull request with a descriptive commit like the cover
letter for the merge hopefully do have some purpose and a useful commit
message. =20

The quantity thing comes up because a common way you end up with a lot
of merges is automation which tends to also imply lacking changelogs and
motivation.

--4GWKxE+KCXnsYrHE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjC0VwACgkQJNaLcl1U
h9CfEQf+MWNRSe1Qin0Phnm6AuUyLBMZ0bcN91/yA6TFzskkIjbysMJUpxIkV/in
/lyuNnjnQQJa0jvlKYM+h4zvhOd02PzfxrafXAXGePdVnWWuDiZdUsYRPbJYomiK
le1UoQF0dXmglxFB1X67LyHpsRaUrfxILrWhbUrJNuRvhHArSr+7+yJfx4tPOeqw
R6ZQy0mO/aXUD+CINWa+rOQSyiyFYaFPyg4OnFBGAOKSJOjl+zQVc45wCCSOSCch
iqQ5VRrn4iecxTqo6w6dpVmGd2gTF9czg9vSqeI/CZqp8JA7WjzDMMRQzZIOC3Ys
3gi+nnYOkPByX6QbNm7Y/8YTtTj+3A==
=N3gg
-----END PGP SIGNATURE-----

--4GWKxE+KCXnsYrHE--

