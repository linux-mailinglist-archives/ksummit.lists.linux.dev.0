Return-Path: <ksummit+bounces-310-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id B73163BF0D0
	for <lists@lfdr.de>; Wed,  7 Jul 2021 22:38:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 028511C0ECB
	for <lists@lfdr.de>; Wed,  7 Jul 2021 20:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C8A2F80;
	Wed,  7 Jul 2021 20:38:37 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C71168
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 20:38:35 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 65C4A20111;
	Wed,  7 Jul 2021 20:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1625690308; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lnQPbZ/eKrxrkclH/ZdkAYezGxt4Fz50+ivhmM6TEQM=;
	b=lab8I7UysT59TvAe3lk+GdHv7NJrN3QfxSd5DAXOYm2ZqjqVlMxemQPuVsS1T2Diwu3D0D
	L/bz4rhgbtCgt6ppnfbFFEvbYdWe4994prOPnClfv6OTRPViL0O0PoBwHdVB/37bueHaGq
	4CN8zdKCwCpQXLZRNWhnWlkia8U8lZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1625690308;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lnQPbZ/eKrxrkclH/ZdkAYezGxt4Fz50+ivhmM6TEQM=;
	b=DEb/u96TYrXwoIGPq9MbSlg+2u7nDny4XzbjoYNEtQtfYdvAYGsvZgy0eJQg1/KnlS3EiU
	tWM4axSCaEF+xUCQ==
Received: from quack2.suse.cz (unknown [10.163.43.118])
	by relay2.suse.de (Postfix) with ESMTP id 1264AA3BA5;
	Wed,  7 Jul 2021 20:38:28 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id C10661F2CD7; Wed,  7 Jul 2021 22:38:27 +0200 (CEST)
Date: Wed, 7 Jul 2021 22:38:27 +0200
From: Jan Kara <jack@suse.cz>
To: Wedson Almeida Filho <wedsonaf@google.com>
Cc: Greg KH <greg@kroah.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <20210707203827.GI18396@quack2.suse.cz>
References: <alpine.DEB.2.22.394.2107070926370.6285@hadrien>
 <YOVbsS9evoCx0isz@kroah.com>
 <20ad13eb229b15fd14d870832d43a1605ba5c24a.camel@HansenPartnership.com>
 <CANiq72n=8Do_9suDeJdwoF_8ZR-uLEj2r9cRSB_k=yTk_q0FHw@mail.gmail.com>
 <1f2a62c19845e4602817c2130d47bbea02d04d1d.camel@HansenPartnership.com>
 <CANiq72=qa2jMUKyfPmH1q1jr8n_Tm7FMy0QyWRhhpinUrvMiNA@mail.gmail.com>
 <YOXL6Th+pot9+Fp3@kroah.com>
 <YOXd9WoafgBr1Nkv@google.com>
 <YOXibDV8mHT1e6ec@kroah.com>
 <YOX+N1D7AqmrY+Oa@google.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YOX+N1D7AqmrY+Oa@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed 07-07-21 20:19:19, Wedson Almeida Filho wrote:
<snip good explanations how refs work>

> There are real cases when you can't guarantee that lifetimes line up as required
> by the compiler to guarantee safety. In such cases, you can "clone" ptr (which
> increments the refcount, again from n to n+1, where n > 0), then you end up with
> your own reference to the underlying `X`, for example:
> 
> fn main() {
>     let ptr_clone;
>     {
>         let ptr = Ref::new(X { a: 10, b: 20 });
>         ptr_clone = ptr.clone();
>     }
>     println!("{}", ptr_clone.a);
> }
> 
> (Note that the reference owned by `ptr` has been destroyed by the time
> `ptr_clone.a` is used in `println`, but `ptr_clone` has its own reference due to
> the clone call.)
> 
> The ideas above apply equally well if instead of thinking in terms of scope, you
> think in terms of threads/CPUs. If a thread needs a refcounted object to
> potentially outlive the borrow keeping it alive, then it needs to increment
> the refcount: if you can't prove the lifetime rules, then you must clone the
> reference.
> 
> Given that by construction the refcount starts at 1, there is no path to go from
> 0 to 1. Ever.
> 
> Where would a lock be needed in the examples above?

So I think Greg speaks about a situation where you have multiple threads
and the refcounted object can be looked up through some structure all the
threads see. And the problem is that the shared data structure cannot hold
ref to the object it points to because you want to detect the situation
where the data structure is the only place pointing to the object and
reclaim the object in that case. Currently I don't see how to model this
idiom with Rust refs.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

