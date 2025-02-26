Return-Path: <ksummit+bounces-1941-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CABA4684F
	for <lists@lfdr.de>; Wed, 26 Feb 2025 18:43:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E432F3A489D
	for <lists@lfdr.de>; Wed, 26 Feb 2025 17:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7E8225405;
	Wed, 26 Feb 2025 17:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="k3ULNE1+"
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A1921CC53
	for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 17:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740591783; cv=none; b=TVGDn5oRc3mmAwjO5kSnltNfZ3HGdJKVYXpNEfWCB9YP31ak7MdL7w9qwIpL83g5Cp6KbCZEQNurKjIT4hYgdUkVIUq4Uy9ZPsmWBzG2HM7ckN43JJcYq/PtXA/WRd5YMS9bN+cTQHlTsK85NdyiPzBFmNmfBAqwxjTdEseqlAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740591783; c=relaxed/simple;
	bh=Wvp2Wf24e5OiLaBjQ9CfTQWzI7dIGHhOr9EDdsHweX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AtxP5xcZ9YC4qe7gPM+PTmLxq4VPoCVuXrR5eicV8tVuTdwyaV9f4RJrsoty6zpDwzojapGR426vPqHmzDC6DvUlEm4X8cSsmXHp5AgfYqIhEIgzeUMU+XNf2TZ0rIPZL3TuOQALf0VnizRpWNt3I+ypgtp0VjZmhUM+ScAbd/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=k3ULNE1+; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 26 Feb 2025 12:42:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740591780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WO8BgoIWpM4KYlVJSvu0V4fB69iQzKx0gR7mWS9n7dY=;
	b=k3ULNE1+WzTZWSddCR3z1ScLV/z9UxU+JeDRdmiNl1EQKROJnguJN5AulKfNWOrQvbN/Xl
	9z4khDoL7w8YdnhFxnN3VY3VDsOQR6v/ZkaEF5eYed1c0nrW9TMP1A7aYWlzgCRecWr5hU
	wlhyEQyTIIqsdI6W7l6ArHDnmymwUO0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Ventura Jack <venturajack85@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Alice Ryhl <aliceryhl@google.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, hch@infradead.org, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Ralf Jung <post@ralfj.de>
Subject: Re: C aggregate passing (Rust kernel policy)
Message-ID: <onhodxmtqyxv2wtot3xnz2urc4xkz2i4hcsriingehvoxwsz2d@igppac6u4qq5>
References: <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
 <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
 <CAFJgqgREAj-eP-d244WpqO-9H48ajZh83AxE31GqoONZ=DJe-g@mail.gmail.com>
 <CAH5fLghEMtT663SNogAGad-qk7umefGeBKbm+QjKKzoskjOubw@mail.gmail.com>
 <5E3FEDC4-DBE3-45C7-A331-DAADD3E7EB42@zytor.com>
 <2rrp3fmznibxyg3ocvsfasfnpwfp2skhf4x7ihrnvm72lemykf@lwp2jkdbwqgm>
 <CAFJgqgS-SMMEE2FktuCUimdGkPWMV3HB2Eg38SiUDQK1U8=rNg@mail.gmail.com>
 <CANiq72mOp0q1xgAHod1Y_mX86OESzdDsgSghtQCwe6iksNt-sA@mail.gmail.com>
 <f2bf76553c666178505cb9197659303a39faf7aa.camel@HansenPartnership.com>
 <CANiq72=_krDaFaF4t2oCEQQGqO1Z7RrjxD7ZRSL79A4FCLwi=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=_krDaFaF4t2oCEQQGqO1Z7RrjxD7ZRSL79A4FCLwi=A@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Feb 26, 2025 at 06:11:53PM +0100, Miguel Ojeda wrote:
> On Wed, Feb 26, 2025 at 3:26 PM James Bottomley
> <James.Bottomley@hansenpartnership.com> wrote:
> >
> > On Wed, 2025-02-26 at 14:53 +0100, Miguel Ojeda wrote:
> > > On Wed, Feb 26, 2025 at 2:03 PM Ventura Jack
> > > <venturajack85@gmail.com> wrote:
> > [...]
> > > > Exception/unwind safety may be another subject that increases
> > > > the difficulty of writing unsafe Rust.
> > >
> > > Note that Rust panics in the kernel do not unwind.
> >
> > I presume someone is working on this, right?  While rust isn't
> > pervasive enough yet for this to cause a problem, dumping a backtrace
> > is one of the key things we need to diagnose how something went wrong,
> > particularly for user bug reports where they can't seem to bisect.
> 
> Ventura Jack was talking about "exception safety", referring to the
> complexity of having to take into account additional execution exit
> paths that run destructors in the middle of doing something else and
> the possibility of those exceptions getting caught. This does affect
> Rust when built with the unwinding "panic mode", similar to C++.
> 
> In the kernel, we build Rust in its aborting "panic mode", which
> simplifies reasoning about it, because destructors do not run and you
> cannot catch exceptions (you could still cause mischief, though,
> because it does not necessarily kill the kernel entirely, since it
> maps to `BUG()` currently).
> 
> In other words, Ventura Jack and my message were not referring to
> walking the frames for backtraces.
> 
> I hope that clarifies.

However, if Rust in the kernel does get full unwinding, that opens up
interesting possibilities - Rust with "no unsafe, whitelisted list of
dependencies" could potentially replace BPF with something _much_ more
ergonomic and practical.

