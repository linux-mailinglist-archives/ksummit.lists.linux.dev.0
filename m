Return-Path: <ksummit+bounces-347-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3085D3C158E
	for <lists@lfdr.de>; Thu,  8 Jul 2021 16:58:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id C893C3E10DF
	for <lists@lfdr.de>; Thu,  8 Jul 2021 14:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B4AA2F80;
	Thu,  8 Jul 2021 14:58:50 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com [66.111.4.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE6572
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 14:58:48 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailnew.nyi.internal (Postfix) with ESMTP id 1E7885800E8;
	Thu,  8 Jul 2021 10:58:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 08 Jul 2021 10:58:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=qxtFO6I5kT5FtOKrgt5h8kpa+Cn
	UlmylhCRwckMFonE=; b=z7rN49i0lvG+tx0UAMj0dAntheVy6pMzxhKVKa9h5wU
	dMNlSZHntCbuD4F7HgJxMyuKGPUC8a/nFimk/D7RpM8Tmt3t5/y6B+PkV/i/GVwS
	sml1lPI64XCJwSq5WMXCrRAYZ5gCXEYUBw55INv1vXwxar+1vXoetickd9jcTZ3x
	JSCcMy9BVtywKg8BpYFVN+D7CTFq7puSpFL251uwjmannq5ztZyu8N4D2l2uCSej
	2j/TvBLS0oJPbzx3wiPnrjwPxDuT/+xQAx0xYrTfFi6rqZNnWPKtyQIZwZTt0Q5k
	6OMGDko7wEy16upfupqwgUFsi5GHAa+X/tkIHYasB7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=qxtFO6
	I5kT5FtOKrgt5h8kpa+CnUlmylhCRwckMFonE=; b=brjZiepJiF6EEniVShv7h5
	l5n1u2NF3vN1AiE0XY4SOvJoR2TuTD29teRRzyXtVgxnqtZbQqZcjg1BfHkfszsY
	Yd7nS+JuSVPbrKRBGxzMz0zgRUsax0MDLaTk3dIyQAEAudcVR3gFJDnmM8GdmDha
	n07RyBi3L9SC8ZoPodTFf+Eh32JRL8HE48sw+gdU8BTzKVPnBmoAZRno+nB5VN1B
	2d0xly2g1Opv02Bv7JKzMcb/F77tfZbIQUuRAwUmzq+aki76WycTmVTLONtd6Joi
	E7xp+NqbLPPwQ4LuCuXG6WtMBhAgGAau4ZGwjeorS4ld9uStgImokB7/8Soxo2/A
	==
X-ME-Sender: <xms:pxLnYD9JDmPaHK8IBwjNJZu7fTIqWXhZq34M7x-6qdE685JE42IEFA>
    <xme:pxLnYPvl7XLBRqvwv6Kl5VAEmT7NRX3inNtzMxRT4GPyny-PHVpvvy80EXZ7gGL4U
    lhRVyS9lJgrAg>
X-ME-Received: <xmr:pxLnYBDGrlANx1bStuuj-qIbPcbL_jNd1spo7n0ny81iCifIXSeNUCjl78g3xRmj034DH4JDNJdMnRlXWNXDCR8Cdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdeggdekudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhm
X-ME-Proxy: <xmx:pxLnYPcgABwLl6NCz6WMeFbfDAWiM4THSoRTkJLFrA1-gZ-LVH_W2g>
    <xmx:pxLnYIO3o9sywD993EngtZtfLNqF1_MibjREEEHtU0c3UPswc4dMaw>
    <xmx:pxLnYBlxP-N6S_j_7WBg-tDwm8l2aTZE4GAHW1YnYWKmLJDkUr5ybg>
    <xmx:qBLnYNd3MN5sH1inQJpL0usq2owqVOzFOqImBNcwJ8ynTJShSfrEzg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jul 2021 10:58:46 -0400 (EDT)
Date: Thu, 8 Jul 2021 16:58:43 +0200
From: Greg KH <greg@kroah.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Wedson Almeida Filho <wedsonaf@google.com>, Jan Kara <jack@suse.cz>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOcSo3ilu+ACDnBJ@kroah.com>
References: <1f2a62c19845e4602817c2130d47bbea02d04d1d.camel@HansenPartnership.com>
 <CANiq72=qa2jMUKyfPmH1q1jr8n_Tm7FMy0QyWRhhpinUrvMiNA@mail.gmail.com>
 <YOXL6Th+pot9+Fp3@kroah.com>
 <YOXd9WoafgBr1Nkv@google.com>
 <YOXibDV8mHT1e6ec@kroah.com>
 <YOX+N1D7AqmrY+Oa@google.com>
 <20210707203827.GI18396@quack2.suse.cz>
 <YOY0HLj5ld6zHJHU@google.com>
 <YOaW/pR0na5N9GiT@kroah.com>
 <CANiq72kEfZ1NxSNrcDpavkq256YsiZSLkV_EABPZPQAE=VkaVg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72kEfZ1NxSNrcDpavkq256YsiZSLkV_EABPZPQAE=VkaVg@mail.gmail.com>

On Thu, Jul 08, 2021 at 03:55:31PM +0200, Miguel Ojeda wrote:
>     On Thu, Jul 8, 2021 at 8:11 AM Greg KH <greg@kroah.com> wrote:
> >
> > Thanks for the detailed explainations, it seems rust can "get away" with
> > some things with regards to reference counts that the kernel can not.
> > Userspace has it easy, but note that now that rust is not in userspace,
> > dealing with multiple cpus/threads is going to be interesting for the
> > language.
> 
> Regarding parallelism, userspace deals with the same problems, so I do
> not see fundamental issues coming up there. The language was designed
> with parallelism in mind and is a definite improvement over both C and
> C++ in that regard.

Ok, great, then how would you handle the kref issue where you need an
external lock to properly handle the reference counting logic in Rust?
Why is C so "bad" here that we require a lock but Rust would not?

> > So, along those lines, how are you going to tie rust's reference count
> > logic in with the kernel's reference count logic?  How are you going to
> 
> Let me clarify that Rust does not have "reference count logic" in the
> sense of some compiler magic (nor a runtime) that somehow "knows" that
> there is a reference count going on.
> 
> The confusion may come from similarly worded concepts: the
> lifetimes/borrowing rules are orthogonal to reference-counting
> semantics.
> 
> For instance, when Wedson was explaining the lifetime associated to a
> reference when e.g. passed into a function:
> 
>     fn f(x: &X) {
>         ...
>     }
> 
> That `&X` (a "Rust reference") is unrelated to the "reference" in
> "reference-counting semantics".
> 
> In fact, Rust's lifetime/reference/borrowing rules apply to all code.
> For instance:
> 
>     let mut i = 42;
> 
>     let r1 = &mut i;
>     let r2 = &mut i;
> 
>     f(r1, r2)
> 
> This code has two "Rust references", but there are no
> "reference-counted semantics" at all here, nor any refcount involved.
> Yet Rust prevents this code from compiling because you are attempting
> to create two mutable "Rust references" that alias the same object.
> 
> > handle dentries, inodes, kobjects, devices and the like?  That's the
> > real question that I don't seem to see anyone even starting to answer
> > just yet.
> 
> Those cases can be handled, one way or another. We will try to have
> something more concrete as soon as possible.
> 
> Having said that, if people is discussing how to improve the C model
> anyway (i.e. the "cdev/devm_* issues" thread), it could be nice --
> longer-term -- if we could also take the chance to discuss how to come
> up with a model that suites Rust too. This could lead to simpler code,
> more ergonomic abstractions and/or less `unsafe` code.

Ok, what "model" would be better?  We need a "base object" that has
solid lifecycle rules.  Right now we do have that, but it's just not the
easiest to use for complex objects where we have multiple objects with
different lifecycles that all interact together.  The v4l example is the
best, but the input layer also has this type of issue.

thanks,

greg k-h

