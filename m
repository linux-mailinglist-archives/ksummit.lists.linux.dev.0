Return-Path: <ksummit+bounces-301-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A473BECA2
	for <lists@lfdr.de>; Wed,  7 Jul 2021 18:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 6030A3E0F79
	for <lists@lfdr.de>; Wed,  7 Jul 2021 16:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94CFB2F80;
	Wed,  7 Jul 2021 16:55:45 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8E5177
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 16:55:43 +0000 (UTC)
Received: from mail-wr1-f46.google.com ([209.85.221.46]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MHoZS-1lwEtn2vUU-00Evgq for <ksummit@lists.linux.dev>; Wed, 07 Jul 2021
 18:55:41 +0200
Received: by mail-wr1-f46.google.com with SMTP id q17so3871791wrv.2
        for <ksummit@lists.linux.dev>; Wed, 07 Jul 2021 09:55:41 -0700 (PDT)
X-Gm-Message-State: AOAM533BJjSXd1R4Pc8stdKeEGQQMgtzSGeAvFAP1zTi301vSvhuivAn
	E95jKBA36P31rlAtdyNhHLwmlzO9ZCvUggfq52M=
X-Google-Smtp-Source: ABdhPJxP8Oa+eFBtZTbzPzGGGtHT5p/MavwC/vmcwU6B+0zfskAoafUrckxG7jKw3Jb1tuQGMNXBY8jwR/lo1LBX03k=
X-Received: by 2002:adf:e107:: with SMTP id t7mr29241452wrz.165.1625676941277;
 Wed, 07 Jul 2021 09:55:41 -0700 (PDT)
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
 <CAK8P3a1UZ9kdyokJWYxdsn-3doO6gVw9Saivm2Adv6P_=xS8jg@mail.gmail.com> <CANiq72n0AHks543X7U58Rmtujptcj5TxjNYq4=9Hs6bGmTAZSg@mail.gmail.com>
In-Reply-To: <CANiq72n0AHks543X7U58Rmtujptcj5TxjNYq4=9Hs6bGmTAZSg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 7 Jul 2021 18:55:25 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0TG=sFMGM6KUEtaz6fgA-fYj_6OgCnqcXnu6K0x1JjwA@mail.gmail.com>
Message-ID: <CAK8P3a0TG=sFMGM6KUEtaz6fgA-fYj_6OgCnqcXnu6K0x1JjwA@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Leon Romanovsky <leon@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:FTtXidyBLnYgDh2og60w62dW96FUQfmSlwzrMgTJh2eeIhzQXeG
 XSlVOV7PVTgifltaK5whTyOb65zh0yF7tPAI/NOIwqeZ0f8ZC0p9oW0K+bC1s8vuRx3ft75
 vA00GDJzSkoH961i+YdTE5IIq5OT8KSvdYji3UZNhZv7Gt/4NOmXUBEnxvVj1HxxQjT8lOd
 RuBajcrlNAE55yLVNK2lw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Znzxfj8KWXs=:LKdWDDV5GTuo737/i6oYya
 oGb7w1LLEumhO4F7PDpaubXq9cvbbBHIkLBf6L5iF8fnpfNKKk4qkRubYaNCa8xFBTH7PK2ju
 ZX2JyK+6iG4dMjFdHbbYyqxEnim2Akkw326GLH/5mhHxIM46X4omNfdhRBUXQrt4eHLvzyRKa
 Ti7o4FE4nHDxpS2cJ9xfFYEfV98jDd8dce9YfsUj2Ghzlp9hAkFWklT4tTUj5KtXnYgMqVvqk
 sPSiPgvhtvyI8/oiYNkC6G3AxOn9ntpqOAH2mQAQLMMid4EZlWVEe9RJdkrC3Zi1NziQoN4aH
 UnUe/4g79RYA1o20TZQuX0eF8KZjzJ2/hEG2tKFaVNzZxPNiNC2xkNJRJgyvMh1WYUqdTLkdi
 vfD9+U58x+AtVhyAKvl06H09s9Rn/Kzy08tIscJOe+OfoMz8eRybxxvDcUcklqfbftkJ4nSxk
 C6xLZTQvI5Ni9SjsbgYDgDTCyrMyzm+qHErkMeAT4DYfAO1ihFgnhBWf+2Bm+pVsgbNDncrmM
 uTm43HElr8B8AQhBc7F7W0kMvQ0ZVHALwXl9UE/UKIJRybGFO8emk0XwybVqRhKBnX9J4TIN8
 9/Rpoqf5FuHA0h+3pSTl5Eea3Vg2o0WTfUSsHp59O/BYd+TbE/r2gN5MjDYTpX4AoWCVR9dcZ
 PQQEugFksbNK4imq5JSQb2OZmrmCr9cfnr0fnnwvbd6e9iFybmuXe0YvMDW2WyBof+Kjw9vt4
 u7aDcYwu1O9LYDvR0wX5OGgRHkdsH1fvlcimakhd808KSxhbueawHx5Cigd4rGgcUgn6mtBXM
 5mvK2GU20l1+gY7cK84GgvOlU0Y0qiL9eYzhY1jRIOiVqxyxfXkUn/2mJJfb3OdVfSXR1FV

On Wed, Jul 7, 2021 at 5:28 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Jul 7, 2021 at 4:32 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > I suppose using this for building kernels is actually easier than doing
> > an architecture port for user space, because it does not have to
> > wrap the syscall interface, right?
>
> What do you mean by architecture port? Do you mean native vs. cross-compiling?

No, I meant just which targets are enabled at all, regardless of whether
we are cross-building.

https://doc.rust-lang.org/nightly/rustc/platform-support.html lists only
arm64, arm32, hexagon, mips, powerpc, riscv, sparc64, s390x,
x86-32 and x86-64, in a number of variations (plus a few others
that don't run Linux). I assume these all have user space support,
while the other architectures that have llvm support (arc, csky, m68k,
sparc32) would work in principle for building the kernel but are lacking
a standard library port.

> > I've had a quick look at what it would take to integrate this into the prebuilt
> > toolchains on kernel.org to give developers the chance to try their rust
> > code across architectures. I've managed to cross-build the patched
> > gcc sources for rustc_codegen_gcc, but haven't actually figured out how
> > to build rustc_codegen_gcc itself.
>
> I discussed with Konstantin a while back about having the Rust
> toolchain in kernel.org too -- so I am glad you are looking into this.
>
> On `rustc_codegen_gcc`, it is early days -- I think all these projects
> just got accelerated a lot thanks to the possibility of Rust being in
> the kernel. But you can find information on this Compiler Explorer
> issue because they are also trying to set it up [1]. The author looks
> quite open to help us, so you may want to contact him too.
>
> [1] https://github.com/compiler-explorer/compiler-explorer/issues/2683

Ok

> > Before I look at this further, can you clarify what the version dependencies
> > are? I.e. if I want to build this for five gcc versions, 27 target
> > architectures,
> > and seven versions of rustc as shipped by the most common distros, can
> > I do this with a single rustc_codegen_gcc binary, or do I need to build
> > 5*27*7=945 versions of the binary, or something inbetween?
>
> I have not yet used `rustc_codegen_gcc` since it is not ready for our
> purposes. But:
>
>   - Only a single version of `rustc` is supported per kernel release
> (until we stop using unstable features), so that at the very least
> would cut down things by 7.

Ah, so I assume this is not going to be the version from my distro then.

>   - I would imagine the patched GCC of `rustc_codegen_gcc` only
> supports the latest GCC release, do we really want to try to use it in
> all GCC versions supported by the kernel? Of course, it would be great
> if that means we can support Rust everywhere, do not get me wrong!

Well, this was my question: if the libgccjit interface is stable enough,
it should be possible to port the patches to every version we still
support in the kernel. gcc-4.9.4 does not have libgccjit, but the later
ones do.

The patches are only for an unreleased gcc-12 tree but they
don't look too invasive, so maybe they could eventually get
backported to stable compilers (not upstreamed, but at least
used for my builds).

I don't really care about the outdated fix releases (9.3, 8.4,
7.3, ...) but I try to make sure the latest build of each major
gcc version works.

>   - I don't know how stable the `libgccjit` interface is -- if it is,
> then we only need a single one, as you say. I would ask the author.

According to
https://gcc.gnu.org/onlinedocs/jit/topics/compatibility.html
the ABI should be stable across all gcc versions, so if we
can get it to work with an old gcc release it would work with
all newer ones as well, but obviously anything built against the
patched library won't work against a newer version of the library
if that doesn't also have those patches.

My guess is that the ABI is also stable across target architectures,
but I could not confirm that. If this is true, then building against
the oldest supported libgccjit would make it work with any later
(patched) libgccjit, but we'd need to pass the correct libgccjit.so
file that matches the gcc version used for building the kernel
and the target architecture.

>   - We could try to get upstream GCC to accept the patches needed to
> make `rustc_codegen_gcc` work, though I am not sure how well they
> would be received, since they are working on their GCC Rust frontend
> too.

This would clearly only work for gcc-12 or later, otherwise it
does seem plausible. As far as I can tell, the patches just add features
that may be generally useful, not just for rust.

     Arnd

