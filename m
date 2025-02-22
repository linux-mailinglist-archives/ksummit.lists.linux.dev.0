Return-Path: <ksummit+bounces-1851-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 772F9A40BCB
	for <lists@lfdr.de>; Sat, 22 Feb 2025 22:47:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCF5519C05D4
	for <lists@lfdr.de>; Sat, 22 Feb 2025 21:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56FF72045BF;
	Sat, 22 Feb 2025 21:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fFMeW0+N"
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B7A19E83E
	for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 21:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740260817; cv=none; b=K5vVKw1MpOJAyiQJFrhoOxGE7XUzPj1u97/YWByC1H/vOlLba/nBZa6yKM6SCdq4t9Jm9/GUO3ZbSnVARyJNvLSLOLVvC/P1ZxKW7D9OYYOPmjeMrqyJceGo6V8gzftd4TRZKltaZvSkHpTcz4CUk5aSEj9A/cMH/SKY/oM1oNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740260817; c=relaxed/simple;
	bh=R/cqKSeDckVDEF7yPpH+aIK1cWmoP4uCgucXOhuI4zE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wv8KzSqfDld3JhnYlam2hkZpwtgijtT9w2bJiY6W7g9e+dRg68cHIYsbq04KKkcJSOB8Bo3Gw+dx6NO/q9ymWUpUsnUvQoRPJhj8/GEnRkK1/0pi6Kd2XtCSpp76J3KxZeEryFhAwpZAjMR6sSnhLy3eeBDg5RsBBy0BYO3mY8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=fFMeW0+N; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aaeec07b705so517977666b.2
        for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 13:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740260812; x=1740865612; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TIAnEzzzjax0vkLbj+pBB4HtwVvgwKWI24/rmxYjENo=;
        b=fFMeW0+N2nzr8TaFtbUG6yQaDkTisY44b7kqcy/xZEjmRfritUDp5vUm2y6LxlKp2I
         ZstpIKxFZW/kUe/VBoo4MHvoGs/nm08NWqkVb9jgCBgcIrkMDIP6eviQVamQevYbLYnB
         Q5JcXh83iib3iPrPxvj4iFjmRuqfkTXe7jmFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740260812; x=1740865612;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TIAnEzzzjax0vkLbj+pBB4HtwVvgwKWI24/rmxYjENo=;
        b=K1rhqytOKuzPzALrn6NaxFgtrr4LXFiRpt+s+nJj0KTPfIFzmdHLmkQmZ4xnzwV6T2
         7Z/LdhP8jSFVJDu+b2LbghqB1xLbud+AW2HUegaW89HjvugkKQF2G+TJ0UQBNrrmq+vd
         hLTXV8YzN8yiRX30NN/7G1WzhRtykpXzhrZz4b6Kpis/oDddzA/E5LynYE5KryAQY6vt
         zkwDdtFuAY/uzgK0IZI75DTmKsZeQFMiDvNOBLTaReD+3gERpYegLCrvBOM7RW5ZP+lz
         mZ1pPSIeowZ6ylvYCTHf3NF71rGiaAleEDGCB/YaFTgoOn8DubWPmA4T7VIzOYliPUEE
         JsPw==
X-Forwarded-Encrypted: i=1; AJvYcCWcoxjviXaqT5Yu20wJLV8S02oYoxwOd0ReSwVpw0AM6RAZBOKmzRN+yXIEBoq2OOkn3dvT3Yo6@lists.linux.dev
X-Gm-Message-State: AOJu0YzIndcVVNvqDB5U0/Qq6apdAEwmazjcasrDASJROsPFHh7GI//x
	iluD5lahErNecnr5tO0B6BqpVBH5gJqw/o2KBkkNT7Lk1To+NQSV4jHPs3A5WW2TM3Dkn523+ow
	7t9w=
X-Gm-Gg: ASbGncvQJ1Zc8YUY3evJ7SGrZos3AlmA4P+m8ughnHLDWeTVgr3R47mFZh7dYpfJvrq
	K512YeXDm2Vki3ImodPWmyuXuTm73xp6nVZiRXrgVApJIf2uzlqEMhVw+H+KQ22QY13lT0tROCq
	8jG7WBqkia+CsnozKuEwaOeBJdYf9jdogmjdeni8glkkZGQIKa4CWB5rTTbEzK7jwdBZr2cqoaC
	UN4Syl8pZVGeDyihD2gRmVSax5sSI7qYQc3RZlFROJ1L+qCeoYsVT2kv9980PMQX4/QIAtx6zYb
	iHUTtn3+5wAEN5CSW2iJxjT5PpyN+aHsO7YSh0FXx3MZS0RAT/nstB53OlQNM/U/oC5EPJeyS8i
	u
