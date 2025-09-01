Return-Path: <ksummit+bounces-2250-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF86B3EDC0
	for <lists@lfdr.de>; Mon,  1 Sep 2025 20:20:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBA9B3AC60C
	for <lists@lfdr.de>; Mon,  1 Sep 2025 18:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF5B320A2A;
	Mon,  1 Sep 2025 18:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dl+BBhro"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF5A28EB;
	Mon,  1 Sep 2025 18:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756750827; cv=none; b=X2/ygBhU7JFdBP7rBLxXRg4BlJO9IlfUa5AOGVQ0Ubf3RCwj0JRjNVEdMwliD3BTWG32gd9dzZWWed9iNXUzSdR0W2K8Lb57ZtVcw3bVgGMOINHyNim0FJT6CLKtMlDVi5vskFDHxgAi+3bvIUAZNW35zGzqjt5Cs+tKPQ80WsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756750827; c=relaxed/simple;
	bh=vSt/gB4i6AMigMvp1uMXAuxfiYydJmAzr5hpNcwmsyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gRwysgsvRFaYm4hbacZQyjJtZzZK7TWsy/sijFWyKrvOGbeNgCgm3nx5TI0uh5DQ094yrRpr7DBFsymL7PiWm8BdOsM5aL/Ekmk/oNQVoGJFbQa/1EIVUaMyeMhBFHoHixwcLoYfe1wYW4RqT95IkspAMGPhENv7cPh2MrWEEU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dl+BBhro; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C950C4CEF0;
	Mon,  1 Sep 2025 18:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756750826;
	bh=vSt/gB4i6AMigMvp1uMXAuxfiYydJmAzr5hpNcwmsyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dl+BBhroDVQAtq3+AP1kfZaxsI2DLMSMoNWt63FPuAhdJisXeFn6Nn67ZTGN5HmPT
	 JRGID7Jjd3vI1tei9ixOc/si4OhV/OUuM6bzo9J+dZnCHkZ0y6nJgZNn23KMQ8dX2N
	 CRfP9ueSj39RxGdJqabN2dJslK11/mpeYDeTGrkqJmhWyLQmPhPKsNw2FwLRwM2VvP
	 MEl15LRndTzo6Mx7JjLlim4bNLETgzzh3HywyBo051mbZUGJhSIU47JQWJK2XJ2Qjx
	 EPM9g809+ezeIQMrsPCFKMDUTde8C4QZhLhxO0jpvzbuk8aDFqxHjcSO/GcaRYfmvh
	 aPX6SItLq1Fvg==
Date: Mon, 1 Sep 2025 19:20:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jani Nikula <jani.nikula@intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vegard Nossum <vegard.nossum@oracle.com>, ksummit@lists.linux.dev,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
Message-ID: <e50d186e-c3ba-41f1-9cee-19619d482373@sirena.org.uk>
References: <20250828230104.GB26612@pendragon.ideasonboard.com>
 <87wm6l0w2y.fsf@trenco.lwn.net>
 <930d1b37-a588-43db-9867-4e1a58072601@oracle.com>
 <20250830222351.GA1705@pendragon.ideasonboard.com>
 <87h5xo1k6y.fsf@trenco.lwn.net>
 <20250831160339.2c45506c@foz.lan>
 <b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
 <b41031ca-b4a4-450d-a833-5affefe958b2@infradead.org>
 <2f927f53-9af5-4e0c-be8f-f7bdf90e23ff@sirena.org.uk>
 <6c2f40ed-7dbc-4ae8-8231-f414ad15acef@infradead.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oDGuD8/aUtrhDyqI"
Content-Disposition: inline
In-Reply-To: <6c2f40ed-7dbc-4ae8-8231-f414ad15acef@infradead.org>
X-Cookie: Auction:


--oDGuD8/aUtrhDyqI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 01, 2025 at 11:15:50AM -0700, Randy Dunlap wrote:
> On 9/1/25 10:52 AM, Mark Brown wrote:

> > make htmldocs is rather slow:

> >   $ time make -j56 htmldocs
> >   ...
> >   make -j56 htmldocs  2355.99s user 141.33s system 158% cpu 26:14.86 total

> Wow. I just ran 'make -j8 htmldocs' on my 16 GB intel core-i7 laptop:

> 1205.85user 66.15system 6:05.82elapsed 347%CPU (0avgtext+0avgdata 1298044maxresident)k
> 697432inputs+1128016outputs (92major+16863601minor)pagefaults 0swaps

> How much RAM does your build system have?

64G, it's not swapping at all or anything.

--oDGuD8/aUtrhDyqI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmi14+QACgkQJNaLcl1U
h9AQIQf+Pb833i8AjsFLANNmcinPav7VS18mARe8sEOBTglOihWPT9AicXRHdD1u
XTkRxCvlWAkw4VhJKlqBUDNhTTP58XKqmn+MSUlk89UxJr+eHrVf/AZ4glNMb03U
7KgqevMjrH1vaWfu4kG6mX02lzyPv2irwpeodWTkmxFOBfnZsvu1Hc5DA2IXXhi+
lGpXU/xvt57qn9GkXOAeQOkOL1BVK+Wv8t8r0HsT44fg7tG6FM4uBXTgH/sv77JY
NIwj/sH+9EVH8fNzBfnt0XJli/iKN0cTO+3jcZ5AVcXaLvpL5av4PXdGq+9xsktZ
bk/tM6sxLkk/SEbiJetmCDTQJbbN8g==
=RKPp
-----END PGP SIGNATURE-----

--oDGuD8/aUtrhDyqI--

