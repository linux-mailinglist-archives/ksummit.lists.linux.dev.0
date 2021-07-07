Return-Path: <ksummit+bounces-306-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C03B3BED89
	for <lists@lfdr.de>; Wed,  7 Jul 2021 19:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 4EEAB1C0EC9
	for <lists@lfdr.de>; Wed,  7 Jul 2021 17:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8798C2F80;
	Wed,  7 Jul 2021 17:54:58 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DDA72
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 17:54:57 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id f12so3731651ils.11
        for <ksummit@lists.linux.dev>; Wed, 07 Jul 2021 10:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XTCUPFHB/zsSht1JEx8/VzM+mbFukY1yMRDE8sqkfNA=;
        b=GOTwZqfQSc4EefpxPItKpItwtPF7IqxwEhdoxPtwEr0iTKnkEal3BTQ+6vj5t1bWfj
         VWsGRd2s6RwOQEvHpw/FZJrDdUX73DKXZZgikiOT1Q6z2HQ7T4NID3SKXHgZQPM7VKtU
         k6XCwYt2XLRScneozKCCxhdzeLJr4LKcRCtRvmK6VpwRvhqSmqgb6BFwid6MYBkbIDuX
         FdW4KmN8Pbj7fJliuXDRLTSF6Jl6E+xKpwep0nMhvwIEdZ/ChQZCYVCd5y8x/ptfXVgH
         g44GKO9jWkGmAvj2xmS0DW0fWD1W0YFGKg5OwMjJDxBd8OzMxJIACWXXNq5oPS82vAav
         2qSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XTCUPFHB/zsSht1JEx8/VzM+mbFukY1yMRDE8sqkfNA=;
        b=E0r6ZxYsvcCGHhXZuarty7pkOwsHHBxyFGD3MW9jUqGf+jCRtrdeH9mDv+Y5+Pjujf
         OWWpaKgtvdH+nJIWkr8OwrrBfgBcGPYT/0qboNgMLfuusvQKorV52mds54KBzNXhLeuq
         dnqAL6MesNYdifPDI1Z0NBaF4tRNBAyTkA6tXmekLxHul6m+KaOAmt/3EnLSjY1vqhjz
         HMX7itt34aj2X7hfnu6qKURZ99W/9DbzGYrs3i4dUfBiXlzwkZenho3H+q61ntjYCzNG
         IZtIvepaCUeLZvbycnxcD0qsua8HXB3XypsNU4o4M2kLxYT3ohhF9bNau2QSvpwtdLqd
         VV1Q==
X-Gm-Message-State: AOAM530SZiPC5Ew1zCVvN0MPw1nABt/8dxiyCG/eM2DnqjIOMr9SKfIY
	oT3QPGugB3r/ov4llbUvm1XTyAdKPIjNClWdNII=
X-Google-Smtp-Source: ABdhPJxU21WZyweH7h3w5mQhRwdq84lgAoxxxG5hMEouuCW2oVvZ5ArVneg1/7ArvNSX37dzLxS4vhdvm0XYXRiuK/U=
X-Received: by 2002:a05:6e02:ea2:: with SMTP id u2mr18694822ilj.247.1625680496548;
 Wed, 07 Jul 2021 10:54:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <YOPcZE+WjlwNueTa@unreal> <CACRpkdYDF-7=O1gc=Fh_mywtAgAtEVZhvoZXDFsAHMZe4FPGHQ@mail.gmail.com>
 <CAMuHMdU5FOdSj+-d38t3BuPrZsYF0YT-Ff1efYLS3W7yNN_Y6Q@mail.gmail.com>
 <CACRpkdbr9orKFfDmwZDz1wPHZvUfSaDVJtJB1uz+2Ho=QZFGiQ@mail.gmail.com>
 <CANiq72no33T6RXMyZ18bS_nVaUcOpWEmu15Bs=+zJPnnhrnYRA@mail.gmail.com>
 <CAK8P3a1UZ9kdyokJWYxdsn-3doO6gVw9Saivm2Adv6P_=xS8jg@mail.gmail.com>
 <CANiq72n0AHks543X7U58Rmtujptcj5TxjNYq4=9Hs6bGmTAZSg@mail.gmail.com> <CAK8P3a0TG=sFMGM6KUEtaz6fgA-fYj_6OgCnqcXnu6K0x1JjwA@mail.gmail.com>
