Return-Path: <ksummit+bounces-1839-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 608FDA40AC9
	for <lists@lfdr.de>; Sat, 22 Feb 2025 18:55:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1043517F940
	for <lists@lfdr.de>; Sat, 22 Feb 2025 17:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24C0D20AF78;
	Sat, 22 Feb 2025 17:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TaVMtr3V"
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC8D1DDE9
	for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 17:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740246815; cv=none; b=GWJ9i7kQ2/O/QsN3rDffnGNYcgqe5F9VLgXoMtcvph0eU5xlA32nahdgUW+djCiF78bFjsZKH3Srdp8fXqB6Ctlo09WPFkDJnAK7fv9QdDHInO3ydoxRRX4Tm4gFtPVvz1/fQez8dyTno0F7YLsv5uZt2PQuF6/0REEOENUM7VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740246815; c=relaxed/simple;
	bh=Bd+cF6ZDc8d5lLMFOb4t0fSXN9Dl2OCUPQ9TWu1caoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bu8VOfBbEptONRNMWzc4yWUIEfGjhb255zppWCpKZeNJPFZ8J/RPd5VnA6Y0UffAjs45Z+W/B+dNotEQR3bwexFZmEy51ECXygYBeeNQ2YgTBqEF9RTQdGiAp7IK22sT1K5MopT9REEyEYhmLmy64a8VF/k4IuLmew7y0tZRgas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TaVMtr3V; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Sat, 22 Feb 2025 12:53:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740246801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5a6RYsG1OU9EJMu9S6crDh5yo/kv7CmeJiF+giYLU/g=;
	b=TaVMtr3VjnmDNLw6QvUk84kSt+F84LXM10GdmGJqaz+OCglFWwCjkp1DvI8Sf1hXv77G1Q
	dDLv6L/Zo+zEWDmEOUVPg35/LQWiHCl9hipjZiEgViyA0tYTvocYC+J+SDujtCrV7wrk8c
	LW0ilKd86dzsB6+xuFly53P0j7TsKxo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Martin Uecker <uecker@tugraz.at>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Boqun Feng <boqun.feng@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, 
	ksummit@lists.linux.dev
Subject: Re: Rust kernel policy
Message-ID: <y75v63zqmgd3n42bprrbs2ppg32vhk2isppi6wxn7lfsdwd5sn@jm74cuwhadbj>
References: <2025022042-jot-favored-e755@gregkh>
 <b9a5de64fe1ded2ad3111763f35af9901bd81cc4.camel@tugraz.at>
 <caea3e79-78e6-4d98-9f3b-f8e7f6f00196@stanley.mountain>
 <61a7e7db786d9549cbe201b153647689cbe12d75.camel@tugraz.at>
 <20250221124304.5dec31b2@gandalf.local.home>
 <CAHk-=wgg2A_iHNwf_JDjYJF=XHnKVGOjGp50FzVWniA2Z010bw@mail.gmail.com>
 <6b3e4d3bdc9b6efd69068e5b22cfd05d370aed19.camel@tugraz.at>
 <CAHk-=wg=pZvE9cHJUPKGCajRUCtDoW73xwY5UfJApCWms_FgYw@mail.gmail.com>
 <20250221172415.5b632ae6@gandalf.local.home>
 <CAHk-=wjQ94GipftbNo0PbfuUxFMXFyp2bWGJJPNUngyf17Ai8A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjQ94GipftbNo0PbfuUxFMXFyp2bWGJJPNUngyf17Ai8A@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Fri, Feb 21, 2025 at 03:04:04PM -0800, Linus Torvalds wrote:
> On Fri, 21 Feb 2025 at 14:23, Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > If I could just get a warning for this stupid mistake:
> >
> >         size_t ret;
> >
> >         ret = func();
> >         if (ret < 0)
> >                 error();
> 
> Note that my main beef with the crazy compiler warning is that it
> literally triggers for *RANGE CHECKS*.
> 
> IOW, it's literally the "if (a < 0 || a > XYZ)" thing that absolutely
> MUST NOT WARN. EVER.  If it does, the compiler is broken.
> 
> And gcc still warns of it with -Wtype-limits. So we turn that garbage off.
> 
> It's worth noting that "-Wtype-limits" is simply a broken concept for
> other reasons too. It's not just the "unsigned type cannot be
> negative" thing. It has the exact same problems on the other end.
> 
> Imagine that you have macros that do sanity testing of their
> arguments, including things like checking for overflow conditions or
> just checking for invalid values. What a concept - safe programming
> practices with proper error handling.
> 
> Now imagine that you pass that an argument that comes from - for
> example - a "unsigned char". It's the same exact deal. Now the
> compiler warns about YOUR CODE BEING CAREFUL.
> 
> See why I hate that warning so much? It's fundamentally garbage, and
> it's not even about your error condition at all.

Hang on, it sounds like you're calling that warning garbage purely
because it triggers on range checks macros?

Because it sounds like coming up with a different way to write range
checks is going to be easier than coming up with pattern matching magic.

