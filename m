Return-Path: <ksummit+bounces-1854-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 513F8A40BEA
	for <lists@lfdr.de>; Sat, 22 Feb 2025 23:47:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A73DA189EF4E
	for <lists@lfdr.de>; Sat, 22 Feb 2025 22:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA64B20468B;
	Sat, 22 Feb 2025 22:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YDvgYYAy"
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A3F1F755B
	for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 22:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740264413; cv=none; b=PYos0I/yOyPhqFo84ldvOTeX0irZvdQujmr97RBD31/kYGlIFEuXyF2SgysQY4VlekR0f/o4yEgmTT2kr0U+lqSU+1HN2MPH8U17XFE3D2eLXYUuNl5bHYTn5adKZoES1SSPmg+TeyVxQiX7N1MIjXW1tl1oQUogiGnha/UILno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740264413; c=relaxed/simple;
	bh=dqd6e5582W7ouO6Ok0F7TnHQx3FojKM/y/C664TvmMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/0AfqVzGLagFP5xj0L2Kdhs4T/Os9irVid/eLgt5yKaaAZPKINZ47A9FL2H/VwbN7Uw2dP5xplkDRSgV3OTTZ2rWD4H5x1tARFSVGlr56sG0TmzY3yDZXau6QRdtO4bgvmvDNMuag8CnKWY+BQc0v2Sn+hfuVrp2YyKBZwg8uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YDvgYYAy; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Sat, 22 Feb 2025 17:46:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740264399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hrF8aSLXZNr45CTHT1KgBxYHTkkv6mPKwquxfVgQvwU=;
	b=YDvgYYAyUzRvnYlacV/OVnEHS9hytphrwytNjiOKInB4o6ZEI4qdC/Urb/Lu+WSszf7ckR
	8QcRBbLULnFjy8Ccf/Umv+wa6QPNDQgcy81EzHZVIhB02ERBo2cnawbwZ2rW0ES+0cFoQv
	GvRNUgR8GKxe3IE8VmdoQLqDlKmrJkw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: David Laight <david.laight.linux@gmail.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Ventura Jack <venturajack85@gmail.com>, 
	Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Subject: Re: C aggregate passing (Rust kernel policy)
Message-ID: <okfluptw2nqnxzcqhgbjz6ap7z5fgxfjv3ukh4rqd3bkadi326@btn45hcawpkt>
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <20250222141521.1fe24871@eugeo>
 <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
 <yuwkqfbunlymofpd4kpqmzpiwbxxxupyj57tl5hblf7vsvebhm@ljz6u26eg5ft>
 <6EFFB41B-9145-496E-8217-07AF404BE695@zytor.com>
 <c3spwcoq7j4fx5yg4l7njeiofhkaasbknze3byh4dl45yeacvr@rb6u6j5kz7oe>
 <20250222221248.772b4bf6@pumpkin>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250222221248.772b4bf6@pumpkin>
X-Migadu-Flow: FLOW_OUT

On Sat, Feb 22, 2025 at 10:12:48PM +0000, David Laight wrote:
> On Sat, 22 Feb 2025 16:22:08 -0500
> Kent Overstreet <kent.overstreet@linux.dev> wrote:
> 
> > On Sat, Feb 22, 2025 at 12:54:31PM -0800, H. Peter Anvin wrote:
> > > VLIW and OoO might seem orthogonal, but they aren't – because they are
> > > trying to solve the same problem, combining them either means the OoO
> > > engine can't do a very good job because of false dependencies (if you
> > > are scheduling molecules) or you have to break them instructions down
> > > into atoms, at which point it is just a (often quite inefficient) RISC
> > > encoding. In short, VLIW *might* make sense when you are statically
> > > scheduling a known pipeline, but it is basically a dead end for
> > > evolution – so unless you can JIT your code for each new chip
> > > generation...  
> > 
> > JITing for each chip generation would be a part of any serious new VLIW
> > effort. It's plenty doable in the open source world and the gains are
> > too big to ignore.
> 
> Doesn't most code get 'dumbed down' to whatever 'normal' ABI compilers
> can easily handle.
> A few hot loops might get optimised, but most code won't be.
> Of course AI/GPU code is going to spend a lot of time in some tight loops.
> But no one is going to go through the TCP stack and optimise the source
> so that a compiler can make a better job of it for 'this years' cpu.

We're not actually talking about the normal sort of JIT, nothing profile
guided and no dynamic recompilation - just specialization based on the
exact microarchitecture you're running on.

You'd probably do it by deferring the last stage of compilation and
plugging it into the dynamic linker with an on disk cache - so it can
work with the LLVM toolchain and all the languages that target it.

