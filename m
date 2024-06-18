Return-Path: <ksummit+bounces-1317-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 923C090D7D6
	for <lists@lfdr.de>; Tue, 18 Jun 2024 17:53:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 266EB28676C
	for <lists@lfdr.de>; Tue, 18 Jun 2024 15:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A147045BF1;
	Tue, 18 Jun 2024 15:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nir/k/HM"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B80D4C62B
	for <ksummit@lists.linux.dev>; Tue, 18 Jun 2024 15:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718725837; cv=none; b=tMjdSS8Y2A5ZpGzA/Rl40C1ZWEzVXffgH69I64PcoccWbjeGqkGUKDvh7/BnGAZTyw4QcR79VG/H/77YkT8pZXbhMtOWAkefu3NsnCDSIfo7aB75gXPEG8IIFI/Rd0j+tz0bv04vvRLoqAt6EMQv/iSajrl0OzUm/wD4kbTfIuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718725837; c=relaxed/simple;
	bh=zYIE1ydNittI0rygZVOR4EU3sH2V5YTtHCDF+nMoczM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o1oRdFBNdsSr/xwQAWuJ86/J0ERW/GwfAsTRj/IijetGbHUdI2RvjxZ7c81rwuQfghev8KY9YoSgg4jDhBnZC7aq+zgjDxMYN7HyANe1z1HD962P1UGHyn9n6Vd5CJ1Ut2Evq5MEHHlD6XQXw0sRl0RT7xnJcQ5S01ezyo/1Yho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nir/k/HM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF2C3C4AF1C;
	Tue, 18 Jun 2024 15:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718725836;
	bh=zYIE1ydNittI0rygZVOR4EU3sH2V5YTtHCDF+nMoczM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nir/k/HMVT06Cn5tMGCSctBb3Jb+w/LSMlaKSCCrdeswU3Q5cWGoAdKcsEZzLFQ0x
	 FLFklje8bpt9eMIEECH0RTM1/U0Dyo4q1kDBCOAQaC55tkSfVt84SDEf5db52bFaJw
	 UVeT/Zwzy5lBhnsS/21WOwiUPMm6fISBrDv4oSm91ks9D6AqU6i+f3lbks5zN5gPzL
	 n5xpQIyLSL+pfwnRWynMjwa2NBGoDtmVSf3c83V3VjBbzedZPM96I5T7OeBslStCJR
	 Quf/K02jLRJFdvAkOuohEzlbsxCkREdZ9SsRv3/gE/yDzw7kZqn8ec470NK7p3Xvwk
	 fOdW6l13NnS5A==
Date: Tue, 18 Jun 2024 16:50:26 +0100
From: Mark Brown <broonie@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [0/4] Common scenario for four proposals
 regarding regressions
Message-ID: <a98cfd3c-6ca8-4519-83b0-b431ce2efba2@sirena.org.uk>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <54f26c0959f796c52f04da9e831899f6482686ac.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NrkEmg5rQlOxMh2O"
Content-Disposition: inline
In-Reply-To: <54f26c0959f796c52f04da9e831899f6482686ac.camel@HansenPartnership.com>
X-Cookie: If you can read this, you're too close.


--NrkEmg5rQlOxMh2O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 10:43:49AM -0400, James Bottomley wrote:

> So what should we do about this?  I think the first thing is to
> recognize the important role stable plays in actually finding bugs.=20
> There already is a -rc tree for stable, but it doesn't actually seem to
> be very useful in finding bugs (likely because the pool of testers is
> too small), so perhaps we should discuss whether we could expand this,
> or whether we really accept that non-rc stable is part of our testing
> infrastructure.

The pool of testers is quite small, and the turnarounds for responses
are relatively tight which precludes certain kinds of testing.

> The other thing I think would help is better tooling and advice to help
> reporters find regressions in stable.  What we do a lot upstream is ask
> if they can reproduce it in mainline.  However, not everyone is
> equipped to test out mainline kernels, so we could do with helping them
> bisect it in stable (note this can be time dependent: older stable
> trees more naturally give rise to the question "has this been fixed
> upstream" making mainline testing more of an imperative).

Also questions like "can I get this building and running without
reworking my development infrastructure".

--NrkEmg5rQlOxMh2O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZxrMIACgkQJNaLcl1U
h9Aq/wf9HKn3r+K0qX2grtiLUaitnQuVi95202fMc9ksiPb6GvfFv+4w2BlULDT5
9uVPKIJhCUD5vhLMFILwBo8M7OuYBYYKfKriTnfgBDmm23i/g1SyJzfaKPLcfmYT
vFjrukbI7TmeGCS5VVLlDdSfBWfS5ryTElYsqc71+3NzZi/9HQ3wWpAK99QO5ReZ
0QxaqmVKMi5pkhc7LIo1I+c66F4fkJu5RFporNIiAHm/8M0lnLPGn+kHil5tPmOU
PIPWrCfDVty0+MTpe0oGCN+ASC14xaNlVOCqiE3C1aAi/PX9FZFKGisH8KwWxIZc
9ETXzRninX96DNGP7uKVzSWor7ZqjA==
=fyaq
-----END PGP SIGNATURE-----

--NrkEmg5rQlOxMh2O--

