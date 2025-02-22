Return-Path: <ksummit+bounces-1853-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C21C1A40BE0
	for <lists@lfdr.de>; Sat, 22 Feb 2025 23:34:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7FE83BC697
	for <lists@lfdr.de>; Sat, 22 Feb 2025 22:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 479F51F0E47;
	Sat, 22 Feb 2025 22:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EMfJd4Wm"
Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com [91.218.175.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EB22AF04
	for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 22:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740263666; cv=none; b=cUgmJ4r1q92Dbc5yOvZgSh0H45xtrj6rqyO7gZY4IrzxJBEmmOE1/vioDHs044EhPD+hw/BKXWqtQ2BJmhQF6jtWfeY/tzibzY71bSS3ofRa1gdkiLwMkMldlyoCYAfQxUWTko0kR56X6UF4NVBOlThwO8WNfF7CMjSP9ARxy/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740263666; c=relaxed/simple;
	bh=0hr85pkL7Ye5HeamuLzT9NILODAgeGan/2o8QZI7s+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oN7zuDYe8GcwNziawyaJu3PI71yYbSsk/herFy+h0uwzeM7zv+47tkOb0W0ZfZKD/YZBaHU/IFWWDWJu8Dd7nwIZOjPTpoprNy0QABdLfg2LilYHkt8yFfkmxLARxpYTze6sgBgN2Fivq+1PsEHuuwq0P7ys2TiBi5r/6dhEfmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EMfJd4Wm; arc=none smtp.client-ip=91.218.175.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Sat, 22 Feb 2025 17:34:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740263659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w0vWcP6cra3WOAKc6I6ZYhWIX6wVwAh8l3udOd0fVrA=;
	b=EMfJd4WmS3g23ekm9bkyCbwN6Zk2yVrGgXVh9mkDrn8hPg1kJGEgmqwdG+mLt2FNFegbp5
	NAaZSYdCK5yhfDXKgUDi8rI3MQV0t5S3l75JOSem+B6NFk5joTsIKQb8Q1eiwC/P1xv4cJ
	JahzHz8LpvjUqqhq96x1kKwfzlJFj7Y=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, 
	Ventura Jack <venturajack85@gmail.com>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Subject: Re: C aggregate passing (Rust kernel policy)
Message-ID: <ngxypsinp2xnhc3yhg57c4sram5i6vbophgjakoyk32yb3sabs@dg6ne6jbuale>
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <20250222141521.1fe24871@eugeo>
 <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
 <yuwkqfbunlymofpd4kpqmzpiwbxxxupyj57tl5hblf7vsvebhm@ljz6u26eg5ft>
 <6EFFB41B-9145-496E-8217-07AF404BE695@zytor.com>
 <c3spwcoq7j4fx5yg4l7njeiofhkaasbknze3byh4dl45yeacvr@rb6u6j5kz7oe>
 <CAHk-=wi0UmOAhyDjOeCJcL7eEt+ygKnMqtx+RcHtzZGd7OY4Kw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wi0UmOAhyDjOeCJcL7eEt+ygKnMqtx+RcHtzZGd7OY4Kw@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Sat, Feb 22, 2025 at 01:46:33PM -0800, Linus Torvalds wrote:
> On Sat, 22 Feb 2025 at 13:22, Kent Overstreet <kent.overstreet@linux.dev> wrote:
> >
> > Power hungry and prone to information leaks, though.
> 
> The power argument is bogus.
> 
> The fact is, high performance is <i>always</i> "inefficient". Anybody
> who doesn't understand that doesn't understand reality.

It depends entirely on what variable you're constrained on. When you're
trying to maximize power density, you probably will be inefficient
because that's where the easy tradeoffs are. E.g. switching from aerobic
respiration to anaerobic, or afterburners.

But if you're already maxxed out power density, then your limiting
factor is your ability to reject heat. High power electric moters aren't
inefficient for the simple reason that if they were, they'd melt. RC
helicopter motors hit power densities of 5-10 kw/kg, with only air
cooling, so either they're 95%+ efficient or they're a puddle of molten
copper.

CPUs are significatly more in the second category than the first - we're
capped on power in most applications and transistors aren't going to get
meaningfully more efficient barring something radical happening.

> The VLIW people have proclaimed the same efficiency advantages for
> decades. I know. I was there (with Peter ;), and we tried. We were
> very very wrong.

If we ever get a chance I want to hear stories :)

> The vogue thing now is to talk about explicit parallelism, and just
> taking lots of those lower-performance (but thus more "efficient" -
> not really: they are just targeting a different performance envelope)
> cores perform as well as OoO cores.

Those are not terribly interesting to me. Useful to some people, sure,
but any idiot can add more and more cores (and leave it to someone else
to deal with Amdahl's law). I actually do care about straight line
performance...

> It's not like VLIW hasn't been around for many decades. And there's a
> reason you don't see it in GP CPUs.

It's also been the case more than once in technology that ideas appeared
and were initially rejected, and it took decades for the other pieces to
come together to make them practical. Especially when those ideas were
complex when they were first come up with - Multics, functional
programming (or Algol 68 even bofer that).

That's especially the case when one area has been stagnet for awhile. We
were stuck on x86 for a long time, and now we've got ARM which still
isn't _that_ different from x86. But now it's getting easier to design
and fab new CPUs, and the software side of things has gotten way easier,
so I'm curious to see what's coming over the next 10-20 years.

