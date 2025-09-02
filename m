Return-Path: <ksummit+bounces-2273-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 485CEB401FF
	for <lists@lfdr.de>; Tue,  2 Sep 2025 15:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9832541F70
	for <lists@lfdr.de>; Tue,  2 Sep 2025 13:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 391D62D6E62;
	Tue,  2 Sep 2025 13:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xq1TRV9X"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD552D2493;
	Tue,  2 Sep 2025 13:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756818048; cv=none; b=CO2RS0AIPtn0vJZT2R9fyWORuZgSQSn1flS8VJUo/zBHPhB6F59KUn+iZPiY4kDN8DdnAKCbuS4/Xo/1pRXcQNWqf0FGDu0kHLxwJt+2Uu1G5b15aux5rAhMsATUjPhHy9mElbYFfcc4p1rhAB+h9TKhjY+8+hMfO9ELJAgIn0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756818048; c=relaxed/simple;
	bh=w6VMeXlaDo13MyeED1CAidZ2X/FlNVlckExPfa9nfRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lQoFpTSu7dg6V83ouuwC8y7Gk5u5qNOQTq5EfdTb/LBRpH2frZxvFufOi5/pP+KYcKjOS8l5tqAJPSEbFXRkjC2oeCIROG/DOUzBqaZ4AMTaVzwyLVNVRGy/ada6otlF7SuB1wbQXIqy938SVeMr1KBc8roigTqN7TuGmAcc1gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xq1TRV9X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 755E3C4CEED;
	Tue,  2 Sep 2025 13:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756818048;
	bh=w6VMeXlaDo13MyeED1CAidZ2X/FlNVlckExPfa9nfRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xq1TRV9XCcuwdtYBnDj4VOwKLIuZ7TrucwmHrmI6EacVPy9NS6NIv1vzCXSXbGP60
	 bvyhiruAV7un22nM9qKyqd35FzouV0iN/Io3ZJVdJz3+8ILrvx0nM2W63kBU9QUnKa
	 2TGzCfWbMyXQ6va1M90b9J2UjIpfpu/UV+Vgw7ciUL5Obna2Ny3G7HwKW5rfs4iO9H
	 bm7EbIiE+zknzE9hgH1r7gcOZqxUjYp8clDIAfHepYUGgYUZtFMxE0He77fUsyPYPF
	 K5EyJFZtsIdKuv1BArqbtXlLqv1ptqXh+LbDGqt9EpDqjrWs14j7IiMINHQKMjZ7UW
	 DvS94eTrsXapA==
Date: Tue, 2 Sep 2025 14:00:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vegard Nossum <vegard.nossum@oracle.com>, ksummit@lists.linux.dev,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
Message-ID: <8339a5dd-446d-4717-9d68-983f5e2354b3@sirena.org.uk>
References: <20250831160339.2c45506c@foz.lan>
 <b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
 <b41031ca-b4a4-450d-a833-5affefe958b2@infradead.org>
 <2f927f53-9af5-4e0c-be8f-f7bdf90e23ff@sirena.org.uk>
 <20250901204635.51b81ffd@foz.lan>
 <1bf8a898-e697-46e2-86b1-4158b021d652@sirena.org.uk>
 <j3iblg4xx4nu64dgaxhl62mtherszeh3jyrskkf7l2jigld7wf@lr7mtq33gbi7>
 <865e583b-4c97-4db1-963c-ed8539fa56dc@sirena.org.uk>
 <20250902135938.35048fbc@foz.lan>
 <20250902141434.3e5b14e4@foz.lan>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B6lytLiN+OrKYyvD"
Content-Disposition: inline
In-Reply-To: <20250902141434.3e5b14e4@foz.lan>
X-Cookie: Vote anarchist.


--B6lytLiN+OrKYyvD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 02, 2025 at 02:14:34PM +0200, Mauro Carvalho Chehab wrote:
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> > > That takes about 90s for me. =20

> > I wander why here is 3 times faster... disk cache? python version?
> > faster ssd?

> > What python version are you using?

> Heh, after running twice or three times to avoid cache issues, I tested
> running it on my machine with two different python versions:

> $ time python3.13 scripts/kernel-doc.py . --none

> real    0m31,660s
> user    0m30,911s
> sys     0m0,588s

For me it's fairly consistent with python 3.11.2, I get some variation
depending on what else is going on with the system but nothing hugely
surprising.  It should mostly be running from cache, the underlying disk
is a reasonable SSD.  The single core performance on this machine isn't
amazing, it's more getting it's speed from having a bunch of cores.

--B6lytLiN+OrKYyvD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmi26nsACgkQJNaLcl1U
h9DGMQf/YGjZcuA/mHVA9wRqPTFhiLOubBrXY0F/tn/88GFVQL7DWc06dGkbdSmY
5tSAe7Ju8eQxPqlKKKQ+r1z1EE0lRBzZ73nZ7C18C1aT3jddehcTEJ6/fC2a4vrN
AZLiaDkV4AylJs8PFWDw7ef1hA/RCXffUk47CKLLqeeSe/CvfsxLTuRn3OnZcNJK
XY1tiQRuW5oRA/smRVWoPZNqxJAAweyDfMUaY6CxlFuJWU9+J5oMhffn/V7VkOhX
trfFpxnqOHxtyEqlBA7supCh2dM6IWjWhdW2Pkdk964hG1sa3E0MBqVJi32Koi3e
dvuKubRKCONWPLB1OauqpV7+51n31Q==
=r8AE
-----END PGP SIGNATURE-----

--B6lytLiN+OrKYyvD--

