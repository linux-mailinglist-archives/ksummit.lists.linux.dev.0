Return-Path: <ksummit+bounces-328-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B133BF566
	for <lists@lfdr.de>; Thu,  8 Jul 2021 08:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 0E9C53E1005
	for <lists@lfdr.de>; Thu,  8 Jul 2021 06:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB1DB2F80;
	Thu,  8 Jul 2021 06:11:16 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7A370
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 06:11:15 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailnew.nyi.internal (Postfix) with ESMTP id 90BDF580403;
	Thu,  8 Jul 2021 02:11:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 08 Jul 2021 02:11:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=ODB7IpOMMFOTfqZRBkthwiAAL51
	1YtGNBDx7+8bSodg=; b=F2/gDXsVQU8eACDSGxfMD5blpPalbqdsa+yYWw1Lvjq
	5HirBBdCknSPq3IWus2rpsFm4LFT5AdS2DS0owxV+n/OK/z69vmcxZ+Mpn6+TPG8
	9vGJ3ZVzw0OcppKMiaQ29WdRj3IL7ZxC2Zv0ER+Jt+/B5lgBcD5Du8u6P2oCv7Nt
	cDUYzrZ1hZR99Kuie+1hviEpCEz6Cgb/kHCrCz4HWgj4RSViezkA0ZCJmaiJpaDZ
	Ve2c4xFjWhE6wOyqwMlG9wZtouuOGM7rJmtHAy2ZENu9s1FvDC47PKU5kEFPyZSc
	Go1g12Ua9/gbk3RFuv5pFke9DwicC57owBIW/pCMufg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ODB7Ip
	OMMFOTfqZRBkthwiAAL511YtGNBDx7+8bSodg=; b=g0zV14uQ1PQzUOgTt+zazT
	FTu2f9IyBhAs0M7nnVkNyGmkgRuTfnl0Pfwvin48XYfcN4JOcXuMaBjTMekrNQJj
	eQUTdqN1Onwy6KFR/g/iOAjjvdNshEMxr+MKszx6LNEKWvDxoghU7PZaZ2Utvgv6
	5Se530yaiMzBxfLAID9F5N+RcTENopT1VnSQcO0ZyhGM6GWKu6Xwii3pZXNJc84R
	HTXDFiXe85U8Nub3OHHhwdJfcvOt4+8ChxfLF0ben/CDZ2nhnuKJLjPi3xXz9pt/
	vQDyX50DVgCljqGHS3zpmGp2LY2YM1v/VWt0e2Kipd3InXuTD7MqZzPifAhOOR1w
	==
X-ME-Sender: <xms:AZfmYGe4Zv4iwnrBofe0iLTsh9bfI5JZyMjYv0gNErG8Es8eQxjDqg>
    <xme:AZfmYAMqUzRhq0qwwc-8acXbDg1WXBWESkR8AEEGZna1sbPhub8OShwEarr5MfyKH
    qwNFhpcGVfqZw>
X-ME-Received: <xmr:AZfmYHjtS0vNqv5PP_h5eewyH0nkDEwKJQjFbwNAjk8A4nAjekyzjiGib5TJd9QNcFn2aBB3MswPqM3wanBhrLCtrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdefgdeltdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhm
X-ME-Proxy: <xmx:AZfmYD9YMYbxuhbn1kNoKg1AhgDysm2lUuCRGMJuyQfe0ukrAxIztw>
    <xmx:AZfmYCvxorA5mHDtIhB4qZaDqRvDqZ2Zl5TDX-OmkfohYvQwTubZvQ>
    <xmx:AZfmYKHtl7jw-seJY5zQyA68FWQZlGnt-rHcSdDYU2tD-Pl-Qx6IDQ>
    <xmx:ApfmYD8OWKnpzrKW7hDrj45WIOtMO_51Q70awirqRv8wm2tTm4w_8w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jul 2021 02:11:13 -0400 (EDT)
