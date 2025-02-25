Return-Path: <ksummit+bounces-1896-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B981FA44D83
	for <lists@lfdr.de>; Tue, 25 Feb 2025 21:35:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8E7F7A34E0
	for <lists@lfdr.de>; Tue, 25 Feb 2025 20:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D165D20F06E;
	Tue, 25 Feb 2025 20:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gdXaCi3v"
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DB520E71F
	for <ksummit@lists.linux.dev>; Tue, 25 Feb 2025 20:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740514880; cv=none; b=NTGzhIZz+y5ZHmAZD1qqWiQRRZmWV9qyuJeMCQQ+NagMdOzJbBh0HfcZ/bC5FdZfwmxn053Vm8fRRbQEZraabBkvPFKjr3DYCA8D5F16qe8pmDulFPx5gd0Q3GVOU26gc1iFUaZvWQ51mXw982W1qUXwpRHHduPLKREBuP+dgSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740514880; c=relaxed/simple;
	bh=EKW61JdRuLrsPidEomRLoVjbTz4pI48mpGCqtY8qIGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ULclWBm2drhVtoK1vvK6dDKorzQRrmpSSXsT9VCucCe2REdakMP7cdfI+DO/UPaquy9h2sV0LDj9twS9BoyptBuMVI5NF0QJXMiZUHDQXaxGYMB7VWgLrEGQ+/xdNoeAkwsIYaRp7/dkHwF/aeBx81rYqCACYGtnR23MwdmXcpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gdXaCi3v; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 25 Feb 2025 15:21:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740514872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3UCNB5CKSq9E7UmK4YsXGdiNsGKWaW7CQ+6sZ4wc6js=;
	b=gdXaCi3vxKm4RtIr/N+bEUje5Y04u/a3GN2o1dzKNVQ4R3DAAsibOaCnAsvnD2utlVUBg5
	3NzcTCkDUmo92H78AmPfnW0n5jah7uoPxvgttLT2NR/O8GRBcEZVs9iR0RHLjhCzSQJcJl
	VyNgK4VEW8jsvqIxPbCPsiHqTNDD5P0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Alice Ryhl <aliceryhl@google.com>, 
	Ventura Jack <venturajack85@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, hch@infradead.org, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com, 
	rust-for-linux@vger.kernel.org
Subject: Re: C aggregate passing (Rust kernel policy)
Message-ID: <2rrp3fmznibxyg3ocvsfasfnpwfp2skhf4x7ihrnvm72lemykf@lwp2jkdbwqgm>
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <20250222141521.1fe24871@eugeo>
 <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
 <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
 <CAFJgqgREAj-eP-d244WpqO-9H48ajZh83AxE31GqoONZ=DJe-g@mail.gmail.com>
 <CAH5fLghEMtT663SNogAGad-qk7umefGeBKbm+QjKKzoskjOubw@mail.gmail.com>
 <5E3FEDC4-DBE3-45C7-A331-DAADD3E7EB42@zytor.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5E3FEDC4-DBE3-45C7-A331-DAADD3E7EB42@zytor.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Feb 25, 2025 at 10:16:17AM -0800, H. Peter Anvin wrote:
> On February 25, 2025 9:36:07 AM PST, Alice Ryhl <aliceryhl@google.com> wrote:
> >On Tue, Feb 25, 2025 at 6:21 PM Ventura Jack <venturajack85@gmail.com> wrote:
> >> On the topic of difficulty, even if there was a full specification,
> >> it might still be difficult to work with aliasing in unsafe Rust.
> >> For C "restrict", I assume that "restrict" is fully specified, and
> >> C developers still typically avoid "restrict". And for unsafe
> >> Rust, the Rust community helpfully encourages people to
> >> avoid unsafe Rust when possible due to its difficulty.
> >
> >This I will not object to :)
> >
> >Alice
> >
> >
> 
> I do have to say one thing about the standards process: it forces a
> real specification to be written, as in a proper interface contract,
> including the corner cases (which of course may be "undefined", but
> the idea is that even what is out of scope is clear.)

Did it, though?

The C standard didn't really define undefined behaviour in a
particularly useful way, and the compiler folks have always used it as a
shield to hide behind - "look! the standard says we can!", even though
that standard hasn't meaninfully changed it decades. It ossified things.

Whereas the Rust process seems to me to be more defined by actual
conversations with users and a focus on practicality and steady
improvement towards meaningful goals - i.e. concrete specifications.
There's been a lot of work towards those.

You don't need a standards body to have specifications.