In-Reply-To: <CAK8P3a0TG=sFMGM6KUEtaz6fgA-fYj_6OgCnqcXnu6K0x1JjwA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 7 Jul 2021 19:54:45 +0200
Message-ID: <CANiq72kziH=LO9rHchh5WhWOoC830=_HNL0Jvh1x73B_7eU-7A@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Leon Romanovsky <leon@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 7, 2021 at 6:55 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> No, I meant just which targets are enabled at all, regardless of whether
> we are cross-building.
>
> https://doc.rust-lang.org/nightly/rustc/platform-support.html lists only
> arm64, arm32, hexagon, mips, powerpc, riscv, sparc64, s390x,
> x86-32 and x86-64, in a number of variations (plus a few others
> that don't run Linux). I assume these all have user space support,
> while the other architectures that have llvm support (arc, csky, m68k,
> sparc32) would work in principle for building the kernel but are lacking
> a standard library port.

Ah, I see what you mean. Yes, you are right, building "for user
space", i.e. including building `std` etc. is more work (because `std`
includes things that rely on an operating system being present; e.g.
printing, sockets, etc.), while supporting `core` and `alloc` is
easier (and it is the only thing we need for the kernel).

> Ah, so I assume this is not going to be the version from my distro then.

Yeah, in the beginning, I don't think they will always match. A couple
ways around that:

  - Distros could distribute the Rust toolchain they used to build the
kernel as a separate package; for the kernel only. This is what I
would recommend.

  - Distros could simply make the kernel compile with a different
version even if it is not supported by us -- i.e. it is possible, it
is just that we cannot guarantee it can be done *if* an unstable
feature happens to change between versions. This has a higher
probability of happening until we drop `alloc` from the kernel tree,
because `alloc` is part of the standard library and currently uses
some compiler magic.

Later on, when we manage to compile the kernel without unstable
features, then we only need to state a minimum version, like for
GCC/Clang.

> Well, this was my question: if the libgccjit interface is stable enough,
> it should be possible to port the patches to every version we still
> support in the kernel. gcc-4.9.4 does not have libgccjit, but the later
> ones do.
>
> The patches are only for an unreleased gcc-12 tree but they
> don't look too invasive, so maybe they could eventually get
> backported to stable compilers (not upstreamed, but at least
> used for my builds).
>
> I don't really care about the outdated fix releases (9.3, 8.4,
> 7.3, ...) but I try to make sure the latest build of each major
> gcc version works.

I see -- let's contact offline the author about this. I will Cc you
(or if you write the email, please Cc me).

> According to
> https://gcc.gnu.org/onlinedocs/jit/topics/compatibility.html
> the ABI should be stable across all gcc versions, so if we
> can get it to work with an old gcc release it would work with
> all newer ones as well, but obviously anything built against the
> patched library won't work against a newer version of the library
> if that doesn't also have those patches.
>
> My guess is that the ABI is also stable across target architectures,
> but I could not confirm that. If this is true, then building against
> the oldest supported libgccjit would make it work with any later
> (patched) libgccjit, but we'd need to pass the correct libgccjit.so
> file that matches the gcc version used for building the kernel
> and the target architecture.

Agreed, we could try that.

> This would clearly only work for gcc-12 or later, otherwise it
> does seem plausible. As far as I can tell, the patches just add features
> that may be generally useful, not just for rust.

What I meant is trying to convince GCC to have the patches in the
older releases -- but yeah, it is unlikely (they only accept bugfixes,
right?).

Cheers,
Miguel

