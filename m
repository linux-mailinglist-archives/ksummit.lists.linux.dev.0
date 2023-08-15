Return-Path: <ksummit+bounces-984-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A428577D212
	for <lists@lfdr.de>; Tue, 15 Aug 2023 20:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D8CD281592
	for <lists@lfdr.de>; Tue, 15 Aug 2023 18:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F5518033;
	Tue, 15 Aug 2023 18:40:39 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E01101F8
	for <ksummit@lists.linux.dev>; Tue, 15 Aug 2023 18:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC460C433C7;
	Tue, 15 Aug 2023 18:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692124837;
	bh=HvQ/VjtTJzisuxrxkY9sAI6ig5y5Uf+VATQP2+xntvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZaAG77gWWYjENbORmvzKEpXf/dNMPgiOr83GA02dsPWC336ZFl4YWedX23Vag9P+A
	 pt8bEUG/eYyYuM/8LJfqmgndELiFaRin1A8nwS040F3zKISfLPzFrtndsEezQqLSZI
	 rJoRVYlsAp3lH2ur9rZFC2oGRA6CBeiohY4fBYYF/ZmqI1TdFViE91X0EnGRzK6ZfK
	 9JW0RHBf1N3vii2ffJgsECb624Q0s+awkL2ILh2ZlYSf5KPUELLp67ZtAPhWmDYLOL
	 TH44sEXwyn9TGW0hYXD+LqNkHJlqk2fZbCQcrkH95O2/kjMOedlcu+lY32PO66IDwD
	 jgz7peZ47Le6w==
Date: Tue, 15 Aug 2023 19:40:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Quality standards for embargoed code
Message-ID: <d7e2f08c-858c-4ace-b9af-d71f8f3b987b@sirena.org.uk>
References: <ZNuuvS5BtmjcazIv@sashalap>
 <10adba69-f937-4d22-a57d-b392ad87be64@sirena.org.uk>
 <ZNu/oDTPj3LNyp+M@sashalap>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Nzk1VNS6y4iz4qgD"
Content-Disposition: inline
In-Reply-To: <ZNu/oDTPj3LNyp+M@sashalap>
X-Cookie: Darth Vader sleeps with a Teddywookie.


--Nzk1VNS6y4iz4qgD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 15, 2023 at 02:10:40PM -0400, Sasha Levin wrote:

> My thinking was that the community could define a set of requirements
> that we expect to be tested before we're willing to let code sneak in,
> something along the lines of:

> 1. Built with GCC v1, v2, v3 for platforms x86, arm64, ... using
> allmodconfig/allyesconfig/allnoconfig/...

> 2. Built with Clang v1, v2, v3 for platforms x86, arm64, ... using
> allmodconfig/allyesconfig/allnoconfig/...

> 3. Run through LTP released in the past month.

> 4. Custom community provided tests, etc...

...and these tests pass!  :P

I'd also add booting on some set of qemu platform/firmware combinations
and the higher quality kselftest suites.  Guenter's tests would be good
too.

> The consequence of letting something sneak through will then be on us,
> and will probably trigger the addition of a test to the list of tests
> above.

Right.  I think the core thing is at least smoke testing.

--Nzk1VNS6y4iz4qgD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTbxqAACgkQJNaLcl1U
h9D2Jwf+IAVki8BZh2eEbnX+59uPqMAlgPD/jrNXy/uYAbZDec/7B98ZwTbwSzxf
A4qEJNHWFKznAIGCOM3/ai43NY4KUCtNAiVjKMmzpOXbS6RkI8elqa7jYcLmtYJC
E4ggYglVrtjjQX7nJwgXwvm1sRcB68UMLu8Cf22zlnHS2r+oWa6fxJCcoBo0e3tx
lI1S9+27iwh415iZOYwyzMgYOViNZJpTXx8HZXQkQCqFW+xC5p8vfe1xdsA6KDP5
VrcRkI7l4PQAuFmN202VDnHthMPpEYgkfaUKRQWruSKBuVYgGG3mY2S/qwONxlym
lL5KTaPDElFJsy7aYl1yeGl4xk9wXQ==
=NZg8
-----END PGP SIGNATURE-----

--Nzk1VNS6y4iz4qgD--

