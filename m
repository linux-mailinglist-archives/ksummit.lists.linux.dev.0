Return-Path: <ksummit+bounces-1874-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E684A41FD4
	for <lists@lfdr.de>; Mon, 24 Feb 2025 14:02:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B184D3B2934
	for <lists@lfdr.de>; Mon, 24 Feb 2025 12:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D5923373E;
	Mon, 24 Feb 2025 12:58:41 +0000 (UTC)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BABB10F2
	for <ksummit@lists.linux.dev>; Mon, 24 Feb 2025 12:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740401920; cv=none; b=GuMtL0iAx1s1+Ujwal0M1Yyy1Li0eru6Y09b6F0wktmRPFc0PiZsbDISE914NXSw9v96+u6DuQshC/SBgaXFwHUdGuxPJpWr9jQbM+KYPBbwzyLXdGycaN6Zw3b7EmUrGzfI0c/QZevTnqLbY4MHxAnM7FJKDjhlL/AzkNeTVJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740401920; c=relaxed/simple;
	bh=iId1Db8PjY2Oaef1qiwFX4D8BeJwIQWLyEI8Zp99plw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GPPn+mJKQWtWDjS15pdhYw+4+Cc+FJ6n+7YZiroT3xpznKmV59GHwzoKi+BBLPXYPRUUwA7GhOhpYYAmOSRVKMdj4sS6+1fZmOZp8ofWRCQeT45jXH600dCsaZ4rqDyOmsShA9eY5li9z5WL14zvpXlb6hTp0CIjIKzPUIGQ9ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from trampoline.thunk.org (pool-173-48-113-172.bstnma.fios.verizon.net [173.48.113.172])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 51OCw50M018389
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 07:58:06 -0500
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 3927C2E010B; Mon, 24 Feb 2025 07:58:05 -0500 (EST)
Date: Mon, 24 Feb 2025 07:58:05 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Ventura Jack <venturajack85@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
        Kent Overstreet <kent.overstreet@linux.dev>,
        Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com,
        david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org,
        hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev,
        linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
        rust-for-linux@vger.kernel.org
Subject: Re: C aggregate passing (Rust kernel policy)
Message-ID: <20250224125805.GA5729@mit.edu>
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <20250222141521.1fe24871@eugeo>
 <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>

On Sun, Feb 23, 2025 at 08:30:06AM -0700, Ventura Jack wrote:
> Rust aliasing:
> - Is not a keyword.
> - Applies to certain pointer kinds in Rust, namely
>     Rust "references".
>     Rust pointer kinds:
>     https://doc.rust-lang.org/reference/types/pointer.html
> - Aliasing in Rust is not opt-in or opt-out,
>     it is always on.
>     https://doc.rust-lang.org/nomicon/aliasing.html
> - Rust has not defined its aliasing model.
>     https://doc.rust-lang.org/nomicon/references.html
>         "Unfortunately, Rust hasn't actually
>         defined its aliasing model.
>         While we wait for the Rust devs to specify
>         the semantics of their language, let's use
>         the next section to discuss what aliasing is
>         in general, and why it matters."

Hmm, I wonder if this is the reason of the persistent hostility that I
keep hearing about in the Rust community against alternate
implementations of the Rust compiler, such as the one being developed
using the GCC backend.  *Since* the aliasing model hasn't been
developed yet, potential alternate implementations might have
different semantics --- for example, I suspect a GCC-based backend
might *have* a way of opting out of aliasing, much like gcc and clang
has today, and this might cramp rustcc's future choices if the kernel
were to depend on it.

That being said, until Rust supports all of the platforms that the
Linux kernel does has, it means that certain key abstractions can not
be implemented in Rust --- unless we start using a GCC backend for
Rust, or if we were to eject certain platforms from our supported
list, such as m68k or PA-RISC....

						- Ted

