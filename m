Return-Path: <ksummit+bounces-285-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC33E3BE7BC
	for <lists@lfdr.de>; Wed,  7 Jul 2021 14:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id C07BA1C0D08
	for <lists@lfdr.de>; Wed,  7 Jul 2021 12:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC1E82FAD;
	Wed,  7 Jul 2021 12:20:30 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com [64.147.123.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC47272
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 12:20:29 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailnew.west.internal (Postfix) with ESMTP id 749C02B00839;
	Wed,  7 Jul 2021 08:20:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 07 Jul 2021 08:20:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=yMDslIW+ehibzfwgZ4z3Q0QM0LY
	caJICvDkML1cvM1Y=; b=bY4yzpKfJhCGpqXcti3wczTGmmf7ayYuetxJwpnXnB2
	YAnr0EcOJg9zM9taBTc2nD1R8JiFYfjL36YlQA5v/SDgaohbS0Icu5ydssvd+tb0
	OMFdq/tdtLKzLx5QbQVCIEnUm4DC6hUUSxzW+ybnYi1+tMMLd+F1EmY/HYCS4n5v
	+5aFNWA4wQwUDHyNc8KYi9oF+oK5KWpdyeq393VZsokcdt02cZLBalc04L3oPwqS
	5pJcKb5jpIP/Cn4SkHBFkD63OzmgW/qH8/Ox0nDFNg4OE1R7o0s9gvStaqDqgYw+
	gHrQSbueVPS5rKNlY5sKKm7/+fLNnXcJKdqAXs4J3Hg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=yMDslI
	W+ehibzfwgZ4z3Q0QM0LYcaJICvDkML1cvM1Y=; b=u/KtRepoBxr6TWPXdZ0Sj2
	lik0EMTHKtVyfsaSuTIW/Uyqux1Chi+sQNh9thrAxmC9jm/NPoBrY9Iwaq3seLT2
	17MMe3vnqbd7OZJ4TdvAuyrvGl9eBaBpF9YY7ybhpoTtetDSOG8RXIl5EuufqHAb
	swjImKMFwuAk40Lc3+cTKiZa0oJYftyZ1PUtyb8L6UenFDe8BRQxpGq44YS22I53
	3XIuC5BXImd0+0w4Y/0vnpA8BLgdPpK3mmDtGQrUxla1ncVbWApcYGh8KJeA18mT
	lf/IgLQR7etcPi69VeGnoC4Qvj5NKrY96WRTjxkeu7f7xaHr/gRr8N0cHi6JqLXA
	==
X-ME-Sender: <xms:C5zlYK1vX4CuFPoMqDmLYUXex9G_CVy2lekUUCqpbEOScVEdLpPKVQ>
    <xme:C5zlYNEWaqhG5QEyNSUvvZ1Aw11syqQVytjnhAnNVOr-vXe4H88zdxSJTYenCtupo
    0XGyKM62lzEDA>
X-ME-Received: <xmr:C5zlYC7Vt0NDhplcuGNQ4D3ntqTi-A1dq-hd12I1STwVngboRiCDYL9UIsLfIbjVT6Rv-F4nIy0eAy_uZs51QBcpQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhm
X-ME-Proxy: <xmx:C5zlYL2EGK5lyRi9q7AeMStEhvPYfKyFzob26ianWn4BG2mzjr1-4g>
    <xmx:C5zlYNEWMqhSeYjN9MdTgpBrQ6hZbJVghAjn_Y1wk78NyMESxauwyQ>
    <xmx:C5zlYE8ZZmXHQyk7dJOfbiGl3rhDOcVYwG_Ac6dO5-QfXPf4WAYLAw>
    <xmx:DJzlYF___19W-150bJ8Tne_X5Da61OGGooaeVIGjuN5W438ijH8mUcxlJrw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 08:20:27 -0400 (EDT)
Date: Wed, 7 Jul 2021 14:20:24 +0200
From: Greg KH <greg@kroah.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Roland Dreier <roland@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOWcCG9Pm/S+EXFw@kroah.com>
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
 <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
 <20210707105000.GA4394@sirena.org.uk>
 <c24c61f498f43f589eafd423e51f997134d198b7.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c24c61f498f43f589eafd423e51f997134d198b7.camel@HansenPartnership.com>

On Wed, Jul 07, 2021 at 12:34:31PM +0100, James Bottomley wrote:
> On Wed, 2021-07-07 at 11:50 +0100, Mark Brown wrote:
> > On Tue, Jul 06, 2021 at 10:36:14PM +0200, Linus Walleij wrote:
> > > On Tue, Jul 6, 2021 at 10:00 PM Roland Dreier <roland@kernel.org>
> > > wrote:
> > > > "devres" / devm_xxx was an attempt to deal with this in C, but it
> > > > only solves some cases of this and has not received a lot of
> > > > adoption (we can argue about the reasons).
> > >  
> > > Really? From my point of view that is adopted all over the map.
> > > I add new users all the time and use it as much as I can when
> > > writing new drivers.
> > 
> > Yes, it's *super* widely used in most of the kernel.  Perhaps there's
> > some subsystems that reject it for some reason.
> > 
> > > I think it's a formidable success, people just need to learn to do
> > > it more.
> > 
> > There *are* issues with people adopting it too enthusiastically - as
> > well as the memory lifetime issues that Laurent mentioned it's easy
> > for it to cause problems with interrupt handlers that are left live
> > longer than they should be and try to use things that were already
> > deallocated.
> 
> Fixing this should not be beyond the wit of humankind, though.  If we
> delayed deallocation to module release, that would fix the interrupt
> issue, wouldn't it?  Perhaps all devres memory for devices should live
> until then anyway and thus be automatically deallocated instead of
> needing an explicit free ... the problem with that being compiled in
> devices currently optimize away the module refcounting, but that should
> be fixable.

module code lifespans are different than device structure lifespans,
it's when people get them confused, as here, that we have problems.

thanks,

greg k-h

