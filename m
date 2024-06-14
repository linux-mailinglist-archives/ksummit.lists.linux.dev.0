Return-Path: <ksummit+bounces-1261-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB82908727
	for <lists@lfdr.de>; Fri, 14 Jun 2024 11:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FE951C23F2C
	for <lists@lfdr.de>; Fri, 14 Jun 2024 09:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DCBC148FED;
	Fri, 14 Jun 2024 09:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Y8kif0iF"
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594AA18FC9F
	for <ksummit@lists.linux.dev>; Fri, 14 Jun 2024 09:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718356518; cv=none; b=cb2sfGp3mwp2Bstnnlor3aS9Mj3ci19rdPTuC/J1RSxft0rsN0dYwQtxA61F7L+R8tYTatmOON1N2pBLMFuwuDuBbkvOZw8dNtxXhtWyj7qEQE8sw1zXtq9AQZnlSGcCSAYv9MgV3w0kWYnhJU1rBcxByUOdVQmFgDxyCFPRhDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718356518; c=relaxed/simple;
	bh=rGjFgy1zj19TJpINVpqnoToyeLbd+YihGWRM0gkxp9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fiUAwbOwPLt+zYfTnExYDXlRH+tUe1GGf2mDPAmQ0SwFlTAuqHPqoaSat9kXbLHwoT08FGAg8jdWCxGY5aSEb3LOIA+QaL5kLOc0GqbpcgXmSi176nvYLfHoQHbxZFujt4GS0JJvP8HDyi384tJQHnFKX4LI9WkubIULAENzwMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Y8kif0iF; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=v/bv
	9snJ/HzHdR/e8VJLbcHUG8LzAg+CMyj1aMYLbmE=; b=Y8kif0iFlALdV7gyT89m
	2iXvkJ+hdj5RMyjy4m0fRIbu+KZ7bg9sKOEW0cw0getlwrBYYFfMy0AZ933pJSvV
	ZPJOVLlaTfSV9MUkQ2Cp0SVUcdtGbdGUwsAQxC4mjNQnqzOm+mY0PxlSY08TipuN
	zJaSGUdxHgwex5NhGTSgo/P2Lq9jRi/daohhIRfQvY98VZnq2GcuR0Ylgss1V+V2
	wKQJxoRDN/L7p6VpP4XWouzwkDrtJL0Wol/ymoGsuMYjtrfVQfCR/NSq9CbKQUDI
	dsY3nELFBMtRvxPfFU+LgbmYNpDUe+s0NNcVJ4/NaoMpQW4l0rFPm5vzhQUcAUTj
	vw==
Received: (qmail 1457823 invoked from network); 14 Jun 2024 11:15:09 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jun 2024 11:15:09 +0200
X-UD-Smtp-Session: l3s3148p1@Z39bDdYaNLggAwDPXzjQABqqX1QYyOSW
Date: Fri, 14 Jun 2024 11:15:09 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Mark Brown <broonie@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Jiri Kosina <jikos@kernel.org>, 
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Merge tree too flat?
Message-ID: <ia6eflrudxea7ndujrxytqcdvbv7kjwlcdnkel2hb5mdsboznt@edtpxkvf5xay>
References: <nycvar.YFH.7.76.2406041151590.24940@cbobk.fhfr.pm>
 <20240604182137.2cfdc0b2@gandalf.local.home>
 <nycvar.YFH.7.76.2406050028090.24940@cbobk.fhfr.pm>
 <20240604184506.007c4682@gandalf.local.home>
 <356ad539-3b37-4ada-8344-45ed938c02c5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qv3c3bm5u6kdrkfa"
Content-Disposition: inline
In-Reply-To: <356ad539-3b37-4ada-8344-45ed938c02c5@sirena.org.uk>


--qv3c3bm5u6kdrkfa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I don't think the mechanics of how patches get moved about has a huge
> impact on the effort involved

50:50, in my case.

> - trust and delegation make much more of a difference.  I've got
> several areas where other people are reviewing large volumes of
> patches before I ever see them,

This is also true for me. When I called out for per-driver maintainers,
this made the flood of patches bearable. All of the driver maintainers
prefer to review only, though, and let me handle the rest. This is
totally fine with me. I'd likely lose some reviewers if I force to them
to provide me with separate branches.

The other part is: a few months ago Andi Shyti took over the maintenance
of the I2C controller patches. He updates patchwork, handles
dependencies, decides on for-current and for-next, writes pull
requests... That frees so much time that I have actually time left to
work on the core code again and give high-level guidance how to tackle
problems. So, this really helps as well.

That basically boils down to what I said last year at the Maintainer
Summit: In some parts of the Kernel, there is no flexibility to redesign
the hierarchy. The limited amount of people interested in maintaining
and their needs already shape the workflow. And for me, this is also the
primary reason why the merge-tree looks so flat.


--qv3c3bm5u6kdrkfa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZsChkACgkQFA3kzBSg
KbZ/kA/9GvhzkzPjLxKMbW8Sb0AFW/pk8GnK6zWz+piuimhCbag36bH7igRBgJmJ
C4A5bbSxsWA/njkw5STao8oBm8qhDKdlyDffb1sd0Z1gi3T3vQKywHlsQa4m5Hdf
S2gLPAvvpPufZOjtqlaa74uzEArA0LmdcKfbZsEVtJsZ/HUen25FtgGPxO+hiVX6
T+sZpA8wEe7OqxgPHAZWds2eF81ZS/IpzCuNy0Vm7QbWLl2UaWHWdcBYmgFBuheQ
RasY4erPjJy0P1M0Pq/cJttHtTXZuFuAtiTpqHppDVkIKO+lNRGH/Jw2ukCPajfD
5/NGaHgcstrwTE9udynSJd0jYZnzxhMnzW+XGzp79FzuS3ozRA2E7/DlDvMLsHfj
ln72E8DQokl3pLZieNufFQe2AYa+VUmFtDN2G4Az0XzHxdFQKCoNEQ+ZdpFsEE83
RJtXMNvxZU9FDYju8S7E87tsMSBk5IfO6b89LwFFvILEVpYpKXlDvTloCyX9Lm1w
JbnmlJfr1vtUbtimAf3ZzVy8eGLlQrvsbgK9oHfk6e5Xkd7r3gYv1vzh1rgNT/My
iPLJftbS1buxp9n8Kx3GD2iFueiiudOtB30ylvlxNn30sK8HSl5g2MLS7TpdIJrP
t1DeJ3OyuXu7FHdNdO5AlSTYd4kFiLZfcYvtWTTqK7eIBAWFb4U=
=dU54
-----END PGP SIGNATURE-----

--qv3c3bm5u6kdrkfa--

