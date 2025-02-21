Return-Path: <ksummit+bounces-1798-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC63A3FEE5
	for <lists@lfdr.de>; Fri, 21 Feb 2025 19:35:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F175D189BCA1
	for <lists@lfdr.de>; Fri, 21 Feb 2025 18:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073DA2512C3;
	Fri, 21 Feb 2025 18:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XanFkZIh"
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0AB1F03F2
	for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 18:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740162882; cv=none; b=aPQFTYRRIaMSkXyJ7gyNhoGZSrVNFgcdUJwv9btOq0d2yej5cGQ9+09JvilcjehiFp36tfYQ/Cqu40CtN3kNyN7kU2vw25MJsUsZcr5Z9sPgbYVdOZrpP+Lm99dJ+XHhfYxPRSIpelikyurqQ5wvrh58td0HB+uphNDxZXIKY9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740162882; c=relaxed/simple;
	bh=K1euvi218QtGDVfU+jRQE7kWk0UjLLsjTd5RBkDtOKs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I+/uFoVWmpt4rnjrpB054L9t002fyPlDEM7ruiFezNvhSJjoniTasmW45U0Li4wKZh4ImP24MJtD3wiCmMJaFad3/jwyS66e3jOouD2O5x7vpzWFqtrOgo1m63+JlLHtnT5nA6xio51OHvxRwzLOSIw9hNOF6A4/DomajDKX5Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XanFkZIh; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38f1e8efe82so2699785f8f.0
        for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 10:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740162879; x=1740767679; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZrGiJcdjwdCBMTHzMbFP8clEmCxmNCyAUHf0UccRpxQ=;
        b=XanFkZIhruusFO6KNh4+bMuI+FAHLwQmKJP91leCJiFIknMlFEmMZQ8Z3vZURx6lWu
         KlHXCKa4N7MgK0jpfw6z1Zjb9YmfcynqGzDDnJPQSar4M0TgTWW1HZq8qxgP0nYF3IvL
         wt17+EU1OWqvIYUeVbKPJualNUMQjwUgurxOdciuIUTfKcYHQn+P4Ll7rfjLcWjR+Ra8
         hz3hNiHEHbHHwh20q9aXrj8fnU9eMToEqkTwlXi0/XL94eNWKmMGodr819lg0lS/dtoE
         9P74vXg7LLHWM3EZfZTtk+C068+hIh5YAoPdu5JBeZDh379jys+BuWRvCtzhOSETSMBY
         58jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740162879; x=1740767679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZrGiJcdjwdCBMTHzMbFP8clEmCxmNCyAUHf0UccRpxQ=;
        b=hjsz0ZtYJndbzp4hGr/ODHavGN/g0npGGFGzzC1kXNTlZ7PU+caMAsGbZ0btrr8pHJ
         14lk5WokdrQd6lf8ECqw6bPbOW0BDdZ8dP2DOKFdX38g1KPhzoahQuio1qPrWMDPHciB
         0vecniR/Y48hAUNvA8W1xbPWdQhKnLNAwObPifr4ek6NGK2WqXnqMKkZ1xb9rJHr1Ym0
         gLkrIpUI35K740fzRVhGK7tZ5LT3wfB+H8PfFkVobZmyF+0Bob2mphSYDAjyRQbBqgeY
         QwcwjpCZZ57LmWJnEZVEkE5H+3BIaYK2WfnnQFIjGds1KqCsQyD9c51ivQNsP9NAQdzq
         PAXg==
X-Forwarded-Encrypted: i=1; AJvYcCWUWtAzvP9JqmdyYclTr/iKG7SNIwlpqD8VrML+2Bl83twTMH0WGbXB8hp8qhl4ajEGnP5mZF3E@lists.linux.dev
X-Gm-Message-State: AOJu0YwDMpjKOk/S6T/XR/MaBFf5eFxqu5QRJEq/AObL0bP1MQGhxBVO
	mpcpbhd+4owVsI6A79/elZ+5KJNtqZqU+6jigAFkg8H7baXu+KyC
X-Gm-Gg: ASbGncv4v3tunKP+NbpQos4imfOG9FejWOk8e4CYHNrx+WkJ/sl9oL9m6qVDIf3AD5y
	kmPmU9ABme+t+xC0KqrS/tB1Nnf00otqGI3F2gXL+qYth2WcNDzh3HpFdICo9jNRqyzt3oM9McD
	VELm5CMczzOeTP+XSVzaMKrnw1p0zX+DfXWvwq3PlaA08LccRSyPvmpsq1UVDOvP24RESG7Xqyx
	B5HPMx8h7BTcFb2YWQ22cX8SHJStNweVPDXw88NN2fqTf/T4J7Lhe32n2hU8GbTClwCnQlrC2sW
	g8As+RHFYwJs0i3anx4oFIBzwHJWLOiZA+YRns7aUHtbzlGwnYLuq2x55jL43uvf
