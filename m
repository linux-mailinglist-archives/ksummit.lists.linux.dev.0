Return-Path: <ksummit+bounces-1009-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E00BF77F98B
	for <lists@lfdr.de>; Thu, 17 Aug 2023 16:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C56B1C21413
	for <lists@lfdr.de>; Thu, 17 Aug 2023 14:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 533BF14A8A;
	Thu, 17 Aug 2023 14:46:21 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81901428A
	for <ksummit@lists.linux.dev>; Thu, 17 Aug 2023 14:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06624C433C9;
	Thu, 17 Aug 2023 14:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692283579;
	bh=8XnrJUPdUGT0vyzFvK7l2k/cGDAhzhs4rU7cXWmZ1fE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pwp858V+e1FjWk75wSbca0YX/WP5c4PWB3i1jJzqbA/32IhbgW40NLKDUF08VDZN6
	 UjIgtgazjhRM0tHe7PFg5dB6ODLOwmKeRxLTxg2ZAsiR86+8Sg0BbkehSDvp4CU4qv
	 sPxUmdtLuo8C5HghlXv2AOS8RNUsK/bMw6kSykIMOjPgASr65i/+8VNfp3RJyynQ0H
	 MGveH/jmMXMrfcPwfZdmynsqDxAiMCT8aaNn2Mo+Oji4BD/aoOU9WxhkFrZtZwLFkh
	 9qt8FI/eRHNARnz8mn4AsPNu6sMG8DAVJaGnGq7o+m7P5X7X5e9il+Eh5Sgk2sD5Yb
	 59tWxFsvhMPNw==
Date: Thu, 17 Aug 2023 15:46:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jani Nikula <jani.nikula@intel.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev,
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <c5e14cb6-b9b6-4d9e-93c8-ab1746e1c1f6@sirena.org.uk>
References: <20230816180808.GB2919664@perftesting>
 <ZN0uNrpD8JUtihQE@bombadil.infradead.org>
 <87ttsx98ue.fsf@intel.com>
 <f7915398-b59a-4c9c-97c1-669be7471ec2@sirena.org.uk>
 <20230817124255.GI21668@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SWOEBKLriyKCDi1M"
Content-Disposition: inline
In-Reply-To: <20230817124255.GI21668@pendragon.ideasonboard.com>
X-Cookie: Walk softly and carry a BFG-9000.


--SWOEBKLriyKCDi1M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 17, 2023 at 03:42:55PM +0300, Laurent Pinchart wrote:

> Reports from automated tests, or automated reviews, should be designed
> to help the submitter, not to scold and discourage them. I'm pretty sure
> we can come up with wording that will be nicer to read than what I would
> write when being tired at 3:00am, repeating the same comment for the
> 50th time.

Honestly I think the risk is more that the tests are noisy than the
wording of the mails - that's a real problem with some other projects I
occasionally submit to, there's a bunch of CI that spams out that is
just worthless.  Cultural differences mean we're never going to get to a
point where everyone will be happy with mails.

--SWOEBKLriyKCDi1M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTeMrYACgkQJNaLcl1U
h9CnIAf/VdoDY2WjmCKEgqdaNsziB7xoen5Cxua3VyJd97wAEDENo9AzMtFZ0BuE
NeN1oBuzYaJz32ABViBbA22rumwGVlRGWEiSMtzI/ldzr2BRhZUMBwZ5t2ynBNft
1S3zKStVKg5UWdCzmU0B859Kr4Sjk6QoyXLw9YFd3Xwl2+/98xPxRtD2BcKlH2Wz
m0nrGW52ILmudWFPvFKmK4uaJHW3pYWv4pfDLjb4JHut9YLSLsnhl3fBBdKLxNbf
AorFYKtInsTalhUJ7KZoAI1QHSWGKEgJ+8mBu6F4wyw7AhnUTHT5YaWot2NFuruf
J2rUaCB6eelnq528gR94rZhU/5PAaA==
=WOzE
-----END PGP SIGNATURE-----

--SWOEBKLriyKCDi1M--

