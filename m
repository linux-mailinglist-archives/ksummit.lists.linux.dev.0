Return-Path: <ksummit+bounces-100-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A84F368397
	for <lists@lfdr.de>; Thu, 22 Apr 2021 17:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 23DE63E777D
	for <lists@lfdr.de>; Thu, 22 Apr 2021 15:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45BED2FA0;
	Thu, 22 Apr 2021 15:40:47 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A73370
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 15:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id CD6EC128011B;
	Thu, 22 Apr 2021 08:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1619106045;
	bh=2siloGvUFeivImMBTowcbnRSONxR6P12rHghowdJ0oM=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=LwKW25kuxhNjZe64UTyd0EwJAjpNXHt7rFJIm16So1oeHoPmH0TpStyKr90qpDyks
	 18NwJ9OtHjVNJTFQ5MB6WPq2omHhro6pklSmLXup7Y+y6BT3c+WPh6nOTps8vmffaW
	 kmsisHaJulW/29YjGD7CGLvOQ+sRJR7tHFsyduwQ=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pZ3oN7uQ-Pa4; Thu, 22 Apr 2021 08:40:45 -0700 (PDT)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::527])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 6E66E12800F7;
	Thu, 22 Apr 2021 08:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1619106045;
	bh=2siloGvUFeivImMBTowcbnRSONxR6P12rHghowdJ0oM=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=LwKW25kuxhNjZe64UTyd0EwJAjpNXHt7rFJIm16So1oeHoPmH0TpStyKr90qpDyks
	 18NwJ9OtHjVNJTFQ5MB6WPq2omHhro6pklSmLXup7Y+y6BT3c+WPh6nOTps8vmffaW
	 kmsisHaJulW/29YjGD7CGLvOQ+sRJR7tHFsyduwQ=
Message-ID: <6ed3c03acf5aca727a443ea6e26e3b023a060905.camel@HansenPartnership.com>
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Mark Brown <broonie@kernel.org>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Mauro Carvalho Chehab
	 <mchehab+huawei@kernel.org>, ksummit@lists.linux.dev
Date: Thu, 22 Apr 2021 08:40:35 -0700
In-Reply-To: <20210422153646.GI4572@sirena.org.uk>
References: 
	<afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	 <20210422123559.1dc647fb@coco.lan> <yq1o8e6shil.fsf@ca-mkp.ca.oracle.com>
	 <99289ff4cf7b1e59f82c330728c80dc7e63319a7.camel@HansenPartnership.com>
	 <20210422153646.GI4572@sirena.org.uk>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-J/blA/n5uRNiD7YBjOhm"
User-Agent: Evolution 3.34.4 
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-J/blA/n5uRNiD7YBjOhm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-04-22 at 16:36 +0100, Mark Brown wrote:
> On Thu, Apr 22, 2021 at 08:28:00AM -0700, James Bottomley wrote:
> > On Thu, 2021-04-22 at 08:32 -0400, Martin K. Petersen wrote:
> > > Another metric that may be worth capturing is how many Fixes:
> > > tags refer to patches authored by this submitter.
> > =20
> > Or perhaps invert it: no bug fix without a Fixes: tag.  Some of the
> > human handlers of robot based finders, like Dan's smatch, do go
> > back and figure out where the bug came from, but if we encourage
> > the rule that if you're fixing a bug you must identify the origin
> > and explain the bug it may help weed out some bogus fixes.
>=20
> Script that use git blame to generate a commit to put in the Fixes:
> tag incoming...

Any system can be gamed, but I was thinking fixes helps ground the
reviewer in where the bug was introduced.  I also wasn't thinking fixes
alone, but fixes: *and* explanation of the bug.

James


--=-J/blA/n5uRNiD7YBjOhm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABMIAB0WIQTnYEDbdso9F2cI+arnQslM7pishQUCYIGY8wAKCRDnQslM7pis
hSM7AQDvJWjNjPYNCdblgpOLpvkb3BZL3anM1q3MUiHE6azuRwEAyytcBWfuup9E
CS3ErEsS5gn87k3W66N4U7n8ZLhwPzo=
=jcYb
-----END PGP SIGNATURE-----

--=-J/blA/n5uRNiD7YBjOhm--


