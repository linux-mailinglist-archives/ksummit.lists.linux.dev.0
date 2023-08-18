Return-Path: <ksummit+bounces-1028-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 724F8781281
	for <lists@lfdr.de>; Fri, 18 Aug 2023 20:00:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29EA62822B4
	for <lists@lfdr.de>; Fri, 18 Aug 2023 18:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940891AA9A;
	Fri, 18 Aug 2023 18:00:49 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2710C6108
	for <ksummit@lists.linux.dev>; Fri, 18 Aug 2023 18:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 990F2C433CC;
	Fri, 18 Aug 2023 18:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692381647;
	bh=JNvRqo/ftYzYJl9dlglZu20glwuRxYwXMlVcJIU1ou8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YMLtT61GjeDo690kBF/kRemv9rItGg5VJJsrgFKlENT+b5PvtpL4Ej78WlRjjTMKu
	 9k64nK4K+kR/VSln3ShM2K8gyY8GEvRGJxrtxinnM5Akt+lUIbjYDKMr3XQO7ETNm3
	 B8eQC4qUym66qicMdij/pkg+ezXLaOZNUmq+RdpwvSYYsAReIHfOpzAwThfMNS86qK
	 pUYvg/sabCZggiQHprU5vKQoZJIlUPwjUhhOt6Edp4sRY5Heo54YLyhA8pn5I4n/Yj
	 T8ZpZrCDHhjJ5POX/o/tybuKyQhqv78DaQAFJPSDA3ZWh5VNmsryd+vZSIhD58J1MK
	 D71KgF4MhW2Ag==
Date: Fri, 18 Aug 2023 19:00:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev,
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <e59e177b-b28b-4c3a-8e4c-6360ba8138b1@sirena.org.uk>
References: <ZN0uNrpD8JUtihQE@bombadil.infradead.org>
 <87ttsx98ue.fsf@intel.com>
 <f7915398-b59a-4c9c-97c1-669be7471ec2@sirena.org.uk>
 <20230817124255.GI21668@pendragon.ideasonboard.com>
 <CANiq72m73vvbCLaRUkPVBfE6e+7FOYjBqd-EBJaLW-geukB2dA@mail.gmail.com>
 <20230817150336.GJ21668@pendragon.ideasonboard.com>
 <CANiq72=_4vo9eS-sdCY2vPuRN5iSrkbypU061VKN5Qx4VzPCtw@mail.gmail.com>
 <20230818153045.GB13558@pendragon.ideasonboard.com>
 <cb0270b1-c39a-457c-b09f-7b7756e616d5@sirena.org.uk>
 <20230818171715.GA31744@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4CoWzaiLP2VOOezm"
Content-Disposition: inline
In-Reply-To: <20230818171715.GA31744@pendragon.ideasonboard.com>
X-Cookie: Your aim is high and to the right.


--4CoWzaiLP2VOOezm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 18, 2023 at 08:17:15PM +0300, Laurent Pinchart wrote:
> On Fri, Aug 18, 2023 at 05:23:09PM +0100, Mark Brown wrote:

> > I have a bunch of template mails like that too.  One of them includes a
> > general suggestion to fix issues from existing reviews, including bot
> > output.

> Do you have any automated way to send some of those mails, or is it
> always manual ?

It's manual, but it's so quick it's not worth automating further - with
vi it's just:

	:r <template-dir>/<file>

with tab completion, and I can edit if I'm so moved.

--4CoWzaiLP2VOOezm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTfsckACgkQJNaLcl1U
h9DiFQf+KEBsqH9uAqQhfl7+0bEP81MGUyk4gOcpDILbFtqkVWOotb6X7V0Z8aYw
peVL9OYjpTF2QTIeoFyOse07I5QchM0q60dT4DnUG6H63322Q3E0O5IrqdpPRg0R
8tEnkrbIH3eAp42VBtDJaeQHYYSd+avRaCFHn0fbh1X9sinCKPLT6iF73FCUzVKh
XNB0iAfep8UczXbLa33jGWDFDgDIT6mTzlNHTeqY3C00Nyt3wwoG+QxIaCg/EhqP
spypvx/eTW/IgYU4k+VEyzon0xwGB9dFopsTh2vZBRSDlkycON5DUcPmTSMvdBKC
pxf9iKdmAoTY/DDFKUzwotLSi7T2nw==
=EqXq
-----END PGP SIGNATURE-----

--4CoWzaiLP2VOOezm--

