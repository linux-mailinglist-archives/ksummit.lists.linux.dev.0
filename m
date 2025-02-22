Return-Path: <ksummit+bounces-1844-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9198AA40B5C
	for <lists@lfdr.de>; Sat, 22 Feb 2025 20:20:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B7D719C1BF5
	for <lists@lfdr.de>; Sat, 22 Feb 2025 19:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BF84211A36;
	Sat, 22 Feb 2025 19:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="HY1LTexg"
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E3914659A
	for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 19:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740251936; cv=none; b=kJY019IpB5YXHt7rNQLP9/Q9Nfsm+MHLzJA1HwRK1Z3AWARJV3hInLofXBK+ZGvdTAidMQ0HkEf92h/b81S68+N7oOYVPFA4SL8frLbWte7Bpu+1u6/iXDaoSuy1Yp5ftmt+dMPJIBYObXmhnxLa6dIbYqEAufRVKaTn3l9Cbog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740251936; c=relaxed/simple;
	bh=EzT1g5FwFw69UDBYQDzjBiLobs2dYIYvZzFfhBYPdIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JLOVTnbmknUDIv/hPxSknBBD4juAD4IHJa5mrlC7xT79PPtUH2eaE1Lme9OA9syC8vS//04VVB2VPs4DD/Wm2I0oVc3j8qaBMKA+PQLmPjRKknZWy1dNjpcR2xBEkSLbr+lhGQtjE50tU2HtMhPityaGwAFhy5kpScdWT48vPjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=HY1LTexg; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-abbdc4a0b5aso595293766b.0
        for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 11:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740251933; x=1740856733; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0Xzl2/w9nsMmIh5i8j2sKE6LkAdctHwz3MFgW7DcHyk=;
        b=HY1LTexgxcvMgWX/HmiyEiD5kR1B0Ox5daAEdfRYNd8QtAFo0tAPuKDx/yRJM3rFEM
         JLnv0QLx7ZbntzNatcpjCgoBK9Z00YZkJr6PB+4VR56A8YEe/a4sNp+QwqbjZwcI5mUG
         9Ho0R91Sb+2cGv7PfPRtkZy+gBFdddcY+R+l0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740251933; x=1740856733;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Xzl2/w9nsMmIh5i8j2sKE6LkAdctHwz3MFgW7DcHyk=;
        b=qvFZPH6wKR6zlYqMCt25ibfN1NqzgDZTfbMcVQkq7m5uJb5BmXLTGtrcOQDfLKGBvz
         KAp83Po1g3dZHCovDajgg52CylUrq58njD6M6uRCTOouGd5j3mwN+5mdVw2FBGMetPKf
         EQj89fS/7s/V9SQMIdYXg04Gfdh6xY2VFCOBKbtMt3RtACwaNWTwrdfSOrZ0Huv7JPkA
         hILye3e1VhZbah5ETXB350gUtAqmu+v9SjNv0yfljx7os6dqPa7aPxcR6bHG/h5sD0n1
         4tbnXoVnTHyRg33tTCz7nQdcJpSMyXpsumtdXB1b43gft6li9SVKCthoYMVqECHXMh7B
         qHmA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ3tDf9WGplFcbo4vXK8uamdstesnx5DomiKN+dMrXgpjbXmWP0XJWBGgXJ6+7116XNdaDU4pS@lists.linux.dev
X-Gm-Message-State: AOJu0YzyQ4VliuVHUUBC+kFLH8EyXrizQnKlqnLbamv9yewVhXxBH5Ho
	uv+Yh6Bv2j6OKA2HLkYp0O7pxn0nHB1yrdm3rlwHdWWw2PxKQVrbS6fy8LfDy4aaTjFCbZY0nkx
	0UYE=
X-Gm-Gg: ASbGncvXUc1rZwJKb4lTHynS/JoJr/efX/OHiJb1aq1WXFaKqg4ggs3Rh+WH7cxAJhj
	wFcX9faRRuJq0tEfmqv+RIilddqi94rbcoGZquIMMJmuUkeV5nvmCFoQDcES8lOaQy2fEO2XYlo
	wEXO5s6pWIrsk2BgdnwqY+V2jYu6X8MXTPfS8aFXBAHXCFDWrVi3pA+F548BAr32/TIlGw0PoZF
	t9dlXiLhbsqsaEOFmHQgSCtCeHkOArMQOk47Wet0j2Hms6gQTczt/OEJxRyL236hfrZH5JAbmjn
	3ZXNGz3r/7feRi92BLLVpcGg0xWfJgde0AXmh3fWmoxUUd/ykeByaw6vvB/kajgy/56kIC7y40U
	3
