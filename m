Return-Path: <ksummit+bounces-1979-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E8CA4757D
	for <lists@lfdr.de>; Thu, 27 Feb 2025 06:54:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77C8917067D
	for <lists@lfdr.de>; Thu, 27 Feb 2025 05:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852C1221F2A;
	Thu, 27 Feb 2025 05:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dAsesN0q"
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B713121773C
	for <ksummit@lists.linux.dev>; Thu, 27 Feb 2025 05:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740635557; cv=none; b=D23ydtsGQKHp8DAbj8gjeFzP5ngWxR2cprZ53+ZFGLYJi/IzZkCM9Z85f2gcCDIwf85dxPBw/RjtDJ6/ja4Nn955LC2L6jLlxeZ5f0x/8pBhwYKKHDtyertDYHSJn/wgJRMchlX5goXS+MSM1ufPKbYK/DxQF5l5hLLuj4qgdO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740635557; c=relaxed/simple;
	bh=9BL4zTaSs8TFLGt8qDCuYMxE7mnal2Tr/3pr4sM0MIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ubFjqmwJEQc317DjZHAG+6mg/Du/mtzhhkwUKQfXCipCZ5+ag6aElhUIQvCB2kzwhp1IjvqccGvAzIn/xI5dCeXigVYJuD8BzZN/WdnOwf2aTIS3B9o9N9ViROfiqMQxMHioMoyXhM9sm2iZJ1PrcnCr/O8QNukdvLP6O/r2/Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dAsesN0q; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abee54ae370so74037866b.3
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 21:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740635553; x=1741240353; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yz1jEtAoGS03tODgTdGrnTdX9a769lSb4ISg5vXSoA0=;
        b=dAsesN0q043uVt9vEaXUYaya6F4BumcAECfx3wdzYgCJmGdQyxWlrwLYlknoyK+JIK
         uZDKa+wu4kEOPrQ9nZ97uii33a9zZRhZPqLpk0Na1iLIQMttE5U2u70k3dsznAbRb6de
         vJ++YW+t2fNV8/rwU448EpxaPGjoklMaQGv68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740635553; x=1741240353;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yz1jEtAoGS03tODgTdGrnTdX9a769lSb4ISg5vXSoA0=;
        b=JGcBkIQ30AgAeFWOnfASM3vXhxxA3ihFTEJBz71gGH2qVH75LzElKSXdFVksPgn/cy
         JbUm4Oqw3k31vmx7iwpSArEYksvozCqPmJC343Nc5WB2zVSGpGq403ocLpt03lbHZ/5e
         yqKwPY8jfr/+Tz58JfFfpLLUVg5d4HpoCGZGQA8QgiJDlzOluUG/XFQ3L5doxYRQOnQE
         Xe3YExm7hgJwUC+be8immouJO/Y4KoJyQ5EIf+dLzQ3b9dTroLqPTrjAWHXyqq0S0IwX
         jZIRAmBTtfIal0YXuuawzxrQW9R9oSxXjPolaBXkmpCiaKWzdCgCYhlcNGTJnZbXSGHa
         QstQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrC/+ibk1Nkd8svJYQmIZW5VF6B1Nm9eQWd9SvocGfDP+WBjZApreD5quQzfTxfOJA6ZLGe5gM@lists.linux.dev
X-Gm-Message-State: AOJu0YyiMYEhURY8ok6b+DnctXBuWx8ny3fkr/tPKKHlHE6auIeXiYSi
	kLFHsy7un5bHPBKU9k8mVX5WPKZyfAcN1DXIdnbk6PfBhUgBwhKe3EW1WQczeT4aV2K9R7VWvMK
	JYZn+Eg==
X-Gm-Gg: ASbGncsgQ5Mhxb4Stnnfjs35Eo9FbZ/VRNGodLvjLFbQngdqO19IuZWWRZee1YaR9KM
	F2PIJ6LhAowQ379MS9QtNXif4wp80YjhPPEuGl0/KQ8bhDdSgaiTKalaHXrpEUNPtx5Geh5rCvk
	UwAMsTSeI1FFek5w3qyLdZtGV0FVHhZDB+gzHgIhWGGcCiNUVt7M6WZ74rJSHQPMgYpIYYRIc4n
	7CnUo8Fo2A+xblNvyykSy44F964UFlbZ7FZdV7yBYJbFAv0pEmlt17uzJOPUtg+AEPaQaJWOSNh
	duwDI6RJcUw2Lfs3RHDtjIlWPB2Q7E77NXsj5cXgfWSJSvkwgEngGp1HJXDjDWgavP+IkgUoxm7
	3
