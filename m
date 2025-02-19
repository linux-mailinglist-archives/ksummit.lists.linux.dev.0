Return-Path: <ksummit+bounces-1689-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C618A3B11A
	for <lists@lfdr.de>; Wed, 19 Feb 2025 06:53:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CAB416615B
	for <lists@lfdr.de>; Wed, 19 Feb 2025 05:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83521B87CC;
	Wed, 19 Feb 2025 05:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7JrLSnP"
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED701AF0DC
	for <ksummit@lists.linux.dev>; Wed, 19 Feb 2025 05:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739944428; cv=none; b=M34Hqa4ITNJUhcUam75hgT2N1Co7FKhDlBZfGP7Dntj84GgPJk08ff0IX4KaSyTJVIx5AONaRj22VRU24BNI/TG8ex02UmqJlJ049uH2SlxXkhz9TdjadOfqDq2Bf7apQ0fToFPz4GhE+wGeRJC1taJon0sl2xl8G08gka1nwi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739944428; c=relaxed/simple;
	bh=8w9lDl6R8vzWwfEIaXGD9eQE08gjr+XxPDBnLJ7uMSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ANyiPkH6KiLVcDH5sgjdIkZE5Q49SrZTt0V4ibOLKDpqtF0oQy+38OXYwrjDlHmkiVsNyQECy119BdXrmgqiDNXJxl4B3jN2+9p0NGMjvi0NL7z28oJ9srk2yP5tvek5Qhii7vZ3610pkQvvU/jJwAKKKUVXT2/YKI7fg/p/D7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7JrLSnP; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-abb90f68f8cso593107866b.3
        for <ksummit@lists.linux.dev>; Tue, 18 Feb 2025 21:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739944425; x=1740549225; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hoYubNUM/g2rCAi4UMr65fRF8j4p6OJUT/42WzZwWKc=;
        b=d7JrLSnPM8yb324ZiFSXA1xSKUGXkUva8hwneYYLKfaSgB832Jk5yMc9sIJwr2OfYq
         CWU8or2+CV1oqSG5xSlgd0sT4pSR6hVjV/e28swiMXKk6KCiTF6cO42ZgE3o6aTenZVj
         kjp4/HQ1hFmvFRESRINTvhqctEORAZHs4hALGVMMeU53ZUZESkZH6PRV7yeC/oe3CiR8
         9coCzVqFvOJjLL4m8CPvfrnNLxYZBc2YGtA9QZIQxivGfh80ZmBJ+Oi7dosOK9NeA7dl
         +9o60q7n8w/e7g5LNq+3840ifNv/fGMhlGHcZTUHNjAPkA9nIIXuxm/PqmUSkpWr5Fev
         Jb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739944425; x=1740549225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hoYubNUM/g2rCAi4UMr65fRF8j4p6OJUT/42WzZwWKc=;
        b=OBv1Jki5mswf0d9s2zpJc1w1m3ZO1vDB133+Weao+kFkcpGwUMah531k9eptt0Jk8N
         XkB+NHrl3VUvYPjJnny/X2egLpWeJ5PrZ53WzTKWU+lhryao4p5oALzytxTO2RknIpyf
         DeE5o5kNqGDi0T5nmWGgA92olgfrBKS1czgUnzT+cgTH1xE7jY5MH5NCwlU0vbaX9ClY
         CdGlqmswMpSgbcnyg+fNuEj7agDejMyvbvlJCgCsYMU6H0aUmFgFJhhcrwkoF2/Zi5va
         tNqS44THkR5mfYYWcqKvWfvgCdpK9U4Bg4dW1CQYdS8kGh5vNVuCDWET74KALG1n/FMf
         VODQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWCmqVi4ovwnZZm/DGWWZeuWTHqHBOa1FMqlFy9VUbXg14z1q4hSaDNbRNyZ0SH9in93bs3fAr@lists.linux.dev
X-Gm-Message-State: AOJu0YyS+/NTsiDELMKN8fH4oL6NWA5MWiN2RpDJEbcOOa3Sk9lTYYjs
	xFiyCjNXnz06pR8g7XM6eqjX8+m8Pof6weujXJ/I39vGdaV/lOo=
