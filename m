Return-Path: <ksummit+bounces-291-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A506B3BE967
	for <lists@lfdr.de>; Wed,  7 Jul 2021 16:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 58F0D3E1004
	for <lists@lfdr.de>; Wed,  7 Jul 2021 14:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B532F80;
	Wed,  7 Jul 2021 14:08:19 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D78C70
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 14:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id ACACB1280FF8;
	Wed,  7 Jul 2021 07:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1625666897;
	bh=/FBhhyz5uzv/rjZ2b2WuP4ouPWtpujhQfM7a1ddDG1c=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=Gm13JVr+/R7L+tWuYOt6NoyP5FZhYZeQFM6LU3Jp2c2B3gexemGOM76r/WIIhSDxM
	 Gl4b5eZ1kDbzbm/dOilLVHQGgwvuy6Whp/0DkDP/ofBjKVxBVkaKZ/3RRorY7OB4Xo
	 3cHez/Fs+nXplOuXnY7Gu17ebBrV19NpgyuYptyg=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cJPam2If0m4g; Wed,  7 Jul 2021 07:08:17 -0700 (PDT)
Received: from [192.168.0.73] (cpc1-seac25-2-0-cust181.7-2.cable.virginm.net [82.8.18.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 006E41280FF7;
	Wed,  7 Jul 2021 07:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1625666897;
	bh=/FBhhyz5uzv/rjZ2b2WuP4ouPWtpujhQfM7a1ddDG1c=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=Gm13JVr+/R7L+tWuYOt6NoyP5FZhYZeQFM6LU3Jp2c2B3gexemGOM76r/WIIhSDxM
	 Gl4b5eZ1kDbzbm/dOilLVHQGgwvuy6Whp/0DkDP/ofBjKVxBVkaKZ/3RRorY7OB4Xo
	 3cHez/Fs+nXplOuXnY7Gu17ebBrV19NpgyuYptyg=
Message-ID: <1f2a62c19845e4602817c2130d47bbea02d04d1d.camel@HansenPartnership.com>
Subject: Re: [TECH TOPIC] Rust for Linux
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Greg KH <greg@kroah.com>, Julia Lawall <julia.lawall@inria.fr>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij
 <linus.walleij@linaro.org>, Roland Dreier <roland@kernel.org>,
 ksummit@lists.linux.dev
Date: Wed, 07 Jul 2021 15:08:10 +0100
In-Reply-To: <CANiq72n=8Do_9suDeJdwoF_8ZR-uLEj2r9cRSB_k=yTk_q0FHw@mail.gmail.com>
References: 
	<CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
	 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
	 <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
	 <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
	 <YOTSYy2J2COzOY9l@pendragon.ideasonboard.com>
	 <alpine.DEB.2.22.394.2107070926370.6285@hadrien>
	 <YOVbsS9evoCx0isz@kroah.com>
	 <20ad13eb229b15fd14d870832d43a1605ba5c24a.camel@HansenPartnership.com>
	 <CANiq72n=8Do_9suDeJdwoF_8ZR-uLEj2r9cRSB_k=yTk_q0FHw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Wed, 2021-07-07 at 15:49 +0200, Miguel Ojeda wrote:
> On Wed, Jul 7, 2021 at 9:52 AM James Bottomley
> <James.Bottomley@hansenpartnership.com> wrote:
> > Rust has a reference counted pointer: Rc<T>.  However the problem
> > is the rust memory model is via strict accounting, so once you
> > start using refcounts, which need shared accounting, you can then
> > get memory leaks and it's unclear if rust actually buys you
> > anything over C for this use case.
> 
> Even if you are using `Rc<T>`, Rust buys you a *lot*. For starters,
> it still prevents UB

UB is Undefined Behaviour, right?  C plus the memory model should mean
we don't have that in the kernel, although that's enforced by
inspection and checking rather than the compiler.

>  and data races -- e.g. it prevents mistakenly sharing the `Rc` with
> other threads.

I'm not sure I get the point here: all the kernel refcount models are
explicitly multi-threaded, because we usually expect multiple CPU
threads to be using objects simultaneously ... it's why the base
implementation, kref, uses atomics.  That's not to say we don't have
single threaded use cases ... it's just that's not what's commonly
used.

That does beg another question which I couldn't find the answer to in
the base docs: the Rust Rc<T> is saturation protected, isn't it? or
would the rust implementation inherit that from the kernel?

James