X-Google-Smtp-Source: AGHT+IGfcTvt4nxXECpgyZjy6+m1GodXZwHFkRbU9Z/6q20ZcNisuq8Ekd7i0w1ed+Ys8f50TGjwZQ==
X-Received: by 2002:a17:907:7da6:b0:abb:e207:f3ab with SMTP id a640c23a62f3a-abeeee32706mr816003966b.19.1740635552719;
        Wed, 26 Feb 2025 21:52:32 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c756f6csm65282366b.141.2025.02.26.21.52.30
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 21:52:31 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-abee54ae370so74033566b.3
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 21:52:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXwBcTqaRSBaF9Xthd9tG1MpJ13R+YLcNvTMju5i8VIWj+AmiNKiY/KpCk07k4ZuaQ35tyuoqyE@lists.linux.dev
X-Received: by 2002:a17:907:a42:b0:abe:cecc:727 with SMTP id
 a640c23a62f3a-abeeefc9108mr925171166b.53.1740635549770; Wed, 26 Feb 2025
 21:52:29 -0800 (PST)
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
 <CAHk-=whLSWX=-5-z4Q8x1f_NLrHd0e3afbEwYPkkVSXj=xT-JQ@mail.gmail.com> <09e282a9c02fb07ba4fc248f14c0173d9b19179a.camel@tugraz.at>
In-Reply-To: <09e282a9c02fb07ba4fc248f14c0173d9b19179a.camel@tugraz.at>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Feb 2025 21:52:13 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjqmHD-3QQ_9o4hrkhH57pTs3c1zuU0EdXYW23Vo0KTmQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jp_NrFySgQyMF9RUCoV9O6uCZpLaodGvsiFnQE8IzSzYGK1vSJBzFxb9cE
Message-ID: <CAHk-=wjqmHD-3QQ_9o4hrkhH57pTs3c1zuU0EdXYW23Vo0KTmQ@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Martin Uecker <uecker@tugraz.at>
Cc: Ralf Jung <post@ralfj.de>, "Paul E. McKenney" <paulmck@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ventura Jack <venturajack85@gmail.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, 
	hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Feb 2025 at 20:18, Martin Uecker <uecker@tugraz.at> wrote:
>
> This is not really related to "observable" but to visibility
> of stores to other threads.

Yes? What's the difference?

Threading is a fundamental thing. It didn't *use* to be fundamental,
and yes, languages and CPU architectures were designed without taking
it into account.

But a language that was designed this century, wouldn't you agree that
threading is not something unusual or odd or should be an
after-thought, and something as basic as "observable" should take it
into account?

Also note that "visibility of stores to other threads" also does mean
that the loads in those other threads matter.

That's why rematerializing loads is wrong - the value in memory may
simply not be the same value any more, so a load that is
rematerialized is a bug.

> It sounds you want to see the semantics strengthened in case
> of a data race from there being UB to having either the old
> or new value being visible to another thread, where at some
> point this could change but needs to be consistent for a
> single access as expressed in the source code.

Absolutely.

And notice that in the non-UB case - ie when you can rely on locking
or other uniqueness guarantees - you can generate better code.

So "safe rust" should generally not be impacted, and you can make the
very true argument that safe rust can be optimized more aggressively
and migth be faster than unsafe rust.

And I think that should be seen as a feature, and as a basic tenet of
safe vs unsafe. A compiler *should* be able to do better when it
understands the code fully.

> There would certainly be opposition if this fundamentally
> diverges from C++ because no compiler framework will seriously
> consider implementing a completely different memory model
> for C (or for Rust) than for C++.

Well, if the C++ peoiple end up working on some "safe C" model, I bet
they'll face the same issues.

> I could also imagine that the problem here is that it is
> actually very difficult for compilers to give the guarantess
> you want, because they evolved from compilers
> doing optimization for single threads and and one would
> have to fix a lot of issues in the optimizers.  So the
> actually problem here might be that nobody wants to pay
> for fixing the compilers.

I actually suspect that most of the work has already been done in practice.

As mentioned, some time ago I checked the whole issue of
rematerializing loads, and at least gcc doesn't rematerialize loads
(and I just double-checked: bad_for_rematerialization_p() returns true
for mem-ops)

I have this memory that people told me that clang similarly

And the C standards committee already made widening stores invalid due
to threading issues.

Are there other issues? Sure. But remat of memory loads is at least
one issue, and it's one that has been painful for the kernel - not
because compilers do it, but because we *fear* compilers doing it so
much.

           Linus