X-Google-Smtp-Source: AGHT+IHW+Sml8eb6V33Tyh8822fS+R2/5/gdV6NezT8gYGnUlnMlEBEGCOnjSeWALIf/4gcfMs08DA==
X-Received: by 2002:a17:907:784f:b0:abb:b24d:c63e with SMTP id a640c23a62f3a-abc0ae910famr652223166b.16.1740251932649;
        Sat, 22 Feb 2025 11:18:52 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532594a0sm1932183366b.68.2025.02.22.11.18.50
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Feb 2025 11:18:52 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abbdf897503so715341366b.0
        for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 11:18:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWhT4FKj1DXA2NhmyzPhxH61fM9nLYYw7o6GiNdgcXHt59mbx4XE9QjIqbbHJkiqepNypOt8YiM@lists.linux.dev
X-Received: by 2002:a17:907:7744:b0:ab7:d34a:8f83 with SMTP id
 a640c23a62f3a-abc0ae94ed6mr697861966b.17.1740251930006; Sat, 22 Feb 2025
 11:18:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <20250222141521.1fe24871@eugeo> <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
In-Reply-To: <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 22 Feb 2025 11:18:33 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
X-Gm-Features: AWEUYZnYn9FC1D3iPga4e5fosxwJzgzYfFpxBBvQVXYxwhFF0dkV8v7eiQuqia8
Message-ID: <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Ventura Jack <venturajack85@gmail.com>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 22 Feb 2025 at 10:54, Kent Overstreet <kent.overstreet@linux.dev> wrote:
>
> If that work is successful it could lead to significant improvements in
> code generation, since aliasing causes a lot of unnecessary spills and
> reloads - VLIW could finally become practical.

No.

Compiler people think aliasing matters. It very seldom does. And VLIW
will never become practical for entirely unrelated reasons (read: OoO
is fundamentally superior to VLIW in general purpose computing).

Aliasing is one of those bug-bears where compiler people can make
trivial code optimizations that look really impressive. So compiler
people *love* having simplistic aliasing rules that don't require real
analysis, because the real analysis is hard (not just expensive, but
basically unsolvable).

And they matter mainly on bad CPUs and HPC-style loads, or on trivial
example code. And for vectorization.

And the sane model for those was to just have the HPC people say what
the aliasing rules were (ie the C "restrict" keyword), but because it
turns out that nobody wants to use that, and because one of the main
targets was HPC where there was a very clear type distinction between
integer indexes and floating point arrays, some "clever" person
thought "why don't we use that obvious distinction to say that things
don't alias". Because then you didn't have to add "restrict" modifiers
to your compiler benchmarks, you could just use the existing syntax
("double *").

And so they made everything worse for everybody else, because it made
C HPC code run as fast as the old Fortran code, and the people who
cared about DGEMM and BLAS were happy. And since that was how you
defined supercomputer speeds (before AI), that largely pointless
benchmark was a BigDeal(tm).

End result: if you actually care about HPC and vectorization, just use
'restrict'. If you want to make it better (because 'restrict'
certainly isn't perfect either), extend on the concept. Don't make
things worse for everybody else by introducing stupid language rules
that are fundamentally based on "the compiler can generate code better
by relying on undefined behavior".

The C standards body has been much too eager to embrace "undefined behavior".

In original C, it was almost entirely about either hardware
implementation issues or about "you got your pointer arithetic wrong,
and the source code is undefined, so the result is undefined".
Together with some (very unfortunate) order of operations and sequence
point issues.

But instead of trying to tighten that up (which *has* happened: the
sequence point rules _have_ actually become better!) and turning the
language into a more reliable one by making for _fewer_ undefined or
platform-defined things, many C language features have been about
extending on the list of undefined behaviors.

The kernel basically turns all that off, as much as possible. Overflow
isn't undefined in the kernel. Aliasing isn't undefined in the kernel.
Things like that.

And making the rules stricter makes almost no difference for code
generation in practice. Really. The arguments for the garbage that is
integer overflow or 'strict aliasing' in C were always just wrong.

When 'integer overflow' means that you can _sometimes_ remove one
single ALU operation in *some* loops, but the cost of it is that you
potentially introduced some seriously subtle security bugs, I think we
know it was the wrong thing to do.

             Linus

