Return-Path: <ksummit+bounces-1965-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8CCA46E88
	for <lists@lfdr.de>; Wed, 26 Feb 2025 23:28:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2631B16B3A8
	for <lists@lfdr.de>; Wed, 26 Feb 2025 22:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2FE125D8EF;
	Wed, 26 Feb 2025 22:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="J0I5BcbV"
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9D225D8E2
	for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 22:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740608898; cv=none; b=pR92yyDeHPTd0xSoM0wESR1AqDaLagsSAJ01CmkYLzERemAu6+O8ceJxBaUJxcIafAH9J+rSN2HJkXSN65RHtnm/lMONUMuGXs2V984Y7jG3kXrgVhJXpPK24qGv3lW2bs3XY0PC0H0ucmRhIhGvRpfvXQ74rm/QTCs+pxh00k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740608898; c=relaxed/simple;
	bh=X14QyeY7juiG19kFhE8jOTcAC9LX5WqrcvQ1QAzL4R0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R1/BZNwAhXcXdYIxcAedbNhjr7dEqp/gy6Bcg9K2zMGCtZz3XCx1wttyUSIKR4eKK9fI5GjpfnmqMc9JK24470BdteeXIms64oIDjoq3XHb73WKTgV6tAj1iRZOkdTP0hz5GWkXVPGicAuofzD4zSmF1c05Kqi7xtnBwkMj/bgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=J0I5BcbV; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54298ec925bso363802e87.3
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 14:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740608894; x=1741213694; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wzpvSa7nrVjiWlv0eKU2ozCFswwUHSEDAs+O1FlWijQ=;
        b=J0I5BcbVKio1/Ftv1FWvCveWszA/Fozsq8Wc9bE7QhbiViN67Rv5N6VaiXCBppt6AX
         bnOni5oS0XnPEkGsicfi++pLEUm5X385mGiampbUA/70wNYlfxg17XVCxEXTqwcA4mR2
         9xnaHZrJQBA+k/1Fo4pKzkP/6T1YEHouufTKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740608894; x=1741213694;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wzpvSa7nrVjiWlv0eKU2ozCFswwUHSEDAs+O1FlWijQ=;
        b=Rq951cbuY67qSzzXiz4GhTVGw1KUoJ6wawnh/guYhODuy272E5EJGZwESU4tkGdIu/
         XkODzRAibX/XH5Pz0vhPs7ZFET+8ynlXV3Heg2QjkPmJCZUaFLCu9fNVay9wHtYx3E8j
         JJP9bI4P9HGSM/QATLf7Zw7d05dE9bRmBkcF9gkbfi+vf2jBLkiuYBUwUGmWquhi2iMc
         UepaK+5kgdHl6yFLuWT5WYfpfxjWHyUy5E+yU1EnhZz5bUr/jqX4IO2lwYtqtDQDGENw
         DpPYAWZo6vcLL8NkD18dAzbZRmdLVLlWOT4lUaVsG/4oj4QewF0twvSpWHmdgvkX421k
         HA8A==
X-Forwarded-Encrypted: i=1; AJvYcCUdUHwA/CdiyjqASGfY44xPHyZzOc8/bcnBZqqQ9OJnu3scx3IMXVUvTxrytfRBoqPSoIWaYeoo@lists.linux.dev
X-Gm-Message-State: AOJu0YzwAKO4Tw57dyNIvUmEirmlL7rM6raOtv2g05Al+nkO6la7QwBa
	f9Ri96w+DaEnZtVs0u1Cd24ZBI9PRTViAQ0qndBT9X0ScpmgsZQFggbjfesa/HsUQbk5V17RwEH
	MS99QDw==
X-Gm-Gg: ASbGncsSgbntdk2z5SpdlBJvI/7mNt48AdlDxOSRnuFQ2QIW5T83SIX+P2KP4/CaOI7
	tkwjR6UrgWJFXrxBGpOl9vQZpme4ftsAqdOhYjHOQ++hFeYeXFxvhgN12EZch1EKDDNUQcsalW0
	qZcPwr6QsdHHOOgt79u97hftTp7Kg+PrfFsEhynurQ+J5/PwsyaTyFVJQKn00gXNvtVIlVOgjT/
	Tx2O3mEYjQzE7o9D3VK+paqPskuC4CIrLmJ0PJO0s+vmGQeGauLMlb2p2dfbbdgvUtakZ1D7kzK
	wYYoUJlRJuAdiDfPHFjuFmo4xVmlIiLgSa9I/viAhng4hfzVzWd/HB7zUUZ8YAAmsh1ozaE7Iqb
	v