Date: Thu, 8 Jul 2021 08:11:10 +0200
From: Greg KH <greg@kroah.com>
To: Wedson Almeida Filho <wedsonaf@google.com>
Cc: Jan Kara <jack@suse.cz>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOaW/pR0na5N9GiT@kroah.com>
References: <20ad13eb229b15fd14d870832d43a1605ba5c24a.camel@HansenPartnership.com>
 <CANiq72n=8Do_9suDeJdwoF_8ZR-uLEj2r9cRSB_k=yTk_q0FHw@mail.gmail.com>
 <1f2a62c19845e4602817c2130d47bbea02d04d1d.camel@HansenPartnership.com>
 <CANiq72=qa2jMUKyfPmH1q1jr8n_Tm7FMy0QyWRhhpinUrvMiNA@mail.gmail.com>
 <YOXL6Th+pot9+Fp3@kroah.com>
 <YOXd9WoafgBr1Nkv@google.com>
 <YOXibDV8mHT1e6ec@kroah.com>
 <YOX+N1D7AqmrY+Oa@google.com>
 <20210707203827.GI18396@quack2.suse.cz>
 <YOY0HLj5ld6zHJHU@google.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YOY0HLj5ld6zHJHU@google.com>

On Thu, Jul 08, 2021 at 12:09:16AM +0100, Wedson Almeida Filho wrote:
> On Wed, Jul 07, 2021 at 10:38:27PM +0200, Jan Kara wrote:
> > On Wed 07-07-21 20:19:19, Wedson Almeida Filho wrote:
> > > Where would a lock be needed in the examples above?
> > 
> > So I think Greg speaks about a situation where you have multiple threads
> > and the refcounted object can be looked up through some structure all the
> > threads see. And the problem is that the shared data structure cannot hold
> > ref to the object it points to because you want to detect the situation
> > where the data structure is the only place pointing to the object and
> > reclaim the object in that case. Currently I don't see how to model this
> > idiom with Rust refs.
> 
> The normal idiom in Rust for this is "weak" pointers. With it, each
> reference-counted object has two counts: strong and weak refs. Objects are
> "destroyed" when the strong count goes to zero and "freed" when the weak count
> goes to zero.
> 
> Weak references need to upgraded to strong references before the underlying
> objects can be accessed; upgrading may fail if the strong count has gone to
> zero. It is, naturally, implemented as an increment that avoids going from 0 to
> 1. It is safe to try to do it because the memory is kept alive while there are
> weak references.
> 
> For the case you mention, the list would be based on weak references. If the
> object's destructor also removes the object from the list, both counts will go
> to zero and the object will be freed as well. (If it fails to do so, the
> *memory* will linger allocated until someone removes the object from the list,
> but all attempts to upgrade the weak reference to a strong one will fail.)
> 
> The obvious cost is that we need an extra 32-bit number per reference-counted
> allocation. But if we have specialized cases, like the underlying object always
> being in some data structure until the ref count goes to zero, then we can build
> a zero-cost abstraction for such a scenario.
> 
> We can also build specialised zero-cost abstractions for the case when we want
> to avoid the 1 -> 0 transition unless we're holding some lock to prevent others
> observing the object-with-zero-ref. For this I'd have to spend more time to see
> if we can do safely (i.e., with compile-time guarantees that the object was
> actually removed from the data structure).

Thanks for the detailed explainations, it seems rust can "get away" with
some things with regards to reference counts that the kernel can not.
Userspace has it easy, but note that now that rust is not in userspace,
dealing with multiple cpus/threads is going to be interesting for the
language.

So, along those lines, how are you going to tie rust's reference count
logic in with the kernel's reference count logic?  How are you going to
handle dentries, inodes, kobjects, devices and the like?  That's the
real question that I don't seem to see anyone even starting to answer
just yet.

And that's the reason some of us are asking to see a "real" driver, as
those have to deal with these kernel-controlled-reference-counted
objects properly (as well as hardware control).  Seeing how that is
going to work in this language is going to be the real sign of if this
is even going to be possible or not.

thanks,

greg k-h

