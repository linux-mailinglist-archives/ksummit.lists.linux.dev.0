Return-Path: <ksummit+bounces-426-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A4D3CFE83
	for <lists@lfdr.de>; Tue, 20 Jul 2021 18:00:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id EA4D41C0F51
	for <lists@lfdr.de>; Tue, 20 Jul 2021 16:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF2EF2FB6;
	Tue, 20 Jul 2021 16:00:23 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064F370
	for <ksummit@lists.linux.dev>; Tue, 20 Jul 2021 16:00:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C44C6100C;
	Tue, 20 Jul 2021 16:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626796822;
	bh=dkL66U96v0hwDpKIr0D2H6nA6y9CAYr1QQqGQ3siWGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h3UTEvAshGtKER0AFHA3wbnou47cyMyJUnHQNWuM0Brr2hd1AnnuWQyl9/pVE6vfY
	 JLGS0xJneooXS/tLAFhbKazmkj2t8BKeFkq1VqZNprMW3zMbJqyu4xHZsyXKMs88fj
	 f+B9fZDLU8qlAamSnFp3gqHmJIMhhvshiBdJN2egwRiWFbykZqrRgFGk4MjTc9wOPI
	 ZhuoIwCrV8nzSWn5SLENBY7PgieG/XTrtLgfyIa8Jnvh0t5MGV1TafSKO64AYYQFTu
	 IE18EiIbH7XZa7brHZpA2Azm8oX3WJdtXiGJE6yRSXgR9lwICj8bbqyXtOgqvMXV+W
	 VoL41OxBaXUsg==
Date: Tue, 20 Jul 2021 17:00:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Wedson Almeida Filho <wedsonaf@google.com>,
	Greg KH <greg@kroah.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Kees Cook <keescook@chromium.org>, Jan Kara <jack@suse.cz>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <20210720160018.GD5042@sirena.org.uk>
References: <YOb/aJC2VuOcz3YY@google.com>
 <YOdJLYmUkoMyszO7@kroah.com>
 <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
 <YPVvEZgcP1LMGjcy@google.com>
 <CACRpkdZE+tnS1qV3xC0tDV1aSxBtfJq81+eBtkrovCgOOUimwA@mail.gmail.com>
 <YPWPbbqdG3aFCmAZ@google.com>
 <CACRpkdYqfYrhWT2kZ0uy8hS__EfVmQdq8X5ev6Oke+WQWfiDSg@mail.gmail.com>
 <CANiq72kHY=w8VVHUH8EyLcfRXQzq+OXOBCrrW7dHk9kkzJ_BHQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yudcn1FV7Hsu/q59"
Content-Disposition: inline
In-Reply-To: <CANiq72kHY=w8VVHUH8EyLcfRXQzq+OXOBCrrW7dHk9kkzJ_BHQ@mail.gmail.com>
X-Cookie: Revenge is a meal best served cold.
User-Agent: Mutt/1.10.1 (2018-07-13)


--yudcn1FV7Hsu/q59
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 20, 2021 at 03:21:45AM +0200, Miguel Ojeda wrote:
> On Tue, Jul 20, 2021 at 12:16 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> > I think it's not a good idea to keep these wrappers in their own
> > rust directory, they need to be distributed out into the kernel
> > everywhere they are used. We have made this mistake before
> > with OF (device tree) that started exactly like this in
> > drivers/of/*, and now I have part of the OF GPIO handling
> > and tests inside files in that directory as a consequence.

> The `rust/kernel/*` folder currently contains all the "Rust
> abstractions" that are shared by all the kernel, i.e. in the rest of
> the kernel tree we have kernel modules that are users of the
> abstractions.

> The main reasons behind this approach are that it is the simplest one
> and that it makes a clear distinction between abstractions and user
> code. In fact, code inside `rust/` has some capabilities that we do
> not allow for non-`rust/` code. For instance, `rust/*` code can use
> the C bindings and has unrestricted access to Rust unstable features
> (though we still carefully pick the ones we use, of course). This is
> not the case for "normal" Rust kernel modules elsewhere.

> Having said that, this is not set in stone or a hard requirement -- we
> can definitely split things and move them elsewhere, e.g. having a
> `gpio` crate in `drivers/gpio/`, for instance. We could still follow
> special rules for "subsystem objects".

It does feel like it'd be good to work out some system for ensuring that
subsystem maintainers have sight of any Rust work that's going on for
their subsystems rather than having that happen off in a corner without
visibility.

--yudcn1FV7Hsu/q59
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmD28xEACgkQJNaLcl1U
h9CV1Af9Fye+jvSDKpmpsKm3F+R2rhFLuRCxgiuyLYDhmWI8qJh6YLsjp6Iw1sqD
U9HOVbs05k4D1Q8nzTPZ+DwcECsuXKqGLhznCjtSSsO8zyD4s8XWAv5skHVfO5EQ
yBg0hOLJPLEebkTtRcCiPn3Uu0Dg8x/BhlCe8t5xbcDff+APKZMl3CpNwnFruYyq
CH+ttii6Ifcp7jMTOf+lqOSeXxaW+ZCm7y3j858ogDUwK+ZzekZSVXLUAo8lts/V
mnRP2YmMNdYqY1iCOTf/96trPJHLANIgcYq1YR+l7h9SdKENv25UE0rh7Fp4iTzo
sqqjWofdP6Tj2zQ5IBBimMtIugkLgw==
=iJh+
-----END PGP SIGNATURE-----

--yudcn1FV7Hsu/q59--