X-Google-Smtp-Source: AGHT+IFu3pBLM4BG9HpyDU3xaz6bWoZ/qR4n4K+OaxFPRhle1mo7ALTGO5sJuO7n6dg9d922Pza9WQ==
X-Received: by 2002:a5d:4c81:0:b0:38e:48a6:280b with SMTP id ffacd0b85a97d-38f6f096a76mr2806405f8f.34.1740162878585;
        Fri, 21 Feb 2025 10:34:38 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258ddbb2sm23668086f8f.40.2025.02.21.10.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 10:34:38 -0800 (PST)
Date: Fri, 21 Feb 2025 18:34:37 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jan Engelhardt <ej@inai.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Greg KH <gregkh@linuxfoundation.org>,
 Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda
 <miguel.ojeda.sandonis@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 rust-for-linux <rust-for-linux@vger.kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: C aggregate passing (Rust kernel policy)
Message-ID: <20250221183437.1e2b5b94@pumpkin>
In-Reply-To: <n05p910s-r5o3-0n36-5s44-qr769prp69r5@vanv.qr>
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
	<Z7SwcnUzjZYfuJ4-@infradead.org>
	<CANiq72myjaA3Yyw_yyJ+uvUrZQcSLY_jNp65iKH8Y5xGY5tXPQ@mail.gmail.com>
	<326CC09B-8565-4443-ACC5-045092260677@zytor.com>
	<CANiq72m+r1BZVdVHn2k8XeU37ZeY6VT2S9KswMuFA=ZO3e4uvQ@mail.gmail.com>
	<a7c5973a-497c-4f31-a7be-b3123bddb6dd@zytor.com>
	<Z7VKW3eul-kGaIT2@Mac.home>
	<2025021954-flaccid-pucker-f7d9@gregkh>
	<2nn05osp-9538-11n6-5650-p87s31pnnqn0@vanv.qr>
	<2025022052-ferment-vice-a30b@gregkh>
	<9B01858A-7EBD-4570-AC51-3F66B2B1E868@zytor.com>
	<n05p910s-r5o3-0n36-5s44-qr769prp69r5@vanv.qr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 20 Feb 2025 16:17:07 +0100 (CET)
Jan Engelhardt <ej@inai.de> wrote:

> On Thursday 2025-02-20 14:23, H. Peter Anvin wrote:
> >
> >People writing C seem to have a real aversion for using structures
> >as values (arguments, return values or assignments) even though that
> >has been valid since at least C90 and can genuinely produce better
> >code in some cases.  
> 
> The aversion stems from compilers producing "worse" ASM to this
> date, as in this case for example:
> 
> ```c
> #include <sys/stat.h>
> extern struct stat fff();
> struct stat __attribute__((noinline)) fff()
> {
>         struct stat sb = {};
>         stat(".", &sb);
>         return sb;
> }
> ```
> 
> Build as C++ and C and compare.
> 
> $ g++-15 -std=c++23 -O2 -x c++ -c x.c && objdump -Mintel -d x.o
> $ gcc-15 -std=c23 -O2 -c x.c && objdump -Mintel -d x.o
> 
> Returning aggregates in C++ is often implemented with a secret extra
> pointer argument passed to the function. The C backend does not
> perform that kind of transformation automatically. I surmise ABI reasons.

Have you really looked at the generated code?
For anything non-trivial if gets truly horrid.

To pass a class by value the compiler has to call the C++ copy-operator to
generate a deep copy prior to the call, and then call the destructor after
the function returns - compare against passing a pointer to an existing
item (and not letting it be written to).

Returning a class member is probably worse and leads to nasty bugs.
In general the called code will have to do a deep copy from the item
being returned and then (quite likely) call the destructor for the
local variable being returned (if a function always returns a specific
local then the caller-provided temporary might be usable).
The calling code now has a temporary local variable that is going
to go out of scope (and be destructed) very shortly - I think the
next sequence point.
So you have lots of constructors, copy-operators and destructors
being called.
Then you get code like:
	const char *foo = data.func().c_str();
very easily written looks fine, but foo points to garbage.

I've been going through some c++ code pretty much removing all the
places that classes get returned by value.
You can return a reference - that doesn't go out of scope.
Or, since most of the culprits are short std::string, replace them by char[].
Code is better, shorter, and actually less buggy.
(Apart from the fact that c++ makes it hard to ensure all the non-class
members are initialised.)

As Linus said, most modern ABI pass short structures in one or two registers
(or stack slots).
But aggregate returns are always done by passing a hidden pointer argument.
It is annoying that double-sized integers (u64 on 32bit and u128 on 64bit)
are returned in a register pair - but similar sized structures have to be
returned by value.
It is possible to get around this with #defines that convert the value
to a big integer (etc) - but I don't remember that actually being done.

	David




