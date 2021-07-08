Return-Path: <ksummit+bounces-352-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FA33C18D5
	for <lists@lfdr.de>; Thu,  8 Jul 2021 20:02:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 30A181C0F10
	for <lists@lfdr.de>; Thu,  8 Jul 2021 18:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 653D32F80;
	Thu,  8 Jul 2021 18:01:59 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EEA70
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 18:01:58 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailnew.nyi.internal (Postfix) with ESMTP id 247B758034B;
	Thu,  8 Jul 2021 14:01:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 08 Jul 2021 14:01:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=tQsnC8f4RCma0d34nYIoAZ3m3VM
	Al6Zmw1kpuLuKwAc=; b=GTIpRgFbWPSp12QsE929C8cIOWdRQ2S8bXOoVCiGBwy
	tDwPMq7k3zwM4FuA+nfMu6D3SRgwqjHdTaQIinyJRQRk33VFQmBIyIJmgpue0rpU
	1uvvu3oEsBobk9enU1K6YWU5L2OoCoFnf/KXC/pEz2rhfSzRZD7tI4uS7WDRBBIn
	UHZvwL/5DwwLRGih2NhrlQhCHwfOhhxSff05pO6LZUXquJWWK91qG8XauBifCV0T
	oiaagWDL71Z9VrCOHVt5RdaVA+bBiZQ2ilWToXhYBpQ9o7w2KCtWtaxq51F3HXAx
	32vfNMZFQoM/1gQXO4eZHUal/WV8JAiWDM7ENTkJSdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=tQsnC8
	f4RCma0d34nYIoAZ3m3VMAl6Zmw1kpuLuKwAc=; b=bXCdXcAAapj8e5ucHymtVK
	oeQqxxvYV556FLQfHxhOptwMXr/DJ3hU9Afs2xEXA637/DTfNPuAvHlHqLyRaoq5
	AfqWiSuJoxy8Vi9va3fwzoIVKJJkYa5wFdr3qI36jc833p7i20iu55FWk2HtCg06
	zn6/gwyMjJyahO7bQxDcgD9iX83RzNzftkSS0l2VgQ03/jo/KbqOz8TDBtt1nF2j
	7+P2hCKuYoOZnrpmF503UzYMS/yin9Vc6LDaijqTnO7rTQD8KRXmctzyKVhfmXD3
	6UCn0n8/YOle74e85gNYl55N4R+KmGRhf1Bmroy8O/X9tpAgFeyniobqTQECp/nw
	==
X-ME-Sender: <xms:lD3nYNi9PTLTfgTX6PmwtXRsXDwqeU-ApSzSK3ofukST40O4p_kKRw>
    <xme:lD3nYCAB8HcclyVJ-RSuaBJ-nxZc9Zwz9pJOVhsN2udapbznphnYetkVsBPT37Vvf
    fgZVxeUQgcNtg>
X-ME-Received: <xmr:lD3nYNGSE3MVY3GK4Hw8NjoCWRvXj-5d1KJc0KEGtQL4Kd0lg5vPEGMyRjcLNl3JIT7_ZjSwYGBWq5Nf3NzVOtCQ4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdeggdduudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:lD3nYCS1zHBhEMHJV0jmqkrq-m6UkGdMjs-e7CkOeBn5IGmlBNgDew>
    <xmx:lD3nYKw8W2OI0ZWC0YCkjp9qkcrrQHcstUB4JGycKinbqz_pKoOT4Q>
    <xmx:lD3nYI750d2EnRBeVTnoE6EUk9UoDKWrT6R1HFh65yFm9gqoEAnhfw>
    <xmx:lT3nYLrIFVdjbORc4d-6Y4GBHSutbRJoMufaep5zBPUoQ49xU9mLcA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jul 2021 14:01:55 -0400 (EDT)
Date: Thu, 8 Jul 2021 20:01:53 +0200
From: Greg KH <greg@kroah.com>
To: Andy Lutomirski <luto@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Wedson Almeida Filho <wedsonaf@google.com>, Jan Kara <jack@suse.cz>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOc9kUCpcQboxxre@kroah.com>
References: <YOXL6Th+pot9+Fp3@kroah.com>
 <YOXd9WoafgBr1Nkv@google.com>
 <YOXibDV8mHT1e6ec@kroah.com>
 <YOX+N1D7AqmrY+Oa@google.com>
 <20210707203827.GI18396@quack2.suse.cz>
 <YOY0HLj5ld6zHJHU@google.com>
 <YOaW/pR0na5N9GiT@kroah.com>
 <CANiq72kEfZ1NxSNrcDpavkq256YsiZSLkV_EABPZPQAE=VkaVg@mail.gmail.com>
 <YOcSo3ilu+ACDnBJ@kroah.com>
 <CALCETrUo5iLqOqd25xaDWa22ohxW5MZAOU5G=-Cu+OGy0534Ew@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALCETrUo5iLqOqd25xaDWa22ohxW5MZAOU5G=-Cu+OGy0534Ew@mail.gmail.com>

On Thu, Jul 08, 2021 at 09:38:01AM -0700, Andy Lutomirski wrote:
> On Thu, Jul 8, 2021 at 7:58 AM Greg KH <greg@kroah.com> wrote:
> >
> > On Thu, Jul 08, 2021 at 03:55:31PM +0200, Miguel Ojeda wrote:
> > >     On Thu, Jul 8, 2021 at 8:11 AM Greg KH <greg@kroah.com> wrote:
> > > >
> > > > Thanks for the detailed explainations, it seems rust can "get away" with
> > > > some things with regards to reference counts that the kernel can not.
> > > > Userspace has it easy, but note that now that rust is not in userspace,
> > > > dealing with multiple cpus/threads is going to be interesting for the
> > > > language.
> > >
> > > Regarding parallelism, userspace deals with the same problems, so I do
> > > not see fundamental issues coming up there. The language was designed
> > > with parallelism in mind and is a definite improvement over both C and
> > > C++ in that regard.
> >
> > Ok, great, then how would you handle the kref issue where you need an
> > external lock to properly handle the reference counting logic in Rust?
> > Why is C so "bad" here that we require a lock but Rust would not?
> 
> Can you point at a specific example in the kernel tree?

Easy ones to see are any callers of kref_put_mutex() and
kref_put_lock().  There's also the klist.h usage that removes the need
for using those calls as there is a different lock involved, and other
"bigger" locks that the driver core holds when dealing with kobjects so
it "knows" it can just call kref_put().

> The
> lock-and-then-put model is, at the very least, unusual, and the kref
> docs talk about it like it's common and self-explanatory as to when
> it's needed.  I have personally never encountered a need for this, and
> I'd like to know exactly what type of use case you're thinking of.

Look at the above examples for details, I can't remember them all at the
moment.  Last time I looked into it, it took me and two graduate
students with a whiteboard an hour to verify if we needed the lock or
not.  I was wrong and it turns out we did :)

It mostly is needed when you need to return a pointer to a reference
counted object from some sort of lookup as it was stored in a list or
something.  Which for kernel objects, is quite common.

thanks,

greg k-h

