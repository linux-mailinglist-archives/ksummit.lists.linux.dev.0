Return-Path: <ksummit+bounces-305-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C053BECF7
	for <lists@lfdr.de>; Wed,  7 Jul 2021 19:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 546C13E0F9F
	for <lists@lfdr.de>; Wed,  7 Jul 2021 17:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B8AC2F80;
	Wed,  7 Jul 2021 17:20:49 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com [64.147.123.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7403772
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 17:20:48 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailnew.west.internal (Postfix) with ESMTP id E4E692B00A17;
	Wed,  7 Jul 2021 13:20:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 07 Jul 2021 13:20:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=Zlkb2OWRpmrFJVQZjA8Gz/52mhN
	TQRnrnc0Ti5SOTLs=; b=gB+u82SViuKOenybbzDH7IQZMGe/ytTsVFgww1khNJu
	q8ModgUWXyfwkeqZX07+IoCeBZeAq3UDIp3K+Z0leanfAZ7/U833qvpGpJuhD6sg
	P2UYmSTetesaGZqLDMfiHT7n/At47D56j6SMtJGLAER0gjS90NUPPUIywQxaSYob
	BJ1A4qYORizdosBE/BDpCF5TlsytxL6z2ZUWPR+nySlSqhJShGa9A+Wu/oag6s+/
	68RJuny/hX2t1D2N//FSLkPnrB5iMkgTDMN0Lb246ZmsduyH07bgo/d5KngQM+iN
	uAL28i5ZbBAZI97CEzftrsyRrpj3WUpJIkmO/0rvrgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Zlkb2O
	WRpmrFJVQZjA8Gz/52mhNTQRnrnc0Ti5SOTLs=; b=dnnD4acgOad1uorlQQZ0Ub
	KlnYHpsf8BdcFV1sVuZL6/PpQBM2JOXj4cnOcH7Q/3LaABKuzT4lF/UiYNk/TIvw
	WkZ7Bs7/MmvZZXB3GZajgzMucfIHB9V4W+DnQHocNL9nZcnT5ey1nb1+429Z/Nz2
	+jklJvy10CvcmguIIoBEYNWIk0pPwVKkAk3KfmTE3LFMcM2FFBv29MFQ5uvQPz9g
	ymjHEQtS4FDI5W3Ts4yeX3LVCnyOP3/doMNIS/cM7c69LBveTiwIDj1knd800hGB
	onvFPIp+pXS+ALIcKHcCQHPSCtbu2HuWLezdqOayjzyvOObBD05fnBTb8vuVoqiw
	==
X-ME-Sender: <xms:beLlYOhoDpQv9P7gGULEaH__A_2ddTgvkxDvDBX66S9iCb9F09yWAA>
    <xme:beLlYPA2OSps4g3mSYWH4AnHyT7iZoN8MhD3Indvz-NhQLdnAVCReHZWD09Vl0Adw
    TZxnRx8NZdWTA>
X-ME-Received: <xmr:beLlYGFcWB63rVzkXvxDbWchz00xLq6HG3bIV0xzRnnRBWkyF054XlPvInbO-_Qz8KibpZcFhV0Kgozurw2ACamAwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgddutdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeekheegtd
    egtdduueelkeegffefgfelgfeuhffgffegfedukeeffffgheeivdefteenucffohhmrghi
    nhepghhithhhuhgsrdgtohhmpdgrrhgtrdhrshdpphhtrhdrrghsnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgt
    ohhm
X-ME-Proxy: <xmx:beLlYHTn7dpcF5_Jwz6olJpZ5ThtGlKnrDtQ-6qBWkEK5Nd4Hb4tDQ>
    <xmx:beLlYLyIcShiRzr0PQzPsr0jAlWGHMiOgOykYRVTCvirUv3MX1htpA>
    <xmx:beLlYF68Zs-KK9cTzRUttuBp1_qY9p7pn15UwVzvLZnKFRdA6uIC6A>
    <xmx:buLlYAI8JMwSHnPprYdQKIQsQfHjIDU3GP8tN7f_HiDqD84ZdTfCYrX7sv0>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 13:20:45 -0400 (EDT)
Date: Wed, 7 Jul 2021 19:20:44 +0200
From: Greg KH <greg@kroah.com>
To: Wedson Almeida Filho <wedsonaf@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOXibDV8mHT1e6ec@kroah.com>
References: <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
 <YOTSYy2J2COzOY9l@pendragon.ideasonboard.com>
 <alpine.DEB.2.22.394.2107070926370.6285@hadrien>
 <YOVbsS9evoCx0isz@kroah.com>
 <20ad13eb229b15fd14d870832d43a1605ba5c24a.camel@HansenPartnership.com>
 <CANiq72n=8Do_9suDeJdwoF_8ZR-uLEj2r9cRSB_k=yTk_q0FHw@mail.gmail.com>
 <1f2a62c19845e4602817c2130d47bbea02d04d1d.camel@HansenPartnership.com>
 <CANiq72=qa2jMUKyfPmH1q1jr8n_Tm7FMy0QyWRhhpinUrvMiNA@mail.gmail.com>
 <YOXL6Th+pot9+Fp3@kroah.com>
 <YOXd9WoafgBr1Nkv@google.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YOXd9WoafgBr1Nkv@google.com>

On Wed, Jul 07, 2021 at 06:01:41PM +0100, Wedson Almeida Filho wrote:
> On Wed, Jul 07, 2021 at 05:44:41PM +0200, Greg KH wrote:
> > On Wed, Jul 07, 2021 at 05:15:01PM +0200, Miguel Ojeda wrote:
> > > For instance, we have a `Ref` type that is similar to `Arc` but reuses
> > > the `refcount_t` from C and introduces saturation instead of aborting
> > > [3]
> > > 
> > > [3] https://github.com/Rust-for-Linux/linux/blob/rust/rust/kernel/sync/arc.rs
> > 
> > This is interesting code in that I think you are missing the part where
> > you still need a lock on the object to prevent one thread from grabbing
> > a reference while another one is dropping the last reference.  Or am I
> > missing something?
> 
> You are missing something :)
> 
> > The code here:
> > 
> >    fn drop(&mut self) {
> >         // SAFETY: By the type invariant, there is necessarily a reference to the object. We cannot
> >         // touch `refcount` after it's decremented to a non-zero value because another thread/CPU
> >         // may concurrently decrement it to zero and free it. It is ok to have a raw pointer to
> >         // freed/invalid memory as long as it is never dereferenced.
> >         let refcount = unsafe { self.ptr.as_ref() }.refcount.get();
> > 
> >         // INVARIANT: If the refcount reaches zero, there are no other instances of `Ref`, and
> >         // this instance is being dropped, so the broken invariant is not observable.
> >         // SAFETY: Also by the type invariant, we are allowed to decrement the refcount.
> >         let is_zero = unsafe { rust_helper_refcount_dec_and_test(refcount) };
> >         if is_zero {
> >             // The count reached zero, we must free the memory.
> >             //
> >             // SAFETY: The pointer was initialised from the result of `Box::leak`.
> >             unsafe { Box::from_raw(self.ptr.as_ptr()) };
> >         }
> >    }
> > 
> > Has a lot of interesting comments, and maybe just because I know nothing
> > about Rust, but why on the first line of the comment is there always
> > guaranteed a reference to the object at this point in time?
> 
> It's an invariant of the `Ref<T>` type: if a `Ref<T>` exists, there necessarily
> is a non-zero reference count. You cannot have a `Ref<T>` with a zero refcount.

