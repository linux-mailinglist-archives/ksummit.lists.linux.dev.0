Return-Path: <ksummit+bounces-1786-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB27BA3F0EA
	for <lists@lfdr.de>; Fri, 21 Feb 2025 10:50:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B545D3B32C5
	for <lists@lfdr.de>; Fri, 21 Feb 2025 09:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35DEF204C22;
	Fri, 21 Feb 2025 09:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xwYzvvE5"
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1453C2F
	for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 09:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740131300; cv=none; b=VHo6vPbjF/i+F9gzBXbx5NTPcuBHESuXbZlZROpXebI4tpFrizMVEstUpi02GoWnVBJtGCetFaPT5xI0L2rsNt8LauQuRzlqZUr1Za1ypsioL8fv+F7+ZQ+UnSAdLfMxk+C4AGGSe/tqmYhztxAsG6a+5TqtpseRIgq0gDASi6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740131300; c=relaxed/simple;
	bh=YQ4B87MLUsD0Ex7xuUwKJHzAgodX1CRjqci7MjxRUgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7GFuOCH+VBi+/BNn+gEtEhnwNBXEKvISkOCtSKJmWC89tQfwzJbQzUUuIxspgR55oJGQa256PdaN8agR+IegJQJkzOGoH+tnTb5eXwoYlsN16IpgxXXJpWsQpNrytZKL5nn69KEvnqumupc0WNJd5Qmt9zyNa2jjhXT00je6Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xwYzvvE5; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5dee07e51aaso3544100a12.3
        for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 01:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740131297; x=1740736097; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DgHGvk60j/Vl/qcMIezfAgYt2qHmXNlKzysLNMFxcw8=;
        b=xwYzvvE5HRMK6Q95wj+3IEmdiNYbWm9zHk4eGyIWxwIy+MmNGzkhhZ4LNgCio2MHxb
         al3eJhmAJ+62KDEiPESAKOQE5R9Voh6tgCTvOP/gf5m1F8CsxnH90DJ4i2KAoc6h2rVz
         xauFODRloFBNU3cit1NFIAGNvBJUDvqwqvBzU8YBvnzN9nEzAhj8zmp4bEdiVxDGGtGT
         wNNy2AG8R5eJ6Po3nfAyJUHJ9Mksv08UlTtiOx3N4O7fDGPM596NN3PgJYLBuMTdR7q9
         Y3eUVMAmQW0JKX0884DY9EyQGdqcAqiI2nPB2tD6Tsc2qs+CSSe5SGsjTUCIck4SNMdf
         6xZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740131297; x=1740736097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgHGvk60j/Vl/qcMIezfAgYt2qHmXNlKzysLNMFxcw8=;
        b=iarZVoYrureOWRuemYxz/VFiVe3QoGVwZcyeJwIAYuWZmNpBOqISzURfyzhDHee/QU
         tHpq4Rdw+Oi2gzM6fUQgDZ+LZvFirHdGCWiH3NSnFELWskOAsQrVZMSvezJHT5fQSS3q
         wmH8ip+UrdffsCH+hwOC3dRtRfOHBe9a8LXN+/8mEzQ0OnA3WhjvjpfFCEQjw3WL/cmw
         WKjDm6f6RCaqpQuw7nKtJoT8RmAwdJuT/UTAAWcE1rvxvvLWzzol4/s4R5qWI1guoxZ2
         4+YOS+NlxMhAmmXw5XsDRvjXqYHYMbR140NyOdGHe0N5on1uTQ3q5RtzCNtkd3lAVehv
         2ngg==
X-Forwarded-Encrypted: i=1; AJvYcCXz8r0oDC5zzWkSd1YDIB9or36CtQfjwnBO3Uh+jewhhUjsKcRwjk3UXJxJAwnBU95bWTHSh90A@lists.linux.dev
X-Gm-Message-State: AOJu0YzrHUwKnFFQpVSYkeHWAmS/7Ve1OtPnCLn08rlyUhiPpmn63e5x
	Mmu8digOysFMHwt+OJr+Re5s3wt0x+Y3+3kVEjzZYLpvf2FujzrsC1yU9N4lSJE=
