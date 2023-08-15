Return-Path: <ksummit+bounces-979-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4B777D0BC
	for <lists@lfdr.de>; Tue, 15 Aug 2023 19:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7D0928155C
	for <lists@lfdr.de>; Tue, 15 Aug 2023 17:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C16515AC7;
	Tue, 15 Aug 2023 17:18:22 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37A2134CE
	for <ksummit@lists.linux.dev>; Tue, 15 Aug 2023 17:18:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0D1BC433C7;
	Tue, 15 Aug 2023 17:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692119900;
	bh=Rs9+ftOB1Uqbw6+V1xcl2zJAb2gXSg6zmfGdA5LXxvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gtgJ6MCfC83tokEzJT4NM+vorfq828cvTqaRePqqz2LXlzRTrkIjLiSWfjGRj4myL
	 sdXN0eUA8mZ8x0qjOxs5+bhKfKot6v/aW4oruKseRz/xyO779Zcl/tRAPJjQXGDInh
	 gCyoeJ0PukgynwhC7I20r6X+UyTc26VZNgszr4ECmt9X5P7Cq+CNMd0K5BNxOlPRax
	 Uh0EM5DKEDoq8Z508bSnV+GgwkfktdcCja59CYZimAfZjHpZ/xq2IZJH1NkiuD6w3W
	 kk1al66nKbQfs7zHgRMbfPlZrgewGlZ61mc95oQppZ1vKJNBwehW1LvSqfo9ZCCaEO
	 5UPW3rc5jVumQ==
Date: Tue, 15 Aug 2023 18:18:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Quality standards for embargoed code
Message-ID: <10adba69-f937-4d22-a57d-b392ad87be64@sirena.org.uk>
References: <ZNuuvS5BtmjcazIv@sashalap>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RNd/KOq6IJ54EvIr"
Content-Disposition: inline
In-Reply-To: <ZNuuvS5BtmjcazIv@sashalap>
X-Cookie: Darth Vader sleeps with a Teddywookie.


--RNd/KOq6IJ54EvIr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 15, 2023 at 12:58:37PM -0400, Sasha Levin wrote:

> 1. Ask (require) organizations that repeatedly go through this mechanism
> to create a test environment that can demonstrate how the embargoed code
> passes different build/validation tests. We should set a minimal bar to
> the demonstrated quality of code that we'll "sneak" behind the backs of
> community members.

This would be great, it's especially frustrating when the issues people
find are readily visible either in build testing or with virtual
environments and therefore even if people want to keep things secret
they should be able to do the testing themselves.  I'm not sure what the
consequences would be for messing up other than a bit of yelling but
perhaps that's enough.

> 2. Create a group of trusted "testers" who can test embargoed code with
> different (ideally "real") workloads and environments. I think that
> we're overly focused on keeping the circle of people in the know small.

> 3. Work with KernelCI/OpenSSF on setting up a (small) environment
> similar to the public one that we could run embargoed code through.

If these environments are documented and based on available code (they
should be) that could be a good way of setting the requirements for
people who want to do everything in house.

--RNd/KOq6IJ54EvIr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTbs1cACgkQJNaLcl1U
h9AtSwf8DrM3JkIh6E10MYTz2O8/jBQS/i/3mM0jQNFrWGlD2hiQi/jghdjHlv+i
P6h5zJ2Braduds/1Gs1V/CnglWY6plzFIpINMbnJgRuWlwoY9B2j7Q8Oed63gQAl
QksbT7iKk0nMRivBX+rYdEVb2GsOkWnkSYTQkJYqJTsf0T1iSiRftsfxGeshXLCD
Um9InPlMjL/GcwAOSnMZco+TvPlD0/4nmVAteGSV13hldY7gvk3ytOrKF6j1fCLE
mrBhYjSkUaQTLNnc67vmETXbp6vPu0ry127plE/F0cRQQeDKpoc1urwECdsudCRs
1P+XqE5P00QkCbqw4pT7KrABZgHd8Q==
=Fa0i
-----END PGP SIGNATURE-----

--RNd/KOq6IJ54EvIr--