X-Google-Smtp-Source: AGHT+IGkkKJYqJrwoN3rOC04aEBIMnyMavQLNi6OHNki0YxtzemOH007I+Ua3d88oahqi3FEplD/Aw==
X-Received: by 2002:a17:906:6a02:b0:ab7:b9b5:60e7 with SMTP id a640c23a62f3a-abc0de0dfbfmr706094266b.40.1740260812283;
        Sat, 22 Feb 2025 13:46:52 -0800 (PST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb98640619sm1284653166b.54.2025.02.22.13.46.51
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Feb 2025 13:46:51 -0800 (PST)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaeec07b705so517974066b.2
        for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 13:46:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVSWu0x/Inq3qVHFVau8SmmnFBHPm0N6EItYus6zbNyReVaEqjxK2CSCzJeNhPooL59FRFxckAU@lists.linux.dev
X-Received: by 2002:a17:907:970c:b0:abb:d047:960b with SMTP id
 a640c23a62f3a-abc0d9885e7mr719250966b.4.1740260810677; Sat, 22 Feb 2025
 13:46:50 -0800 (PST)
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
 <yuwkqfbunlymofpd4kpqmzpiwbxxxupyj57tl5hblf7vsvebhm@ljz6u26eg5ft>
 <6EFFB41B-9145-496E-8217-07AF404BE695@zytor.com> <c3spwcoq7j4fx5yg4l7njeiofhkaasbknze3byh4dl45yeacvr@rb6u6j5kz7oe>
In-Reply-To: <c3spwcoq7j4fx5yg4l7njeiofhkaasbknze3byh4dl45yeacvr@rb6u6j5kz7oe>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 22 Feb 2025 13:46:33 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi0UmOAhyDjOeCJcL7eEt+ygKnMqtx+RcHtzZGd7OY4Kw@mail.gmail.com>
X-Gm-Features: AWEUYZlfgH2FWGDgxF-FUknCaXkkoysm8XxdV5A68axeTzsJ2Kz9bsbxjCAZi30
Message-ID: <CAHk-=wi0UmOAhyDjOeCJcL7eEt+ygKnMqtx+RcHtzZGd7OY4Kw@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Ventura Jack <venturajack85@gmail.com>, Gary Guo <gary@garyguo.net>, 
	airlied@gmail.com, boqun.feng@gmail.com, david.laight.linux@gmail.com, 
	ej@inai.de, gregkh@linuxfoundation.org, hch@infradead.org, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 22 Feb 2025 at 13:22, Kent Overstreet <kent.overstreet@linux.dev> wrote:
>
> Power hungry and prone to information leaks, though.

The power argument is bogus.

The fact is, high performance is <i>always</i> "inefficient". Anybody
who doesn't understand that doesn't understand reality.

And I very much say "reality". Because it has nothing to do with CPU
design, and everything to do with "that is how reality is".

Look at biology. Look at absolutely <i>any</i> other area of
technology. Are you a car nut? Performance cars are not efficient.

Efficiency comes at a very real cost in performance. It's basically a
fundamental rule of entropy, but if you want to call it anything else,
you can attribute it to me.

Being a high-performance warm-blooded mammal takes a lot of energy,
but only a complete nincompoop then takes that as a negative. You'd be
*ignorant* and stupid to make that argument.

But somehow when it comes to technology, people _do_ make that
argument, and other people take those clowns seriously. It boggles the
mind.

Being a snake is a _hell_ of a lot more "efficient". You might only
need to eat once a month. But you have to face the reality that that
particular form of efficiency comes at a very real cost, and saying
that being "cold-blooded" is more efficient than being a warm-blooded
mammal is in many ways a complete lie and is distorting the truth.

It's only more efficient within the narrow band where it works, and
only if you are willing to take the very real costs that come with it.

If you need performance in the general case, it's not at all more
efficient any more: it's dead.

Yes, good OoO takes power. But I claim - and history backs me up -
that it does so by outperforming the alternatives.

The people who try to claim anything else are deluded and wrong, and
are making arguments based on fever dreams and hopes and rose-tinted
glasses.

It wasn't all that long ago that the ARM people claimed that their
in-order cores were better because they were lower power and more
efficient. Guess what? When they needed higher performance, those
delusions stopped, and they don't make those stupid and ignorant
arguments any more. They still try to mumble about "little" cores, but
if you look at the undisputed industry leader in ARM cores (hint: it
starts with an 'A' and sounds like a fruit), even the "little" cores
are OoO.

The VLIW people have proclaimed the same efficiency advantages for
decades. I know. I was there (with Peter ;), and we tried. We were
very very wrong.

At some point you just have to face reality.

The vogue thing now is to talk about explicit parallelism, and just
taking lots of those lower-performance (but thus more "efficient" -
not really: they are just targeting a different performance envelope)
cores perform as well as OoO cores.

And that's _lovely_ if your load is actually that parallel and you
don't need a power-hungry cross-bar to make them all communicate very
closely.

So if you're a GPU - or, as we call them now: AI accelerators - you'd
be stupid to do anything else.

Don't believe the VLIW hype.  It's literally the snake of the CPU
world: it can be great in particular niches, but it's not some "answer
to efficiency". Keep it in your DSP's, and make your GPU's use a
metric shit-load of them, but don't think that being good at one thing
makes you somehow the solution in the general purpose computing model.

It's not like VLIW hasn't been around for many decades. And there's a
reason you don't see it in GP CPUs.

                Linus

