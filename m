Return-Path: <ksummit+bounces-216-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4993ACF99
	for <lists@lfdr.de>; Fri, 18 Jun 2021 17:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 83F9C3E10C4
	for <lists@lfdr.de>; Fri, 18 Jun 2021 15:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DD9C2FB0;
	Fri, 18 Jun 2021 15:58:52 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBFB72
	for <ksummit@lists.linux.dev>; Fri, 18 Jun 2021 15:58:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6F87861003;
	Fri, 18 Jun 2021 15:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624031930;
	bh=Apapoa0ogz+j1ETylMG/djv0vpJmf2hXxs1HUu5smKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nmXkOJh0glyvoe4C3vhRq3VOaXh+UE85KdrCTJQPn5GFT9bi2pzzFSTtrQ1Htls4G
	 nCSKDUlUvVfV8YpvZ74Y0DeLcMOsHfeLD1+y6XqT5hzwDaIgbiUz47IXs63v5hzt+O
	 HW61APQCAyu9w9EaIF+OnK5LNLTYeUYdiMVK3Ensr6OO4TnZvMIFkov8vJ78pJtOzR
	 y9rbKsii9bfXNnh3cxgbfmHazh4sn5pAeqXsCcYRq9BSJ/t6jkJG69JlQNKxkzt3RF
	 qJ/3J/VvIoqV9DFd7bO2MiuYoq5XNMEo8SoZ6vB/ZsVNSCUr6QGdJROF9Bb0FrKRCx
	 QSK17KzLVHKuQ==
Date: Fri, 18 Jun 2021 16:58:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	"Enrico Weigelt, metux IT consult" <lkml@metux.net>,
	David Hildenbrand <david@redhat.com>, Greg KH <greg@kroah.com>,
	Christoph Lameter <cl@gentwo.de>, Theodore Ts'o <tytso@mit.edu>,
	Jiri Kosina <jikos@kernel.org>, ksummit@lists.linux.dev,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-block@vger.kernel.org,
	Linux FS Devel <linux-fsdevel@vger.kernel.org>,
	Linux MM <linux-mm@kvack.org>, netdev <netdev@vger.kernel.org>,
	Linux-Arch <linux-arch@vger.kernel.org>,
	Linux API <linux-api@vger.kernel.org>
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
Message-ID: <20210618155829.GD4920@sirena.org.uk>
Mail-Followup-To: Steven Rostedt <rostedt@goodmis.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	"Enrico Weigelt, metux IT consult" <lkml@metux.net>,
	David Hildenbrand <david@redhat.com>, Greg KH <greg@kroah.com>,
	Christoph Lameter <cl@gentwo.de>, Theodore Ts'o <tytso@mit.edu>,
	Jiri Kosina <jikos@kernel.org>, ksummit@lists.linux.dev,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-block@vger.kernel.org,
	Linux FS Devel <linux-fsdevel@vger.kernel.org>,
	Linux MM <linux-mm@kvack.org>, netdev <netdev@vger.kernel.org>,
	Linux-Arch <linux-arch@vger.kernel.org>,
	Linux API <linux-api@vger.kernel.org>
References: <b32c8672-06ee-bf68-7963-10aeabc0596c@redhat.com>
 <5038827c-463f-232d-4dec-da56c71089bd@metux.net>
 <20210610182318.jrxe3avfhkqq7xqn@nitro.local>
 <YMJcdbRaQYAgI9ER@pendragon.ideasonboard.com>
 <20210610152633.7e4a7304@oasis.local.home>
 <37e8d1a5-7c32-8e77-bb05-f851c87a1004@linuxfoundation.org>
 <YMyjryXiAfKgS6BY@pendragon.ideasonboard.com>
 <cd7ffbe516255c30faab7a3ee3ee48f32e9aa797.camel@HansenPartnership.com>
 <CAMuHMdVcNfDvpPXHSkdL3VuLXCX5m=M_AQF-P8ZajSdXt8NdQg@mail.gmail.com>
 <20210618103214.0df292ec@oasis.local.home>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KdquIMZPjGJQvRdI"
Content-Disposition: inline
In-Reply-To: <20210618103214.0df292ec@oasis.local.home>
X-Cookie: Are you a turtle?
User-Agent: Mutt/1.10.1 (2018-07-13)


--KdquIMZPjGJQvRdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 18, 2021 at 10:32:14AM -0400, Steven Rostedt wrote:
> On Fri, 18 Jun 2021 16:28:02 +0200
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> > What about letting people use the personal mic they're already
> > carrying, i.e. a phone?

> Interesting idea.

> I wonder how well that would work in practice. Are all phones good
> enough to prevent echo?

Unless you get the latency for the WebRTC<->in room speaker down lower
than I'd expect it to be I'd expect echo cancellation to have fun,
though beam forming might reject a lot of in room noise including that -
higher end modern phones are astonishingly good at this stuff.  I'd not
trust it to work reliably for all attendees though, it's the sort of
thing where you'll get lots of per device variation.

--KdquIMZPjGJQvRdI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDMwqUACgkQJNaLcl1U
h9Cg1Af5ARxVAXKtGlzoOtDRp3GzESJ+QAXYphyxV7cPGNDckB/qsv28tntr04Bn
1QJeSujCWn3PVGGTr/AKgLgUIiicysbjbiz2MDuyKmSl/pjhJLGaKNvLb4jH14tp
My3o3TUioxhdXmwiQAbMuEvfVVJAoccMhpLcF3DfgKGaCfuaeZ7Jrc5miAQsXqbB
LNgM3ist9ZldXeiemRo41yZ3gQ1qwEadxhRM184rmjcvd4Xl7IyItX85s1CSwvr4
Bi493dDbTQA3n0kb2bPD0yez6pq0xu2dGDyGTALno6HfjNA/PCxROQRgg/cQ7LUK
U7mM4yBMrM2+z+akydMtX9us4TX2+g==
=mrCm
-----END PGP SIGNATURE-----

--KdquIMZPjGJQvRdI--