X-Google-Smtp-Source: AGHT+IF5yJhB0lMY3lB5mL6b/yAC2R+tFPnIjRjgCBfY/UfUKZjouYoti660jj5FQ0TojPjDFbSmXw==
X-Received: by 2002:a05:6512:12c2:b0:545:271d:f85 with SMTP id 2adb3069b0e04-5493c57ab2dmr3406617e87.29.1740608893919;
        Wed, 26 Feb 2025 14:28:13 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443b1241sm16408e87.137.2025.02.26.14.28.11
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 14:28:12 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-545284eac3bso237014e87.0
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 14:28:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWQ2SwxOfmylxAq0uHtEZYmr8KsMom7jpJukCfXTRM25j46YLrIj7AH3a02q6uUBnxhs1Ds0knn@lists.linux.dev
X-Received: by 2002:a17:906:830c:b0:abe:fffb:f1ef with SMTP id
 a640c23a62f3a-abefffbf91dmr373374066b.20.1740608562825; Wed, 26 Feb 2025
 14:22:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <20250222141521.1fe24871@eugeo> <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
 <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
 <CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com>
 <5d7363b0-785c-4101-8047-27cb7afb0364@ralfj.de> <CAHk-=wh=8sqvB-_TkwRnvL7jVA_xKbzsy9VH-GR93brSxTp60w@mail.gmail.com>
 <ed7ef66dbde453035117c3f2acb1daefa5bd19eb.camel@tugraz.at>
 <CAHk-=whLSWX=-5-z4Q8x1f_NLrHd0e3afbEwYPkkVSXj=xT-JQ@mail.gmail.com>
 <20250226162655.65ba4b51@gandalf.local.home> <CAHk-=wjAcA4KrZ-47WiPd3haQU7rh+i315ApH82d=oZmgBUT_A@mail.gmail.com>
 <20250226165619.64998576@gandalf.local.home> <20250226171321.714f3b75@gandalf.local.home>
In-Reply-To: <20250226171321.714f3b75@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Feb 2025 14:22:26 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj8Btsn0zN5jT1nBsUskF8DJoZbMiK81i_wPBk82Z0MGw@mail.gmail.com>
X-Gm-Features: AQ5f1JoQa0DT2FRkZg7eNVadgxV73SepUYePI-LWmsRCiLb5e60q_ApFv3ZzBm4
Message-ID: <CAHk-=wj8Btsn0zN5jT1nBsUskF8DJoZbMiK81i_wPBk82Z0MGw@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Martin Uecker <uecker@tugraz.at>, Ralf Jung <post@ralfj.de>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ventura Jack <venturajack85@gmail.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, 
	hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Feb 2025 at 14:12, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> I take this is what you meant by following what the code does.
>
>         r = global;
>         if (r > 1000)
>                 goto out;
>         x = r;
>
> Is the code saying to read "global" once. But today the compiler may not do
> that and we have to use READ_ONCE() to prevent it.

Exactly.

And as mentioned, as far as I actually know, neither clang nor gcc
will actually screw it up.

But the C standard *allows* the compiler to basically turn the above into:

> But if I used:
>
>         if (global > 1000)
>                 goto out;
>         x = global;

which can have the TUCTOU issue because 'global' is read twice.

> I guess this is where you say "volatile" is too strong, as this isn't an
> issue and is an optimization the compiler can do.

Yes. 'volatile' is horrendous. It was designed for MMIO, not for
memory, and it shows.

Now, in the kernel we obviously use volatile for MMIO too, and in the
context of that (ie 'readl()' and 'writel()') it's doing pretty much
exactly what it should do.

But in the kernel, when we use 'READ_ONCE()', we basically almost
always actually mean "READ_AT_MOST_ONCE()". It's not that we
necessarily need *exactly* once, but we require that we get one single
stable value).

(And same for WRITE_ONCE()).

We also have worried about access tearing issues, so
READ_ONCE/WRITE_ONCE also check that it's an atomic type etc, so it's
not *purely* about the "no rematerialization" kinds of issues. Again,
those aren't actually necessarily things compilers get wrong, but they
are things that the standard is silent on.

              Linus

