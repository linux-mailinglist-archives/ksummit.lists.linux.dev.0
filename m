Return-Path: <ksummit+bounces-287-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E933BE82C
	for <lists@lfdr.de>; Wed,  7 Jul 2021 14:45:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id B86C63E0FE9
	for <lists@lfdr.de>; Wed,  7 Jul 2021 12:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AAA92FAD;
	Wed,  7 Jul 2021 12:45:09 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com [64.147.123.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F7C177
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 12:45:08 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailnew.west.internal (Postfix) with ESMTP id E7E822B008E3;
	Wed,  7 Jul 2021 08:45:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 07 Jul 2021 08:45:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=dwGJ+I0BrvFTVbVcEddp4kgIsaM
	SqS/87Nvt6RISEqg=; b=PDo2WaXxPCxAV9Pidsocln/oY3R0m1Rg8kWnWgiM/D6
	YLgiJJWxC8HVApFxVjQk/gmoVYqhDYmeDMSjVfkWRJfQGHp5ed9FLt2pSdE+CLxt
	KOv1h4AhhZWprExDBotdGN4hs/Ksc4aJtXb00KPxn5/fP+nFEoz2mKvfufpt7N5f
	ipuYfLOQl3WwcZnNwrk/rOYCSmxChJzayH+SFOplWqN4wGBYoeGaemSAFnXuG0Re
	KYppmC3cpilCZkxjy5j5P81SKmEnTP9U1ijXk3Ea7NTpvkhfCifvplpZy9S6fo6R
	yzGb60d6eV/wpOy+68MOX7pkihf6ERaD4lh3+KzWwzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=dwGJ+I
	0BrvFTVbVcEddp4kgIsaMSqS/87Nvt6RISEqg=; b=KGWjppINqmeL909rUWk4AQ
	12tr0RXIwdXQD0kBlIFMb4waf5bg5rb19XhZQBvQ8L7PXuIDqGgWtpMPJv1qsDqs
	Bo9WNNGd7KfIT924UBj4V1bqvJGk0E/r2PW4/hSzadvRN/vlEVHxyQTupwnYDq6Z
	ayGfvb4NPuFSZy2v7E8FAX7UDvSXo69/hSwPM9PMQSwfsHvtNPureDqHcacB89XF
	QmtrqH/fepOkBBfmwWJhl8FRbpskIjt99/DZ24TZNp9yR+2izJnDxqaGBJ8qsD/Q
	PXNDP2VNyGvzeZEFn0xCTckaEXSCev36qpwuPmWeIEQV2Bk5fpD6QhCGo1fvEUnQ
	==
X-ME-Sender: <xms:0qHlYG-ecuiTNlMHMIRr70pKM_NIYfoeqS4GvHb2XBhZTulfWdrsfw>
    <xme:0qHlYGtLb4u26vuqmlWGHOZCC-U-xxx3VBKJF8Iw-OUqgmC1-8U7fn4Jt8gQ3cQcm
    _0f4sydvF09Wg>
X-ME-Received: <xmr:0qHlYMCWKaTd8Mu9hQM4MEmQoVau0dws3y0sQIt0bRL22aSznj3pW8l2n9XzhJuGS8UTSMB_TMpANwz0TtnyX1kknQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhm
X-ME-Proxy: <xmx:0qHlYOcbCQG5MLpuaRpnmsrO0OQ49sMl0OaWLIKP0b2SSVedRIsieA>
    <xmx:0qHlYLMvKudf0Az0yXXIvNTy77Uj4W_ENNevLBfin4DPdLJ3aCpKxQ>
    <xmx:0qHlYIm9uweSktrSiUKgpkh7xQib6cDIShpJPnEGZMEvxEe3poL7vA>
    <xmx:0qHlYMEUmFOvNx3G9DuNqWtTUFqDSLGEWUuCGxNLqWtQCDCMRhMAvWbq3Ls>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 08:45:05 -0400 (EDT)
Date: Wed, 7 Jul 2021 14:45:04 +0200
From: Greg KH <greg@kroah.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Roland Dreier <roland@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOWh0Dq+2v+wH3B4@kroah.com>
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
 <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
 <20210707105000.GA4394@sirena.org.uk>
 <c24c61f498f43f589eafd423e51f997134d198b7.camel@HansenPartnership.com>
 <YOWcCG9Pm/S+EXFw@kroah.com>
 <11c07bc291b443c2683a2baff5b180ff5b0729a5.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11c07bc291b443c2683a2baff5b180ff5b0729a5.camel@HansenPartnership.com>

On Wed, Jul 07, 2021 at 01:38:44PM +0100, James Bottomley wrote:
> On Wed, 2021-07-07 at 14:20 +0200, Greg KH wrote:
> > On Wed, Jul 07, 2021 at 12:34:31PM +0100, James Bottomley wrote:
> > > On Wed, 2021-07-07 at 11:50 +0100, Mark Brown wrote:
> > > > On Tue, Jul 06, 2021 at 10:36:14PM +0200, Linus Walleij wrote:
> > > > > On Tue, Jul 6, 2021 at 10:00 PM Roland Dreier <
> > > > > roland@kernel.org>
> > > > > wrote:
> > > > > > "devres" / devm_xxx was an attempt to deal with this in C,
> > > > > > but it only solves some cases of this and has not received a
> > > > > > lot of adoption (we can argue about the reasons).
> > > > >  
> > > > > Really? From my point of view that is adopted all over the map.
> > > > > I add new users all the time and use it as much as I can when
> > > > > writing new drivers.
> > > > 
> > > > Yes, it's *super* widely used in most of the kernel.  Perhaps
> > > > there's some subsystems that reject it for some reason.
> > > > 
> > > > > I think it's a formidable success, people just need to learn to
> > > > > do it more.
> > > > 
> > > > There *are* issues with people adopting it too enthusiastically -
> > > > as well as the memory lifetime issues that Laurent mentioned it's
> > > > easy for it to cause problems with interrupt handlers that are
> > > > left live longer than they should be and try to use things that
> > > > were already deallocated.
> > > 
> > > Fixing this should not be beyond the wit of humankind, though.  If
> > > we delayed deallocation to module release, that would fix the
> > > interrupt issue, wouldn't it?  Perhaps all devres memory for
> > > devices should live until then anyway and thus be automatically
> > > deallocated instead of needing an explicit free ... the problem
> > > with that being compiled in devices currently optimize away the
> > > module refcounting, but that should be fixable.
> > 
> > module code lifespans are different than device structure lifespans,
> > it's when people get them confused, as here, that we have problems.
> 
> I'm not claiming they are.  What I am claiming is that module lifetime
> must always encompass the device lifetimes.  Therefore, you can never
> be incorrect by using a module lifetime for anything attached to a
> device, just inefficient for using memory longer than potentially
> needed.  However, in a lot of use cases, the device is created on
> module init and destroyed on module exit, so the inefficiency is barely
> noticeable.

In almost no use case is the device created on module init of a driver.
devices are created by busses, look at the USB code as an example.  The
usb bus creates the devices and then individual modules bind to that
device as needed.  If the device is removed from the system, wonderful,
the device is unbound, but the module is still loaded.  So if you really
wanted to, with your change, just do a insert/remove of a USB device a
few zillion times and then memory is all gone :(

> The question I'm asking is shouldn't we optimize for this?

No.

> so let people allocate devm memory safe in the knowledge it will be
> freed on module release?

No, see above.  Modules are never removed in a normal system.  devices
are.

And the drm developers have done great work in unwinding some of these
types of mistakes in their drivers, let's not go backwards please.

thanks,

greg k-h

