Return-Path: <ksummit+bounces-295-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC153BEAAC
	for <lists@lfdr.de>; Wed,  7 Jul 2021 17:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 7BBC53E0F3D
	for <lists@lfdr.de>; Wed,  7 Jul 2021 15:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3BA82F80;
	Wed,  7 Jul 2021 15:28:47 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84CA168
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 15:28:46 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id k6so3205434ilo.3
        for <ksummit@lists.linux.dev>; Wed, 07 Jul 2021 08:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zTqWx2UkqBrA+bKoh6XI7nocDFPqJq3Sq4oeEsMYWoA=;
        b=YLs9DJdo5LffFUuKOYHtOKtp3itjhPLDo2DbmqYw8YOUT/XTyK4xeneXk5Dy5P5Abu
         IK8Fgq4NNivBw9ZR9wxghgjXa9BaTDkYm/ZKeGazb9mGzesDVbzkDuckYXRe92b4nGy7
         LWUIqXHAX6Gp1wPPbcWHY01M0xQOcfEGSAGqdyEdg8ta2dNtBgb0XSgqwtHRRcMOyAx7
         YvJbE2YUrtcuIdey604HrcSVnRH1i6bnbAu/FKqCxbRsbiWcQBnw0dOHgLhkE05lFFYx
         e2B7G5q/mSY4FSpmHG5OtzyBgQhZjX7GJjH7e3Qi3NJjUsh1qPokpmvv2l8I6aE37XAG
         oRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zTqWx2UkqBrA+bKoh6XI7nocDFPqJq3Sq4oeEsMYWoA=;
        b=JCVzooYa99dNQpWUTDj/DeTbCpAGSNOEyCzbusXRbNByKVG5S+ryVJM63pyZ4AYSzM
         pJMhJcOoCf16XCqT/CzSPJ0HtKjiCKmQ4f2iGWfCKAdzpqHLwtlsNyf8gTUJaP7V+RBU
         /8SlUB4bbYN/WFIZ5q9l7iEygTBxanmTuWPp9y803C6mGdvT+j2ELMI8LXnh4fC3PRHS
         zdv2UJJOy3UFIOjZh1YfRwLUMlm4XRa1ru2jmZo+RDTPuPMg1nqV7Ws8Lnw35Z0RELze
         4DVMv11bBBtf4Xh/xXtTJxw+SguT1DOjZgQ3ZdUmeXTB7Ja/fci0ewZb379dUt4DWT5B
         LWAQ==
X-Gm-Message-State: AOAM5310B5UovqMzjRA9uOYudWqqhAGJZVCuobn5lwTVTAdPcSadBhLg
	UkWH2y0Vr7JrUHbuAo+lSuJBhS/xQsWtcN9efpY6T4B90vmJzA==
X-Google-Smtp-Source: ABdhPJxOuL5gPJKXVW1rm1iW8KNNUFHxUsWjNzlLwVl9apG9RrVGwB6slUa0nJ9fAGFNmHogNnCi8lhLKiujpREoflg=
X-Received: by 2002:a05:6e02:ea2:: with SMTP id u2mr18259721ilj.247.1625671726013;
 Wed, 07 Jul 2021 08:28:46 -0700 (PDT)
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
 <CANiq72no33T6RXMyZ18bS_nVaUcOpWEmu15Bs=+zJPnnhrnYRA@mail.gmail.com> <CAK8P3a1UZ9kdyokJWYxdsn-3doO6gVw9Saivm2Adv6P_=xS8jg@mail.gmail.com>
In-Reply-To: <CAK8P3a1UZ9kdyokJWYxdsn-3doO6gVw9Saivm2Adv6P_=xS8jg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 7 Jul 2021 17:28:34 +0200
Message-ID: <CANiq72n0AHks543X7U58Rmtujptcj5TxjNYq4=9Hs6bGmTAZSg@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Leon Romanovsky <leon@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 7, 2021 at 4:32 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> I suppose using this for building kernels is actually easier than doing
> an architecture port for user space, because it does not have to
> wrap the syscall interface, right?

What do you mean by architecture port? Do you mean native vs. cross-compiling?

> I've had a quick look at what it would take to integrate this into the prebuilt
> toolchains on kernel.org to give developers the chance to try their rust
> code across architectures. I've managed to cross-build the patched
> gcc sources for rustc_codegen_gcc, but haven't actually figured out how
> to build rustc_codegen_gcc itself.

I discussed with Konstantin a while back about having the Rust
toolchain in kernel.org too -- so I am glad you are looking into this.

On `rustc_codegen_gcc`, it is early days -- I think all these projects
just got accelerated a lot thanks to the possibility of Rust being in
the kernel. But you can find information on this Compiler Explorer
issue because they are also trying to set it up [1]. The author looks
quite open to help us, so you may want to contact him too.

[1] https://github.com/compiler-explorer/compiler-explorer/issues/2683

> Before I look at this further, can you clarify what the version dependencies
> are? I.e. if I want to build this for five gcc versions, 27 target
> architectures,
> and seven versions of rustc as shipped by the most common distros, can
> I do this with a single rustc_codegen_gcc binary, or do I need to build
> 5*27*7=945 versions of the binary, or something inbetween?

I have not yet used `rustc_codegen_gcc` since it is not ready for our
purposes. But:

  - Only a single version of `rustc` is supported per kernel release
(until we stop using unstable features), so that at the very least
would cut down things by 7.

  - I would imagine the patched GCC of `rustc_codegen_gcc` only
supports the latest GCC release, do we really want to try to use it in
all GCC versions supported by the kernel? Of course, it would be great
if that means we can support Rust everywhere, do not get me wrong!

  - I don't know how stable the `libgccjit` interface is -- if it is,
then we only need a single one, as you say. I would ask the author.

  - We could try to get upstream GCC to accept the patches needed to
make `rustc_codegen_gcc` work, though I am not sure how well they
would be received, since they are working on their GCC Rust frontend
too.

Cheers,
Miguel

