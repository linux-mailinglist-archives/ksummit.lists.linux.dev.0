Return-Path: <ksummit+bounces-1440-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9539329D6
	for <lists@lfdr.de>; Tue, 16 Jul 2024 17:01:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0D1E1C22657
	for <lists@lfdr.de>; Tue, 16 Jul 2024 15:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34BF19EEA4;
	Tue, 16 Jul 2024 15:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SNEu2xEb"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588B619E809
	for <ksummit@lists.linux.dev>; Tue, 16 Jul 2024 15:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721142034; cv=none; b=B5HHHv1bs8rLo7+YnS9JvxxJx4xG7NjTnpIs5ZIQziYdlmVIcn7LXUi5J2vloecKiTKerPsYI/KMRdiGJzVmiZ+ykNHJ25kSJjMOD+sPlAkYEqk2MD/rxCGd4IcDdFIZ49cAnJIvR5jJdXSIMZYSRV2QdqTQJDLvb7gbBfp5ypU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721142034; c=relaxed/simple;
	bh=jfxrQRobkZ43OJAo5FHl0s672Ylghg8+wlvpyI31qmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKdADFr1tVusK3kpc2F20zoVbEi015OxynNsZU0eUitzuELvQhRPyUouKQ3zjd9A36VVx41H5BAIOe6womKEQkYTugfcMCV08dWM0iakRQ7pe6PfFTd/SQphE7S4mkP7H31jqeVbaHux+p66Og6+CUMkFGoGVhtMEFqRn9R8g20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SNEu2xEb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51EE2C116B1;
	Tue, 16 Jul 2024 15:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721142033;
	bh=jfxrQRobkZ43OJAo5FHl0s672Ylghg8+wlvpyI31qmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SNEu2xEb5dfa9sQvADaZftJuj3qVc+90SAUmW/M/i76N8Xc+DwlPqKjk6N1+vcrSy
	 gzezwN04QVLzLAVuCiUemF6llzoCHDRg28Z3CIpPa2YjsR9jWq8tAQLuePRCXJreC2
	 NI9yen79MT2KhOkwQu5lAkjxpXOxrEpP32Hml2JUhXVVP8kdaTFhvnGC6QG3ch4j00
	 /itQUpNQLcjJuygGGQCLiFuxe8CNzEgn3sAFf9emaDq7CL+ROconTOafy6FSRiah27
	 4l6qkEMmi2BIMurHoqkeRei1kKBpguwlY+6JKY7o/q9DDaDeaLV90SCGZfiBuL2cop
	 5LH3lDNLsGUBw==
Date: Tue, 16 Jul 2024 16:00:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <b7e8227c-965d-4f0d-8d55-2f5af1c9d438@sirena.org.uk>
References: <ZpQ0soWV6zIpgigf@sashalap>
 <0e6c7c8ed259dcb50631c6fdc3d86d3080bdc6f3.camel@HansenPartnership.com>
 <CAHk-=wjLShGxeGtjRGkjQni+VzWC0yrf34EP0AUn+_zU0u-WeQ@mail.gmail.com>
 <2024071528-cahoots-reacquire-9eab@gregkh>
 <3a357a63f67f3e6aff5e6d020d40b51fa24e0280.camel@linux.ibm.com>
 <ef31a7c7546ef232665760aac98c8d7f20060bcc.camel@linux.ibm.com>
 <202407151434198c3715e9@mail.local>
 <2024071515-zestfully-womankind-1901@gregkh>
 <8a0d05e1-71be-445e-afcf-4764149ea60a@sirena.org.uk>
 <2024071612-bauble-handset-93de@gregkh>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Jo42S7W1dJs1O283"
Content-Disposition: inline
In-Reply-To: <2024071612-bauble-handset-93de@gregkh>
X-Cookie: Think honk if you're a telepath.


--Jo42S7W1dJs1O283
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 16, 2024 at 08:25:34AM +0200, Greg KH wrote:
> On Mon, Jul 15, 2024 at 07:04:34PM +0100, Mark Brown wrote:

> > FWIW as we've discussed before I stopped adding explicit CCs for the
> > most part since AUTOSEL is picking up far more than I ever would so it
> > doesn't seem worth the effort to filter which is a variation on what
> > Alexandre mentioned.

> If you want to, we can add your subsystems to the "do not run AUTOSEL or
> Fixes:" list and then you can just mark whatever you feel is needed for
> stable directly.  We already do that for many other subsystems (kvm, mm,
> xfs, and others), just let us know and we will be glad to do so as it
> reduces our load AND it lets you be in control of what is in stable.

Given that other bits of the stable tree are going with the looser
approach anyway it doesn't seem worth it to apply more filtering.

--Jo42S7W1dJs1O283
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaWiwwACgkQJNaLcl1U
h9Bi5Af9Fz8V6oajE9sHkyNcooCJLL1ay/5IbUjzv2Vzcs0/lbVShKC+wSC7AKB8
eXB9Hsmy8h0H+8MccLXITa6yvT0hcXS9FblsHW05zR/DhvADZq0Cjg9+fx1BPjnP
n4ckWjD3+WLTykvVAjLk8qTXeFKoJxMrw2auHqFpqj6auOgJrL8FaE3foPknPEah
GgePsloLpaN0+RlkePp7RwpG/b0gYZQcbixbd8DtwnAf5wn+v6yJOfza6LfPMLA+
8Qa97fmCIm/Yvs0+gxn+8lEncVwMRZCvHP+k9Yl+Eu3omOnutKSdxqXI09D2xWlH
WHcLrElIglVO+446Go+v/0fIEVGzxg==
=61s8
-----END PGP SIGNATURE-----

--Jo42S7W1dJs1O283--

