Return-Path: <ksummit+bounces-292-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 493873BE971
	for <lists@lfdr.de>; Wed,  7 Jul 2021 16:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 0F8203E1066
	for <lists@lfdr.de>; Wed,  7 Jul 2021 14:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A06C2F80;
	Wed,  7 Jul 2021 14:10:51 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9B770
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 14:10:49 +0000 (UTC)
Received: from mail-wm1-f52.google.com ([209.85.128.52]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MS3r9-1ldFiG1l2x-00TRpO for <ksummit@lists.linux.dev>; Wed, 07 Jul 2021
 16:10:47 +0200
Received: by mail-wm1-f52.google.com with SMTP id u8-20020a7bcb080000b02901e44e9caa2aso1795689wmj.4
        for <ksummit@lists.linux.dev>; Wed, 07 Jul 2021 07:10:47 -0700 (PDT)
X-Gm-Message-State: AOAM531b4/jGD+gefJktYeRR39DqwccyTvcUNoBT2qD1PlfogVgBDT+b
	SbkLAUaPwGJSxEogTdfcCcfzal/NIQFDRgNTpao=
X-Google-Smtp-Source: ABdhPJyza9Z2dQj7FlDd8a3xG+uMzs59V/QkESaq+k9aWY92TPGP1l0r4+X+Gcgk1o1+zm0BZqy1qV899XM6TcW9p44=
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr7105697wmb.142.1625667046924;
 Wed, 07 Jul 2021 07:10:46 -0700 (PDT)
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
 <CACRpkdbr9orKFfDmwZDz1wPHZvUfSaDVJtJB1uz+2Ho=QZFGiQ@mail.gmail.com> <CANiq72no33T6RXMyZ18bS_nVaUcOpWEmu15Bs=+zJPnnhrnYRA@mail.gmail.com>
In-Reply-To: <CANiq72no33T6RXMyZ18bS_nVaUcOpWEmu15Bs=+zJPnnhrnYRA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 7 Jul 2021 16:10:30 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1UZ9kdyokJWYxdsn-3doO6gVw9Saivm2Adv6P_=xS8jg@mail.gmail.com>
Message-ID: <CAK8P3a1UZ9kdyokJWYxdsn-3doO6gVw9Saivm2Adv6P_=xS8jg@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Leon Romanovsky <leon@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:GH2cLtsJxLEa1MGjBWeZHaLK4u3lOtb5QJyRHFtQcMAr9T2YS7v
 k30fj4liTTdMm81B5Bow7PERkepOOK4Z+56jOSh0MHX5V2ek9rT3XrCY3P/mA/Zdbf2udix
 WTqcVzXXX7oiTCoqNmFjlXhygKvPrfxKUg8syvFhlPjDsNtwZt6ngAhjYxGp0zJOhD1iu58
 icfhaQWocSPq0O85hvQ6A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:k5ZjVlor3to=:vPQj2G9QUq8zo6ZdPig7kD
 1l9otDHXF2c9dhPn+3LQoGGK9smy27jg4CAGG/DNgg3pDT981gZjWfFZ67+SZXEYCwl6W6KtZ
 yDWYNQj64ZY3TpuW16i036EpUMjGaOL75Bgi+FJKyFcdFT5EijqIL7AbY2eUxYJzi+/g2GGbt
 TNZeUvV77A90I6oVGlm8NvySt9SzFkeEj8y6Qmj8VCmuF69BcmXmHME+dyuCK7CFO2XK6kOC4
 XexhaNb6kcbcKyA7PfWl8bs9AGrCMZvzXXEr+Ue8/x0hT7XRwbAW64LygA+m+BzEZtOSoRbuN
 7uT9IY1eXKmlNTOZXMfPEzB3zNyILOFHSqYgYPI8v+cjvVRMWCPklwiSLHZ0s0Ig9xP7h7JeN
 zpGUPWKpPQ7Bfi/1O8Fttp0z8AYqbzq+2P84m2cr7ed/GulHRnHE5YKozm+7Hww/bnmrivNqy
 /IHgE/R69+Ku3/NV2voQivVl5EiA450Bn+rvMbbCJbdX6alrGu9Afl6kSv9uVUx9m3xQfAAGc
 V1g+eFe+QXL+xqSypiyPYpapn2j3m7/jWt6xu1GhXeDaAnD+MRBPi/a4xDLyRBM8xBTP137tV
 jvGtCtCjP8J8qlgAG08CuR85zmgx5x+FaaAtWLTkdI++YckU+eZSP9+59FByg5mhMkYNn4XBp
 XkusyLnPD1hEZbomld8yJaOOUOC0ORTbdoroRmrVK8czOUF2BB2aKy/nfoar4+xvey+ILYh1W
 PQknJatigAYtG5AyUjQVdXKs4MLmwYNj7jE2YidSapTwKvpQ1rgnmtz4WAkw7SRrhy79+EgHv
 PBJeJPcjQ4bHcNA21NPfJeO+rjqHbbInc3FOl4JqxH02saEyv/ycj6OuId6YgkN+PvUV7Gm

On Tue, Jul 6, 2021 at 8:36 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Jul 6, 2021 at 8:00 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > I brought this up for discussion with Miguel et al and it turns out
> > the project to develop a GCC front-end for Rust is now well under
> > way and there is already a frankencompiler using LLVM first
> > and then feeding that into GCC IIUC.
>
> By the latter, I think you are referring to `rustc_codegen_gcc` -- in
> that case, a quick note: it does not involve LLVM. `rustc` has its own
> set of IRs which then gets translated into LLVM IR (in the most common
> backend), but in the case of `rustc_codegen_gcc` it gets translated
> into something libgccjit can consume. There is also a third backend in
> the works, called cranelift, for different use cases.
>
> So `rustc_codegen_gcc` is basically a very quick way of supporting the
> entirety of the Rust language (exactly as `rustc` supports it) but
> having a GCC codegen path.

I suppose using this for building kernels is actually easier than doing
an architecture port for user space, because it does not have to
wrap the syscall interface, right?

I've had a quick look at what it would take to integrate this into the prebuilt
toolchains on kernel.org to give developers the chance to try their rust
code across architectures. I've managed to cross-build the patched
gcc sources for rustc_codegen_gcc, but haven't actually figured out how
to build rustc_codegen_gcc itself.

Before I look at this further, can you clarify what the version dependencies
are? I.e. if I want to build this for five gcc versions, 27 target
architectures,
and seven versions of rustc as shipped by the most common distros, can
I do this with a single rustc_codegen_gcc binary, or do I need to build
5*27*7=945 versions of the binary, or something inbetween?

       Arnd

