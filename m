Return-Path: <ksummit+bounces-373-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id AB45E3C2807
	for <lists@lfdr.de>; Fri,  9 Jul 2021 19:07:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 60C531C0F12
	for <lists@lfdr.de>; Fri,  9 Jul 2021 17:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5342F80;
	Fri,  9 Jul 2021 17:07:24 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24F472
	for <ksummit@lists.linux.dev>; Fri,  9 Jul 2021 17:07:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9484D61249;
	Fri,  9 Jul 2021 17:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625850443;
	bh=SZ4LVM143u6eLHTo0t6wdSOdCN2j71Ty9iLylacO0y8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JjxPZ/3mgx1F+P14XnV0MXAc0mECN4Rw0x9LjQjuWik0bpdpZA+Pn5hrkeij8Mt8c
	 eWXAWCHBVhuc4Nx536NRmKWsjMyRnHTYJMzLzMvHDycWNaYjjarNvbv5rpOYSlpCF9
	 yYxOwAz8c+nYl4A64GDm0dXQQWIfIuheAarGe86zlcBbWS3NO6Rejq4G54MBWrgcXm
	 XogtY248HhwW3fAigfp1PishVWqgMmpG0X3z7sEubJQra8IgjMDtUFnTswp3fYMwRx
	 b24Q65JJhbBbAQ1klAbgSIfLhLrlk9h7YXlAPeMJk7vMz5yMeG917A83BXO9Ncz3gm
	 +toRbvfHA1SzA==
Date: Fri, 9 Jul 2021 18:06:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Greg KH <greg@kroah.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Kees Cook <keescook@chromium.org>,
	Wedson Almeida Filho <wedsonaf@google.com>, Jan Kara <jack@suse.cz>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <20210709170649.GD4112@sirena.org.uk>
References: <YOXL6Th+pot9+Fp3@kroah.com>
 <YOXd9WoafgBr1Nkv@google.com>
 <YOXibDV8mHT1e6ec@kroah.com>
 <YOX+N1D7AqmrY+Oa@google.com>
 <20210707203827.GI18396@quack2.suse.cz>
 <YOY0HLj5ld6zHJHU@google.com>
 <YOaW/pR0na5N9GiT@kroah.com>
 <YOb/aJC2VuOcz3YY@google.com>
 <YOdJLYmUkoMyszO7@kroah.com>
 <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DiL7RhKs8rK9YGuF"
Content-Disposition: inline
In-Reply-To: <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
X-Cookie: This fortune intentionally left blank.
User-Agent: Mutt/1.10.1 (2018-07-13)


--DiL7RhKs8rK9YGuF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 08, 2021 at 09:49:15PM +0200, Linus Walleij wrote:
> On Thu, Jul 8, 2021 at 8:51 PM Greg KH <greg@kroah.com> wrote:

> > But if you didn't like the previous examples (nvme block driver, i2c
> > driver, gpio driver), how about looking at the drivers used by your
> > current desktop and picking something that you use today that actually
> > talks to hardware?

> With my GPIO maintainer hat on I'd say a GPIO driver would be quite
> interesting to look at. We are two GPIO maintainers and Bartosz is
> doing the heavy lifting for the moment so I'm connecting Bartosz to this
> discussion. (Now he has to read through the whole backlog,
> sorry Bart!)

SPI might also be interesting here and I think there's some SPI
controllers emulated in qemu, though no idea how well or specific
instructions for any boards.  There's a bit more concurrency and so on
stuff going on in the framework.

--DiL7RhKs8rK9YGuF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDogigACgkQJNaLcl1U
h9Ch/wf/WlI47xInzkrhvQWh/NuA8oWERdCISsEKgvjt16xQTqEx9mc7XnBX+J/j
9n2A1VCfRxBuUGN+OTVxzShmsbaM1zbAfJakkFBuimGcM5e7+D2Urd4xWYTswgJq
m9JYJlZKZTxvi8+8eUl+IvJviFq98GJvjpDllJ/N0783ZI7uhSF7zwzR/wZgcDR1
Paa/goTq3DzJz1aIF/3/JEs8xs2D7WfpACUzggGIRhrM4TpYu5fw/RDlH2TFWwhL
VRBczoqnbnKFb5bJ2ae6kRPZ4veq9NHTj9I2RfXYISTXMg5vNPD9B4T8KQyDDCqI
ahVvFegULEJJfarLL1i7wTo4Gy5vog==
=LJlK
-----END PGP SIGNATURE-----

--DiL7RhKs8rK9YGuF--

