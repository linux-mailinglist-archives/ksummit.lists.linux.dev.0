Return-Path: <ksummit+bounces-1684-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 169D0A3AC12
	for <lists@lfdr.de>; Tue, 18 Feb 2025 23:55:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BFB618902C2
	for <lists@lfdr.de>; Tue, 18 Feb 2025 22:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7CAC1DC185;
	Tue, 18 Feb 2025 22:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f3IOyVMR"
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F311D7E4F
	for <ksummit@lists.linux.dev>; Tue, 18 Feb 2025 22:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739919294; cv=none; b=MqwTu3BdMeCtoxzLuvkAmpXzTq+sloHfi+/XAOTuaRCqnLYMZ1VoSocDVnW3/PLc3RDn7cOPaLphT87gMsG4Ifo1kXoYv9ECujL8qzZ/cgn8iIKmd6DMoyJhiV5U64NSzVY7/FKJ/u2oo+fC7wybhG6Mb5ucdrD8aOT6RtvZ0mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739919294; c=relaxed/simple;
	bh=NHZ5tgatG1hk5aXhyUIk7AxfbmXlungsl+QkbaLBUtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YbPs+vfXeAkf9x26RRHBfDWcdbYrySmoQPkik0fKqWyYnQReJKkDH9xSb15Z+ck7k95SOs7AkFlH0zjIZ5ev7r1x0qjKrFUOhLY5g/JwEEYRNVJcSe8OcABSAEt9kZZI/gn2rJ1e6hM1NQyoVO1p2bgBLBL9l5ubwN5PLNNQWRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f3IOyVMR; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2fc288da33eso1059191a91.0
        for <ksummit@lists.linux.dev>; Tue, 18 Feb 2025 14:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739919292; x=1740524092; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drvJ3mqMM3e9qG8aW2Y2X9PovJqvp/GsC2QW7NPY4D0=;
        b=f3IOyVMRRmSGMclQNnTs9lChkbdAMzWoMk8Wgmwu2y4r8bYLLQ9XYWBAscVk7PIOCV
         Q8/j8bpAy/7WNp7slFR4gCMsrADYaaSphP3vVA5ymnyX68lDT++sSkEZK3bZaKuhFB7d
         uYVrZyE3bmGAkHzdZ9P1cSniCQb2seg37RGBScWdFVos+8dprViHduheT+tlMbPb19s0
         vhBuuYcLPVY3TrlYcPDLKoGZcHNeDEeV2wS8IUXJf2po5LO4mj53XKznfG/JSb2JTtRB
         KHqpuE6+e7/0pEQTnRofB/lS7ejVnDx0QJuUGzjMyePYRUjPH5dWauJ29a1k/YfS9cqj
         18iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739919292; x=1740524092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=drvJ3mqMM3e9qG8aW2Y2X9PovJqvp/GsC2QW7NPY4D0=;
        b=jAZ0/hCSfjdA49mcMr2JVDoTz0HExIHmRN8nJvNyci0VKEirKY8c8JeyyZTRZlZyqg
         b1ZVKdQiaBP3Imboxo2Sd2Z18exw3Dw3neIjnb+qiMFDL15q5v/C9Z6QdRCQkuGg1ACT
         /KBRC3KwkyuemQhmCbFdaJHNNi/2od8AE9jJezbfky7efChObzR9ipTOSvImbrEg902X
         DFaQg4eKu9NlVIi+eTU3TxOrZRMEszS4RBqgj3n3+CLdA1nJbqBpHHNTRhuEeU6qw0kg
         ljKOD4N1B9JYe+MUqM2V7dKbC3QiB2f9dSzheFzjRC2u/IBw6eFDLoGgl7aSYfHQaCYR
         kdjA==
X-Forwarded-Encrypted: i=1; AJvYcCWRZZY0X+4oJklQBIVclLv7t0F6EOoTvTfXbKcp5PNk744XWds3gJEuLG3IxtmbWyWSfQHAB4Nu@lists.linux.dev
X-Gm-Message-State: AOJu0YxyC+PJlQ6kDDQhFDJAxxnwD+xygqnlEwhdAiXp2NbdJ+i8EYmg
	FuR9nts6tCDCLtcX5XLQ9pzZrb/kn9/6v5c1WoPEOwQgupeLsXk/4W+h1D03CmjWQVeybtawsFV
	mqg2/19kgyCOuUQ8WrxwXqzJ/dhY=
X-Gm-Gg: ASbGnctnom9CSk4xA8mhTAj1u2hV/h/kVo7h4h8rPbZBCQ1IaPYyMgoS3BODWsNsDzo
	RKT2wi6gon09vscZnpjV+/CmGHzC1D5xWuH6ZKCNP2CcYhn5aZp+NF0uXGimgfYx3TyYK4PLc
