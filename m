Return-Path: <ksummit+bounces-317-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BA03BF188
	for <lists@lfdr.de>; Wed,  7 Jul 2021 23:47:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 67FC01C0DDA
	for <lists@lfdr.de>; Wed,  7 Jul 2021 21:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4152F80;
	Wed,  7 Jul 2021 21:47:48 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4A8168
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 21:47:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C14C466;
	Wed,  7 Jul 2021 23:47:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1625694465;
	bh=JPMi1A04YdYsS4AbLOxt6pelAAWFfxNepP55qI0JS44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VWfxYMpHSVlcKIfW+OFk+P2PJiiLYi515YHlREmiSEuPUlNC/i4jiH/IMAh4aHQ2w
	 Lcba/yAWQO5YYdILTtgEclHbQjMctVMCRprrwWCkWolXBaySfC+9RFcsfzoblK6Nzq
	 955mKOm+y4iB2Cyy9h3oxKJpb3CA+7gAlqcDzl7k=
Date: Thu, 8 Jul 2021 00:47:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Greg KH <greg@kroah.com>, Wedson Almeida Filho <wedsonaf@google.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Linus Walleij <linus.walleij@linaro.org>,
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOYg1ZQXx9ceYfBX@pendragon.ideasonboard.com>
References: <alpine.DEB.2.22.394.2107070926370.6285@hadrien>
 <YOVbsS9evoCx0isz@kroah.com>
 <20ad13eb229b15fd14d870832d43a1605ba5c24a.camel@HansenPartnership.com>
 <CANiq72n=8Do_9suDeJdwoF_8ZR-uLEj2r9cRSB_k=yTk_q0FHw@mail.gmail.com>
 <1f2a62c19845e4602817c2130d47bbea02d04d1d.camel@HansenPartnership.com>
 <CANiq72=qa2jMUKyfPmH1q1jr8n_Tm7FMy0QyWRhhpinUrvMiNA@mail.gmail.com>
 <YOXL6Th+pot9+Fp3@kroah.com>
 <YOXd9WoafgBr1Nkv@google.com>
 <YOXibDV8mHT1e6ec@kroah.com>
 <CANiq72mWvniSwhEKLqkfRboFr4=r8k3pSAXg5-SyW45e4Ch27g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiq72mWvniSwhEKLqkfRboFr4=r8k3pSAXg5-SyW45e4Ch27g@mail.gmail.com>

On Wed, Jul 07, 2021 at 10:58:44PM +0200, Miguel Ojeda wrote:
> On Wed, Jul 7, 2021 at 7:20 PM Greg KH <greg@kroah.com> wrote:
> >
> > That's not what I meant by bringing up a kref.  I was trying to ask
> > where the "real" lock here is.  It has to be somewhere...
> 
> Given this sentence, I think I understand where the confusion comes
> from. The key is that `Ref` (`Arc`) is not adding any thread-safety to
> the `T` it wraps -- it is only concerned about providing
> reference-counting semantics.
> 
> For that it only needs to keep a thread-safe refcount for a given `T`.
> But the `T` might be (or not!) thread-safe. Since the refcount is an
> atomic, that is enough for implementing `Ref<T>`, no locks are needed.
> 
> Now, if you need mutable access to the content of an `Ref<T>` that is
> shared by several threads at the same time, you need something extra
> -- that is where you would need a lock. For instance, in normal Rust
> code you may see a `Arc<Mutex<T>>` being used.
> 
> The big thing is that if you get any of this wrong, you get a
> compile-time error. For instance, if you create a `Ref<T>` out of a
> `T` that is not marked as safe to be sent across threads, you get an
> error when you try to send the `Ref`. Or if you create a `Ref<T>` and
> try to call a method that mutates the `T` across threads, you will
> also get a compile-time error. Thus you cannot forget to have a lock
> if it is needed.

Out of curiosity: we have in the kernel objects shared between multiple
threads that require locking, but in some contexts taking the lock isn't
required. I'm thinking in particular about initialization time when you
create the object, before it is made visible to other users, or
destruction time, when you nobody else can have a reference to the
object anymore. Avoiding lock operations in those cases can be an
optimization. Cn rust handle that ?

-- 
Regards,

Laurent Pinchart