X-Gm-Gg: ASbGnctwWX0/lR0fAkm2nw/gJd+ptnFP/STLSbMhTeg4IqZyo53TJRCdIzOyiVO4oH9
	l9eBdunDBKjNW23EtmNcs33krgjxtZeIGLCfRmRm46bYT5gMZvvR69A4zzXBOeP8NSXM7CjBKRV
	n3fH4RNPqoel9y6/9luuGgbvLL3RcAwT+U5SxKS3d/ZwnGs1fqIZa83nddhRq8VoAQ2iLJjBU4n
	gaYOrNr6L26VSF8ujH5F0JNaCOGeM15WWjRUp4zpYKwtSxMdUzEMJRy3bvioZ0pfLz4lv/c32Rr
	MKG2sWj3UTGv1geuqIyBcx3ptakEo5L8AgXXPdiSj9j9WvTN+y8TNMvs8w==
X-Google-Smtp-Source: AGHT+IELbGf/jgctoWR5SBQOWdjIhRQbBm1V/RRwJ/UxCtMTP7qhBsZEyQgnBj6aaSRi9z2h2/QvQw==
X-Received: by 2002:a17:906:eb04:b0:abb:b092:dad9 with SMTP id a640c23a62f3a-abbb092de7fmr698590066b.37.1739944424725;
        Tue, 18 Feb 2025 21:53:44 -0800 (PST)
Received: from p183 (dynamic-vpdn-brest-46-53-133-68.brest.telecom.by. [46.53.133.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532802a1sm1192544766b.76.2025.02.18.21.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 21:53:44 -0800 (PST)
Date: Wed, 19 Feb 2025 08:53:42 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: Re: Rust kernel policy
Message-ID: <c0798016-b0e9-4af0-b6aa-48903b4718b3@p183>
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
 <Z7SwcnUzjZYfuJ4-@infradead.org>
 <CANiq72myjaA3Yyw_yyJ+uvUrZQcSLY_jNp65iKH8Y5xGY5tXPQ@mail.gmail.com>
 <326CC09B-8565-4443-ACC5-045092260677@zytor.com>
 <CANiq72m+r1BZVdVHn2k8XeU37ZeY6VT2S9KswMuFA=ZO3e4uvQ@mail.gmail.com>
 <a7c5973a-497c-4f31-a7be-b3123bddb6dd@zytor.com>
 <Z7VKW3eul-kGaIT2@Mac.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z7VKW3eul-kGaIT2@Mac.home>

On Tue, Feb 18, 2025 at 07:04:59PM -0800, Boqun Feng wrote:
> On Tue, Feb 18, 2025 at 04:58:27PM -0800, H. Peter Anvin wrote:
> [...]
> > > > David Howells did a patch set in 2018 (I believe) to clean up the C code in the kernel so it could be compiled with either C or C++; the patchset wasn't particularly big and mostly mechanical in nature, something that would be impossible with Rust. Even without moving away from the common subset of C and C++ we would immediately gain things like type safe linkage.
> > > 
> > > That is great, but that does not give you memory safety and everyone
> > > would still need to learn C++.
> > 
> > The point is that C++ is a superset of C, and we would use a subset of C++
> > that is more "C+"-style. That is, most changes would occur in header files,
> > especially early on. Since the kernel uses a *lot* of inlines and macros,
> > the improvements would still affect most of the *existing* kernel code,
> > something you simply can't do with Rust.
> > 
> 
> I don't think that's the point of introducing a new language, the
> problem we are trying to resolve is when writing a driver or some kernel
> component, due to the complexity, memory safety issues (and other
> issues) are likely to happen. So using a language providing type safety
> can help that. Replacing inlines and macros with neat template tricks is
> not the point,

In fact, this is the point.

> at least from what I can tell, inlines and macros are not
> the main source of bugs (or are they any source of bugs in production?).
> Maybe you have an example?

C's weak type system forces people to use preprocessor which is much weaker
language.

So instead of solving problems with more capable language people are forced
to solve it will less capable one.

This is not how it should be.

