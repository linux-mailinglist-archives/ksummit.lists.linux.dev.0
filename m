Return-Path: <ksummit+bounces-279-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB763BE3DC
	for <lists@lfdr.de>; Wed,  7 Jul 2021 09:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id DDB7F3E1017
	for <lists@lfdr.de>; Wed,  7 Jul 2021 07:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C12D2FAD;
	Wed,  7 Jul 2021 07:45:59 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EF270
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 07:45:57 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailnew.nyi.internal (Postfix) with ESMTP id 1764E580799;
	Wed,  7 Jul 2021 03:45:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 07 Jul 2021 03:45:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=O5pc4E+evfL2nE14Clj5GKThSZ3
	zVOPRmw9USZNC7Os=; b=pK6j4VgI8jjQ5aa8Y1d8OwpGjWtSEqdFY6aCFC0tXUd
	kB+VTt6gBdYPSyxUkyDBPOCuZWyPljMd+nZrn8im4Xg9WLKmVj15qhzCHtkP3T+0
	OAcp9dJjjBPUn6klNmDQt7GGkDO5IXrF6OmpYbD59Os1KqeUwJ0T0rs349+o5/WA
	61zUAFovZg71VhgDdd/njykrcB21PoTJahe0UolKd0UiEvqMyN85yxibkO4ooSTO
	fk9fqEdw35K4nbzKDfdDBbFtBAaAHpVZXMFFdvHDmqvkHjTIdxuXAQ9HrObDi4sv
	I7uJG7BkBofvKGBAf0zkugOIVead5Q+q7QAev+yqheA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=O5pc4E
	+evfL2nE14Clj5GKThSZ3zVOPRmw9USZNC7Os=; b=a3ogm2O3JHoVZOm6dyEo98
	p6EZki01dM/xH8CHRaX2oNTRYJgLlacsMsBhHzDkQBL1h000yCALF71cQ446Wssc
	h4gzVbAda5IcBkn11/oUcoiUM30MX0RNKLJr13Hzk+0Hp0FgL+9SGflJfoe0ngsb
	UE7+kBpASDQFKXH0G7TYx8zdaUDJQIbFtTYL0SPkp8+7wzD86xr8cfxwVAoNSBsz
	YPOZGTr8zLpjyWxlb/6CXZRO0vN25Qwr1DI3Jl0D2T4Rihula0+iIleRI/6LX2MJ
	lDsS1s9A0ohcRt6TjxuRPG5WWcOxmrFFCoWF6s6IlXUfDNueBf55Z4Bk4/dGK0uA
	==
X-ME-Sender: <xms:tFvlYPyhXRGL3SovNB6GAfmUyFuzoQXBC1QIIxvS8XCDKXSu2BzqtQ>
    <xme:tFvlYHR8rKiEZSK2QVzOpciBbQSm-FzLrWlGDFCBlKuThLUDc9e8_3XntAwEUsjLN
    uHQADS7F4rerg>
X-ME-Received: <xmr:tFvlYJWNkROhMEnBhtZX7PtUcL5PuCfON7IF4HSUqr5e6X2GDfAln04gqdJce7tSdwouvH0_ye9cQPNVqq9CRjMe2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddugdelfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhm
X-ME-Proxy: <xmx:tFvlYJiSbBoxUiqKxWOO6bEEFwwdp96JnuacSha7DAnZMyYWg5KZqA>
    <xmx:tFvlYBC_Uvzazf_Av1aNtyuc2U2thzpEIRr9i_qbjNFuCQ9xHXDIzA>
    <xmx:tFvlYCJWikqtNQue3xTCoWGfZPwOo3T7UNh3tSoq4JoBPK6w6L0ijg>
    <xmx:tVvlYF41J9pfxZBtUfp6Ku9y7U4dACTTFXxOQV8-fTUi1VLGhBADrQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 03:45:56 -0400 (EDT)
Date: Wed, 7 Jul 2021 09:45:53 +0200
From: Greg KH <greg@kroah.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Roland Dreier <roland@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOVbsS9evoCx0isz@kroah.com>
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
 <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
 <YOTSYy2J2COzOY9l@pendragon.ideasonboard.com>
 <alpine.DEB.2.22.394.2107070926370.6285@hadrien>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2107070926370.6285@hadrien>

On Wed, Jul 07, 2021 at 09:27:32AM +0200, Julia Lawall wrote:
> 
> 
> On Wed, 7 Jul 2021, Laurent Pinchart wrote:
> 
> > On Tue, Jul 06, 2021 at 10:36:14PM +0200, Linus Walleij wrote:
> > > On Tue, Jul 6, 2021 at 10:00 PM Roland Dreier wrote:
> > >
> > > > One area I see where Rust could make a big improvement for drivers is
> > > > in using RAII for error paths.  Drivers often have a lot of code like
> > > >
> > > >     if (something())
> > > >         return err;
> > > >
> > > >     if (something_else())
> > > >         goto undo_something;
> > > >
> > > >     if (a_third_thing())
> > > >         goto undo_two_things;
> > > >
> > > > and so on, which is difficult to get right in the first place and even
> > > > harder to keep correct in the face of changes.
> > >
> > > Yes.
> > >
> > > > "devres" / devm_xxx was an attempt to deal with this in C, but it only
> > > > solves some cases of this and has not received a lot of adoption (we
> > > > can argue about the reasons).
> > >
> > > Really? From my point of view that is adopted all over the map.
> > > I add new users all the time and use it as much as I can when
> > > writing new drivers.
> > >
> > > $ git grep devm_  | wc -l
> > > 26112
> > >
> > > Dmitry in the input subsystem even insist to use it for e.g. powering
> > > down and disabling regulators on remove(), like recently in
> > > drivers/input/touchscreen/cy8ctma140.c
> > >
> > > /* Called from the registered devm action */
> > > static void cy8ctma140_power_off_action(void *d)
> > > {
> > >         struct cy8ctma140 *ts = d;
> > >
> > >         cy8ctma140_power_down(ts);
> > > }
> > > (...)
> > > error = devm_add_action_or_reset(dev, cy8ctma140_power_off_action, ts);
> > > if (error) {
> > >         dev_err(dev, "failed to install power off handler\n");
> > >         return error;
> > > }
> > >
> > > I think it's a formidable success, people just need to learn to do it more.
> >
> > devres is interesting and has good use cases, but the devm_k*alloc() are
> > a nightmare. They're used through drivers without any consideration of
> > life time management of the allocated memory, to allocate data
> > structures that can be accessed in userspace-controlled code paths.
> > Open a device node, keep it open, unplug the device, close the device
> > node, and in many cases you'll find that the kernel can crash :-( When
> > the first line of the probe function of a driver that exposes a chardev
> > if a devm_kzalloc(), it's usually a sign that something is wrong.
> 
> Where should the free have been?  Will Rust help in this case?  Will it
> result in a memory leak?

This is going to be the "interesting" part of the rust work, where it
has to figure out how to map the reference counted objects that we
currently have in the driver model across to rust-controlled objects and
keep everything in sync properly.

For the normal code, the fact that the memory was assigned to one
specific object (the struct device) but yet referenced from another
object (the cdev).  devm_* users like this do not seem to realize there
are two separate object lifecycles happening here as the interactions
are subtle at times.

I am looking forward to how the rust implementation is going to handle
all of this as I have no idea.

thanks,

greg k-h

