Return-Path: <ksummit+bounces-1023-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E020781038
	for <lists@lfdr.de>; Fri, 18 Aug 2023 18:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEB312823B8
	for <lists@lfdr.de>; Fri, 18 Aug 2023 16:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D8719BC7;
	Fri, 18 Aug 2023 16:23:16 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19F0198BD
	for <ksummit@lists.linux.dev>; Fri, 18 Aug 2023 16:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C808C433C7;
	Fri, 18 Aug 2023 16:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692375794;
	bh=nJaNVL9ebQPPlr+23rlU4YcAiBFq0DtZ1TWQ3lqRYsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mx2yNJWY7FRkCfWd9UsBMvJbMOOxLcIFJNp/z6b0YXbUmAoHzPQuopqXn4d65Y/+X
	 WdnFzfmBPtM53G4HqD/rBJgm6nM0p9Rr0pZpf4wy4ZhtsKE788+y474DH19YoPXSer
	 +HlgK/Nk8Bth+39e8UAwXBvosoXB2eD0mDkj8ryAsjS6Hww5XDS7b7spQ6pVTm9lzo
	 xUYnvjCmUeB+Nx/qXSbv680SW2Z3C1acKOPHQB13c3Z7utguQtNCdVlP4Ui3mr0N3i
	 GtD0be1t4cZ3xq23MPawk0RrMb48swwALtlse1EnRL/J1MZFlihEHig3NEGdU2Zuep
	 Qiml8oLVCrbEQ==
Date: Fri, 18 Aug 2023 17:23:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev,
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <cb0270b1-c39a-457c-b09f-7b7756e616d5@sirena.org.uk>
References: <20230816180808.GB2919664@perftesting>
 <ZN0uNrpD8JUtihQE@bombadil.infradead.org>
 <87ttsx98ue.fsf@intel.com>
 <f7915398-b59a-4c9c-97c1-669be7471ec2@sirena.org.uk>
 <20230817124255.GI21668@pendragon.ideasonboard.com>
 <CANiq72m73vvbCLaRUkPVBfE6e+7FOYjBqd-EBJaLW-geukB2dA@mail.gmail.com>
 <20230817150336.GJ21668@pendragon.ideasonboard.com>
 <CANiq72=_4vo9eS-sdCY2vPuRN5iSrkbypU061VKN5Qx4VzPCtw@mail.gmail.com>
 <20230818153045.GB13558@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UuXDQ+ZoV3gM6LTE"
Content-Disposition: inline
In-Reply-To: <20230818153045.GB13558@pendragon.ideasonboard.com>
X-Cookie: Your aim is high and to the right.


--UuXDQ+ZoV3gM6LTE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 18, 2023 at 06:30:45PM +0300, Laurent Pinchart wrote:
> On Thu, Aug 17, 2023 at 07:41:43PM +0200, Miguel Ojeda wrote:

> > No, it does not. The point is that you don't need to point out trivial
> > mistakes anymore, nor devote time to find them.

> > Just by judging the length of the bot's reply and the importance of
> > the spotted issues, you can make an assessment.

> But you'll still need to reply to the submitter to tell what to expect.
> As far as I understand, this was considered enough of an issue by Greg
> to be automated to remove even the human need to push a button, see
> https://github.com/gregkh/gregkh-linux/blob/master/forms/patch_bot.

I have a bunch of template mails like that too.  One of them includes a
general suggestion to fix issues from existing reviews, including bot
output.

--UuXDQ+ZoV3gM6LTE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTfmuwACgkQJNaLcl1U
h9C1Hwf/VF26JPztqtdpJqbBvjrJ/QImTq/VJEHJmvaYd66QHta8yjxF1xtHanNF
qXaIbqV1W0obJsrBEdFQYQ3JWRQZxxeW8tr9tAZ85OyIBjlep/yIdUOcVNXJBSpj
nVP6JpYScWe4xZOkbgR/rLc9NZR8qfC5tC7bwy9iJcO+dOyLr3NmwJ3YHmxf6pjn
iZQoCZOPyZYwbw56/aTwM/tDNGiPRW+Kd9pQNIi1wy4XjhBIrO2MjQTAYJ/jCfUj
5yq0AMA7Fvuzo86C8MqogA5dZHzqu9A5jfa7NqVNCTipor7RNznjXGvUAsih/ONf
7xKPwYiCM04yit2q97hZbLvx7Zceng==
=P0Xb
-----END PGP SIGNATURE-----

--UuXDQ+ZoV3gM6LTE--