What enforces that?  Where is the lock on the "back end" for `Ref<T>`
that one CPU from grabbing a reference at the same time the "last"
reference is dropped on a different CPU?

Does Rust provide "architecture-specific" locks like this somehow that
are "built in"?  If so, what happens when we need to fix those locks?
Does that get fixed in the compiler, not the kernel code?

> `drop` is called when a `Ref<T>` is about to be destroyed. Since it is about to
> be destroyed, it still exists, therefore the ref-count is necessarily non-zero.

"about to", yes, but what keeps someone else from grabbing it?

> > And yes
> > it's ok to have a pointer to memory that is not dereferenced, but is
> > that what is happening here?
> 
> `refcount` is a raw pointer. When it is declared and initialised, it points to
> valid memory. The comment is saying that we should be careful with the case
> where another thread ends up freeing the object (after this thread has
> decremented its share of the count); and that we're not violating any Rust
> aliasing rules by having this raw pointer (as long as we don't dereference it).
>  
> > I feel you are trying to duplicate the logic of a "struct kref" here,
> 
> `struct kref` would give us the ability to specify a `release` function when
> calling `refcount_dec_and_test`, but we don't need this round-trip to C code
> because we know at compile-time what the `release` function is: it's the `drop`
> implementation for the wrapped type (`T` in `Ref<T>`).

That's not what I meant by bringing up a kref.  I was trying to ask
where the "real" lock here is.  It has to be somewhere...

> > and that requires a lock to work properly.  Where is the lock here?
> 
> We don't need a lock. Once the refcount reaches zero, we know that nothing else
> has pointers to the memory block; the lifetime rules guarantee that if there is
> a reference to a `Ref<T>`, then it cannot outlive the `Ref<T>` itself.

Even with multiple CPUs?  What enforces these lifetime rules?

thanks,

greg k-h