X-Google-Smtp-Source: AGHT+IEtCTBGqOQRC9rNZdOYUBN5s1vmNJEBcjEH/ezu3SeAnZEITW7yhuB8ayvKj8UwfukXpAApynYvYC2ttiDTVus=
X-Received: by 2002:a17:90b:3504:b0:2fc:f63:4b6a with SMTP id
 98e67ed59e1d1-2fc4078f0a1mr9513326a91.0.1739919291778; Tue, 18 Feb 2025
 14:54:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
 <Z7SwcnUzjZYfuJ4-@infradead.org> <CANiq72myjaA3Yyw_yyJ+uvUrZQcSLY_jNp65iKH8Y5xGY5tXPQ@mail.gmail.com>
 <326CC09B-8565-4443-ACC5-045092260677@zytor.com>
In-Reply-To: <326CC09B-8565-4443-ACC5-045092260677@zytor.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 18 Feb 2025 23:54:39 +0100
X-Gm-Features: AWEUYZllVlCBOkeQTx7fTLjoA285Tdhin73DUOICR9PC8JCLOM4rew0tsCSZ4zc
Message-ID: <CANiq72m+r1BZVdVHn2k8XeU37ZeY6VT2S9KswMuFA=ZO3e4uvQ@mail.gmail.com>
Subject: Re: Rust kernel policy
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Christoph Hellwig <hch@infradead.org>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 10:49=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wro=
te:
>
> I have a few issues with Rust in the kernel:
>
> 1. It seems to be held to a *completely* different and much lower standar=
d than the C code as far as stability. For C code we typically require that=
 it can compile with a 10-year-old version of gcc, but from what I have see=
n there have been cases where Rust level code required not the latest bleed=
ing edge compiler, not even a release version.

Our minimum version is 1.78.0, as you can check in the documentation.
That is a very much released version of Rust, last May. This Thursday
Rust 1.85.0 will be released.

You can already build the kernel with the toolchains provided by some
distributions, too.

I think you may be referring to the "unstable features". There remain
just a few language features (which are the critical ones to avoid
source code changes), but upstream Rust is working to get them stable
as soon as possible -- the Linux kernel has been twice, in 2024H2 and
2025H1, a flagship goal of theirs for this reason:

    https://rust-lang.github.io/rust-project-goals/2025h1/goals.html#flagsh=
ip-goals
    https://rust-lang.github.io/rust-project-goals/2024h2/index.html

Meanwhile that happens, upstream Rust requires every PR to
successfully build a simple configuration of the Linux kernel, to
avoid mistakenly breaking us in a future release. This has been key
for us to be able to establish a minimum version with some confidence.

This does not mean there will be no hiccups, or issues here and there
-- we are doing our best.

> 2. Does Rust even support all the targets for Linux?

Rust has several backends. For the main (LLVM) one, there is no reason
why we shouldn't be able to target everything LLVM supports, and we
already target several architectures.

There is also a GCC backend, and an upcoming Rust compiler in GCC.
Both should solve the GCC builds side of things. The GCC backend built
and booted a Linux kernel with Rust enabled a couple years ago. Still,
it is a work in progress.

Anyway, for some of the current major use cases for Rust in the
kernel, there is no need to cover all architectures for the time
being.

> 3. I still feel that we should consider whether it would make sense to co=
mpile the *entire* kernel with a C++ compiler. I know there is a huge amoun=
t of hatred against C++, and I agree with a lot of it =E2=80=93 *but* I fee=
l that the last few C++ releases (C++14 at a minimum to be specific, with C=
++17 a strong want) actually resolved what I personally consider to have be=
en the worst problems.

Existing Rust as a realistic option nowadays, and not having any
existing C++ code nor depending on C++ libraries, I don't see why the
kernel would want to jump to C++.

> As far as I understand, Rust-style memory safety is being worked on for C=
++; I don't know if that will require changes to the core language or if it=
 is implementable in library code.

Rust-style memory safety for C++ is essentially the "Safe C++"
proposal. My understanding is that C++ is going with "Profiles" in the
end, which is not Rust-style memory safety (and remains to be seen how
they achieve it). "Contracts" aren't it, either.

My hope would be, instead, that C is the one getting an equivalent
"Safe C" proposal with Rust-style memory safety, and we could start
using that, including better interop with Rust.

> David Howells did a patch set in 2018 (I believe) to clean up the C code =
in the kernel so it could be compiled with either C or C++; the patchset wa=
sn't particularly big and mostly mechanical in nature, something that would=
 be impossible with Rust. Even without moving away from the common subset o=
f C and C++ we would immediately gain things like type safe linkage.

That is great, but that does not give you memory safety and everyone
would still need to learn C++.

Cheers,
Miguel

