Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F5E7E3A39
	for <lists@lfdr.de>; Tue,  7 Nov 2023 11:47:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FF451C20B9F
	for <lists@lfdr.de>; Tue,  7 Nov 2023 10:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF06329CF2;
	Tue,  7 Nov 2023 10:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQ1JwZTb"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2ACFBE5;
	Tue,  7 Nov 2023 10:47:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E7CC433C8;
	Tue,  7 Nov 2023 10:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699354049;
	bh=zFr2mkj6LisFCY2fEwcpx1yFKNo+3Qy/SXjVuIQkQlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GQ1JwZTbd675vH7AWa+pjLCLbpBhpxuvGlHb70gNXLqH+Y30NLu6WPFniAbcxRfi/
	 fSZHSM0OwU2WYldGsTh31RZ/ze4UeqcoSf3THieC2Wd+aQaUJhbUgk6D1rYdZ398cQ
	 8+vGEaIPOuWaFly2Rdn2+M4Zik9kdPBf6X5/wYSNFO+NNVy4NYvv3OORT9mCAws53k
	 oZPwi3JTceoxb4xuqU8HLEfKwECUtZBWSnCJkpkiRjxBI9kqqhzc0zbgVYQuLDkc4b
	 jDG8YC7+aFAKuOqRhIrEO9ZoLsP755k/LYzX8aBFfZgoSLWwXuDF+eSLiziANA8/za
	 u5S7diQlKExNg==
Date: Tue, 7 Nov 2023 10:47:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Pavel Machek <pavel@ucw.cz>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, ksummit@lists.linux.dev
Subject: Re: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <ZUoVvQ6vpkXp10lI@finisterre.sirena.org.uk>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
 <ZUluOoDjp/awmXtF@duo.ucw.cz>
 <34eda1fe-0e14-4f12-b472-d152eadb7b88@redhat.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NsSfqgZHNEtmiCzI"
Content-Disposition: inline
In-Reply-To: <34eda1fe-0e14-4f12-b472-d152eadb7b88@redhat.com>
X-Cookie: Slow day.  Practice crawling.


--NsSfqgZHNEtmiCzI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 07, 2023 at 10:18:58AM +0100, Paolo Bonzini wrote:

> Indeed, I suspect that a lot of the traffic to LKML does not come from "T=
HE
> REST", but rather from people using a git-send-email configuration like

> 	[sendemail]
> 	to =3D linux-kernel@vger.kernel.org

> I'm afraid that having everyone switch this to patches@lists.linux.dev wi=
ll
> take a looooong time.  Right now I import LKML via public-inbox for use by
> https://patchew.org/linux/, it doesn't include all messages but it's pret=
ty
> close; the patches@lists.linux.dev mailing list by comparison hardly gets
> any message apart from Greg's stable kernel queues.

Note that get_maintainers.pl at some point started everyone to CC lkml
on everything, it's *much* more likely that people are picking things up
=66rom there than that they've gone and made an explicit configuration
like this.

--NsSfqgZHNEtmiCzI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVKFbwACgkQJNaLcl1U
h9CVCAgAguXlGSrYsP46ARDLdVioVi8MhXs4chvXxQNNIFbcgOzNCFdzR5H2aXfs
u85/JQ5mXzpWd9HSRzRXMSSD9FQnmHYbeA5FTH8w8Bdzjiv2zrPRM8+rKC3H6Vq3
CuxjnbwJecp4Khp87g7F+slqPOYI9WlW1hZWEpKDAXutDj7In74JGytg9h7x8nV3
BZ0YTX0O7aOOkEwZ79aa1189NXQhl0JVXB95zpQukLNXu1WNqEekfadTVS3dA1Gb
WpJvM9uGbYjHivoNbGic9HdxEJ8AMf60pE9nFryc1N0WRuYlR7GJSIr099mg8JY/
LqD7ANGOxh+Eoz9E5qIQZnHJY/K37Q==
=ds16
-----END PGP SIGNATURE-----

--NsSfqgZHNEtmiCzI--

