Return-Path: <ksummit+bounces-2267-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC2BB3FD8D
	for <lists@lfdr.de>; Tue,  2 Sep 2025 13:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 512951701C4
	for <lists@lfdr.de>; Tue,  2 Sep 2025 11:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16EF6280A2F;
	Tue,  2 Sep 2025 11:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LUz3tgR+"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E5AEEC0;
	Tue,  2 Sep 2025 11:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756811756; cv=none; b=YiRdFZV3hLDkqIE5XJ4Gk2Cp4goWIi0dVTcm52YuwfmpxB94a31VMrcyOs3yBPXUeAe5dZUeb7rb4y6vgnraYVhFlNHnnn/VyVuZgOn+flx6/2O1nI8OkPrvv233QhVJvgRIRYwW2AurMunxZQmMYTo2tnEe1cRjvkqTaRDcyZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756811756; c=relaxed/simple;
	bh=4LAz5Sp9tkYqy5XaaM1yNJWQ1MVagEgOzZSQvolvk3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t0YkHGuqJcwhwiq+waEs4B5Bn2ci3AzWWm43xh9u+RDY82saZHhEsXZOupcwJGEToRzrgqw3U+qfkqIWeCp9r+s1tnx6d+uo0wCAeFakmlWqUwFGqXtops28+qpE0EuW47an2ApnFxbPTgMEyJt/pwOLeJ8Zym07rOyTcdhUYMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LUz3tgR+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A24BC4CEED;
	Tue,  2 Sep 2025 11:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756811756;
	bh=4LAz5Sp9tkYqy5XaaM1yNJWQ1MVagEgOzZSQvolvk3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LUz3tgR+t4HAbiB/Hg/5e+CxMDqFBfAJhogt+j3iQvIfTmkpMz/qO6MbwN0E8ad2f
	 ClCP1bFyC+kN4YuWRphyG952YaidPOoNf65fNY6pZCyZ+ankHE4aorLoCc6XAMqEYB
	 i7szoyXQju3+3PT+J2BIfuesNfP5XDfQQklRMc6pdCULNy8dGu8JsLjkjIWNxi+/iN
	 z9M5RNhsrnZlBH1y5jzEMaMJx60s4qYTKvkMF8SCKAnjCWWSCnoG8vIl/zLuCEGgW8
	 0alfx8bXe1wsjFdgNNyDs58GPgpkAPN77QAR16qL8U+LOvjgixLGpPynP7LoN5dKYz
	 N3wID3n8F7TWQ==
Date: Tue, 2 Sep 2025 12:15:51 +0100
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
Message-ID: <865e583b-4c97-4db1-963c-ed8539fa56dc@sirena.org.uk>
References: <930d1b37-a588-43db-9867-4e1a58072601@oracle.com>
 <20250830222351.GA1705@pendragon.ideasonboard.com>
 <87h5xo1k6y.fsf@trenco.lwn.net>
 <20250831160339.2c45506c@foz.lan>
 <b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
 <b41031ca-b4a4-450d-a833-5affefe958b2@infradead.org>
 <2f927f53-9af5-4e0c-be8f-f7bdf90e23ff@sirena.org.uk>
 <20250901204635.51b81ffd@foz.lan>
 <1bf8a898-e697-46e2-86b1-4158b021d652@sirena.org.uk>
 <j3iblg4xx4nu64dgaxhl62mtherszeh3jyrskkf7l2jigld7wf@lr7mtq33gbi7>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0enCagorjsuApU+d"
Content-Disposition: inline
In-Reply-To: <j3iblg4xx4nu64dgaxhl62mtherszeh3jyrskkf7l2jigld7wf@lr7mtq33gbi7>
X-Cookie: Vote anarchist.


--0enCagorjsuApU+d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 02, 2025 at 12:56:57AM +0200, Mauro Carvalho Chehab wrote:

> If you run:

> 	 kernel-doc . --none -Wall

> You won't have troubles with Sphinx slowness. It would be worth timing
> it on you machine and see how much time it takes to run. Probably
> the run time depends a little bit on the Python version. Not sure how
> much optimization it got(*).

That takes about 90s for me.

--0enCagorjsuApU+d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmi20eYACgkQJNaLcl1U
h9CHdQf/T//rq4vy7brhPPvXWY5ng95KH7xHIUkphJ4Dc88LFH26s0bdh7IQOrRB
vj9HsPDkPOshAuS9TR8pFLNeKvFV/LuQAqBSwZDZeNhDcUtK/jE/4fCs0sCI6mk+
UBttPTv9m+CpUoay4Ea33ES7emq2BNi9w4SKASdkALvTAQUuUrLYkvcl7bNHVvK1
9kInFFWS8UOnwYgO3lWKT3iXQAOMU7AY5TwKDXZNXNMIODrzRWcGJ8svZrMVqDm+
8z8I2sIYTYL06qPR0AWP56d5StF9TycLi1+W7Xetpww7PuZXDbZ5aqYQ4kJOGaoL
grEXWC/yqzCJstKDcrxZ3BPUX+UaCw==
=vtHd
-----END PGP SIGNATURE-----

--0enCagorjsuApU+d--

