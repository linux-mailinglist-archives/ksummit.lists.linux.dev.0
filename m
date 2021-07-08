Return-Path: <ksummit+bounces-354-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 470583C1967
	for <lists@lfdr.de>; Thu,  8 Jul 2021 20:51:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 52EBF1C0631
	for <lists@lfdr.de>; Thu,  8 Jul 2021 18:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB742F80;
	Thu,  8 Jul 2021 18:51:30 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EE4168
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 18:51:29 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailnew.nyi.internal (Postfix) with ESMTP id 4F6585803B3;
	Thu,  8 Jul 2021 14:51:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 08 Jul 2021 14:51:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=nRr6QCSvLeCuMjbhLGTtEBH8m+J
	SIrV4q1cTlY0aISk=; b=fkTqC/TFSIT8Sh4PdPcj6Pr6k/DNKgOB6qiGAW1X8Dr
	sob/Xs9sBQdzB9KZjshgRkvyf8u9YIiCPPAMLGJjIp+7psTFtChcABc2xz2uH8eZ
	BYbF5+g7lAD67eXLVAqpU0KD6m3F1I4a+EVIrgmGnY8BpFmxf1mvEHXp1r8s+leT
	mnn5yxQl1QUJvsiKBqjKhbrim/Zx56iFlBzaLvPkCxV3WUhD0mvf/U+VP0OWp8G0
	G7WLt3Y57/VPI++P7CoKWsKRTXAC6gQwxZvxEiIwnhF+6nFsF9/OrSquTPzLSwRU
	JR1X5xg2nFav+9QvdokbvnGgA0WBqxziu+67BHhDQJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=nRr6QC
	SvLeCuMjbhLGTtEBH8m+JSIrV4q1cTlY0aISk=; b=dpB/3O3iva8/2yw2Frtgua
	9YWsuQhBqWQ5kWpoFIA6T1ijpkRKo8PhmhiHTB840ihdOkt1zlOqPS75jXZX1221
	FukKPYG0Zbzl6mXmGbzYCutMsyqzQIh1Z4W1xmsY66iOqv43TWgMvCUwobkTKCpG
	FVahM5HYZhJko9QqnfYHmmwnBKU45zlJgfxD8bSCG1lw75zT7Gmsb81aq9YgWB3l
	vZx4mS7FpBKqzyYEln3II0pYO27yJiqNzszxkOzTgZbmhsxlo5Oud+9wxQVc4fxA
	D9aClqGp0IWB/IYiiZb8kF2//63oW1KITuXtFT/YKgvh7gyq1vL9QfZekxrrrBvQ
	==
X-ME-Sender: <xms:L0nnYNZuTwCCVkR7jRPPQ1Jkp0kR2bJDQ7V4WUQq5pIaav-O4G5V0Q>
    <xme:L0nnYEaRpIhTrrvPHuHaSbwdtcKd_Zdl0jooFSGx_5WUeo1pPbz3NeX0iVadI2nNA
    7JL5oliqDoh3g>
X-ME-Received: <xmr:L0nnYP8Wf6DzQoDoLklxyDRXHTadhZq2iXunxJYCfrhiHKoRzlEZo90DACyaE0260uhkjbWR2XYbSanUeeBNufe2ag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdeggdduvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:L0nnYLpQvR5pQf2Sw-bdSjKXs4LsforIznNwxBN9vM77UiboXCSezA>
    <xmx:L0nnYIo_3iD8nO0W6bDG1xECxAiChyvSROuelt0MwoXUi3-avfAk8A>
    <xmx:L0nnYBSm1WsEYEm57ZYA4u1bRDM8UqqR6-YhoYuSYVD2P-cxk7P2Qw>
    <xmx:MEnnYGbp3fX50KsBuQR7-bgUaOCV1QJPB5cHeGHmrM4bR0qoVLtZ-Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jul 2021 14:51:27 -0400 (EDT)
Date: Thu, 8 Jul 2021 20:51:25 +0200
From: Greg KH <greg@kroah.com>
To: Wedson Almeida Filho <wedsonaf@google.com>
Cc: Jan Kara <jack@suse.cz>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOdJLYmUkoMyszO7@kroah.com>
References: <1f2a62c19845e4602817c2130d47bbea02d04d1d.camel@HansenPartnership.com>
 <CANiq72=qa2jMUKyfPmH1q1jr8n_Tm7FMy0QyWRhhpinUrvMiNA@mail.gmail.com>
 <YOXL6Th+pot9+Fp3@kroah.com>
 <YOXd9WoafgBr1Nkv@google.com>
 <YOXibDV8mHT1e6ec@kroah.com>
 <YOX+N1D7AqmrY+Oa@google.com>
 <20210707203827.GI18396@quack2.suse.cz>
 <YOY0HLj5ld6zHJHU@google.com>
 <YOaW/pR0na5N9GiT@kroah.com>
 <YOb/aJC2VuOcz3YY@google.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YOb/aJC2VuOcz3YY@google.com>

On Thu, Jul 08, 2021 at 02:36:40PM +0100, Wedson Almeida Filho wrote:
> On Thu, Jul 08, 2021 at 08:11:10AM +0200, Greg KH wrote:
> > Thanks for the detailed explainations, it seems rust can "get away" with
> > some things with regards to reference counts that the kernel can not.
> > Userspace has it easy, but note that now that rust is not in userspace,
> > dealing with multiple cpus/threads is going to be interesting for the
> > language.
> >
> > So, along those lines, how are you going to tie rust's reference count
> > logic in with the kernel's reference count logic?  How are you going to
> > handle dentries, inodes, kobjects, devices and the like?  That's the
> > real question that I don't seem to see anyone even starting to answer
> > just yet.
> 
> None of what I described before is specific to userspace, but I understand your
> need to see something more concrete.
> 
> I'll describe what we've done for `task_struct` and how lifetimes, aliasing
> rules, sync & send traits help us achieve zero cost (when compared to C) but
> also gives us safety. The intention here is to show that similar things can (and
> will) be done to other kernel reference-counted objects when we get to them.

<snip loads of good stuff here, thanks for helping describe all of this>


> > And that's the reason some of us are asking to see a "real" driver, as
> > those have to deal with these kernel-controlled-reference-counted
> > objects properly (as well as hardware control).  Seeing how that is
> > going to work in this language is going to be the real sign of if this
> > is even going to be possible or not.
> 
> Here's what I'd like to avoid: spending time on something that you all still
> think is not typical enough. Would you be able to point us to a driver that
> would showcase the interactions you'd like to see so that (once we have it in
> Rust) we can have a discussion about the merits of the language?
> 
> Hopefully something with interesting interactions with the kernel, but not
> with overly complex hardware, that is, something that doesn't require us to read
> a 400-page specification to implement.

Examples were provided in the first series that was submitted a few
months ago.  What was wrong with them?  And really, there is no need to
dig through a huge spec, try porting an existing C driver will be much
easier.

But if you didn't like the previous examples (nvme block driver, i2c
driver, gpio driver), how about looking at the drivers used by your
current desktop and picking something that you use today that actually
talks to hardware?

We just want to see something "real", so far nothing posted has touched
hardware, and nothing has had to interact with an existing hardware bus
such that it will be automatically loaded and bind to the hardware
present in the system.

Without showing that Rust can actually work in Linux for a real use
case (and binder is not a real use case outside of Android), and how it
will interact with all of the existing kernel objects and lifetimes we
have today, it's going to be a very hard sell.

thanks,

greg k-h