X-Gm-Gg: ASbGncslYS/K89Bc5HuwotNcS4xP9eFZH0SiGGKwz7UpLn37637mUAFI14PKfbOrHLD
	iI07GUR9qWSLk12fke57BQu9fI8JCuFCQrCUQph2bfXOad2Zr+laVadFQQnOXvEucbTvgm4iN/x
	ilbu4K35/B0kBKd3HXIrWPwIBYdgCjhogFo43AkBpUUGP169ZYH/jOUSDv4Ms7yZaVvbHlXwx1k
	aL7TohbY49WLuqU1I09qNNc6X0i7Q/N8YOkf+f7AuFdiRnBH3YliWBZhZHhz5WeuOanFvEt/XVa
	pRexN+eS+jooMEbD9vwCQTNArn7k5HU=
X-Google-Smtp-Source: AGHT+IEsyGrDlEQ3AVOyj1FyijrnT25YFiKbhs7K9ixu3igzvsVEz5e1kryk9Tyhp/G005H/Mx7cbg==
X-Received: by 2002:a17:907:9c05:b0:ab7:bf2f:422e with SMTP id a640c23a62f3a-abc09a80912mr280845366b.27.1740131297105;
        Fri, 21 Feb 2025 01:48:17 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-aba532802a1sm1616457366b.76.2025.02.21.01.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 01:48:16 -0800 (PST)
Date: Fri, 21 Feb 2025 12:48:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Martin Uecker <uecker@tugraz.at>
Cc: Greg KH <gregkh@linuxfoundation.org>, Boqun Feng <boqun.feng@gmail.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: Re: Rust kernel policy
Message-ID: <caea3e79-78e6-4d98-9f3b-f8e7f6f00196@stanley.mountain>
References: <326CC09B-8565-4443-ACC5-045092260677@zytor.com>
 <CANiq72m+r1BZVdVHn2k8XeU37ZeY6VT2S9KswMuFA=ZO3e4uvQ@mail.gmail.com>
 <a7c5973a-497c-4f31-a7be-b3123bddb6dd@zytor.com>
 <Z7VKW3eul-kGaIT2@Mac.home>
 <2025021954-flaccid-pucker-f7d9@gregkh>
 <4e316b01634642cf4fbb087ec8809d93c4b7822c.camel@tugraz.at>
 <2025022024-blooper-rippling-2667@gregkh>
 <1d43700546b82cf035e24d192e1f301c930432a3.camel@tugraz.at>
 <2025022042-jot-favored-e755@gregkh>
 <b9a5de64fe1ded2ad3111763f35af9901bd81cc4.camel@tugraz.at>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9a5de64fe1ded2ad3111763f35af9901bd81cc4.camel@tugraz.at>

On Thu, Feb 20, 2025 at 04:40:02PM +0100, Martin Uecker wrote:
> I mean "memory safe" in the sense that you can not have an OOB access
> or use-after-free or any other UB.  The idea would be to mark certain
> code regions as safe, e.g.
> 
> #pragma MEMORY_SAFETY STATIC

Could we tie this type of thing to a scope instead?  Maybe there
would be a compiler parameter to default on/off and then functions
and scopes could be on/off if we need more fine control.

This kind of #pragma is basically banned in the kernel.  It's used
in drivers/gpu/drm but it disables the Sparse static checker.

> unsigned int foo(unsigned int a, unsigned int b)
> {
>   return a * b;
> }
> 
> static int foo(const int a[static 2])
> {
>   int r = 0;
>   if (ckd_mul(&r, a[0], a[1]))
>     return -1;
>   return r;
> }
> 
> static int bar(int x)
> {
>   int a[2] = { x, x };
>   return foo(a);
> }
> 
> 
> and the compiler would be required to emit a diagnostic when there
> is any operation that could potentially cause UB.

I'm less convinced by the static analysis parts of this...  The kernel
disables checking for unsigned less than zero by default because there
are too many places which do:

	if (x < 0 || x >= 10) {

That code is perfectly fine so why is the compiler complaining?  But at
the same time, being super strict is the whole point of Rust and people
love Rust so maybe I have misread the room.

> 
> I would also have a DYNAMIC mode that traps for UB detected at
> run-time (but I understand that this is not useful for the kernel). 

No, this absolutely is useful.  This is what UBSan does now.  You're
basically talking about exception handling.  How could that not be
the most useful thing ever?

regards,
dan carpenter


