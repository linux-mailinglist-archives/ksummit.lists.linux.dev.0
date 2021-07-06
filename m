Return-Path: <ksummit+bounces-240-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 9015D3BD835
	for <lists@lfdr.de>; Tue,  6 Jul 2021 16:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id B3BBA1C0E0A
	for <lists@lfdr.de>; Tue,  6 Jul 2021 14:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDB942F80;
	Tue,  6 Jul 2021 14:24:20 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A962A70
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 14:24:19 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id h190so3045208iof.12
        for <ksummit@lists.linux.dev>; Tue, 06 Jul 2021 07:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6bWKcEsMv0LJ66+15UbAOhlJD+/f5GeoOfZTx7aJcgI=;
        b=GXBIrauVeD8vujJJgeCr/ag5/+0JcKT0qJ8vG8bxR2xrQ7brtDbB6zHdEK9tyPe9gy
         bqBUSdWW6vHN7xaD8iyNXyynGuaIef/3tDYJRWwK6mYZpyrZFLlpMX+xoyn2gV7KzUz8
         NldRhQLW1oiEuCoyGI0K4iWO6g0BthW9gcgIkODmOqUDBf/qMW8peYk91m3ggGlyaZLx
         EVnBEphFs0IS+BgFd6ZN5UnCwpd3++0+ETZ8278CYUdhz9DpQAmlvUFQI9QHIBFmLmC4
         E7fomip6I8XXP7hO3/GSymkwNxuxZDSPM4Ll7yMzLXpTPTmlNecgJFN8Yu2x4Bz18f1o
         LQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6bWKcEsMv0LJ66+15UbAOhlJD+/f5GeoOfZTx7aJcgI=;
        b=jm+DaBoks2KswZe5Nx75ZNpoZVRxtxmX8xWT+qzqy9mf4oiOfbieiU11i3EWQCZZwl
         CbsQ5F5q2voe7zdcQ5Xwv9e5ln4W8IkF7qIODvnZ0uj3lbwOsAMMt5aJjz8eV0D9F2h/
         xG5sST3aE385OZc1KNKPawIEMMg9/Y9BxWbZLRb2BbC8bn8ja07e/pHzgFgU+u8T9nBh
         T2URdenKsWjcq39vdaKNZtK6mH4esSRtdnlUmPgrKk2N+PYsDScGF16TKhG0BOTIgn/l
         LOaS5qq0/NsigyC7IRmNLqdx7yCfJ6JZLSCA/qznQ7UYrVPDHfVHr7cLnoyeXLnyes22
         Fcnw==
X-Gm-Message-State: AOAM533ZAU2fTLC926hfkvTNCrP5AaeYscq9Ho5+TPXlLG7sm/U+o0qL
	VsN5zR/R2ijZlQt/fQW/0HupgVBd1yg+Kz53qVI=
X-Google-Smtp-Source: ABdhPJxE78unad/CtTdcFPY7hnykU+sFtHCd2Lgqv/2Q4f722VGJYrk6zdQJhnpouqaNE5gVYzAZf/H980/Yax+pjj8=
X-Received: by 2002:a05:6602:2c85:: with SMTP id i5mr1042461iow.91.1625581458818;
 Tue, 06 Jul 2021 07:24:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com> <YOPcZE+WjlwNueTa@unreal>
In-Reply-To: <YOPcZE+WjlwNueTa@unreal>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 6 Jul 2021 16:24:07 +0200
Message-ID: <CANiq72nCDKQAJaPOjR167FWnrCcqnvovuHEx58Zmur6su897Qw@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Leon Romanovsky <leon@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 6:30 AM Leon Romanovsky <leon@kernel.org> wrote:
>
> 1. The addition of another language to the mix will hurt a lot our
> ability to refactor code for cross-subsystem changes.
>
> Just as an example, there are many changes in DMA/SG areas that are
> applicable for many drivers. Even simple grep->replace pattern will
> be harder and longer if it is needed for the drivers that are written
> in different languages.

In the design we chose, Rust drivers do not call C code directly --
they go through the abstractions a given subsystem may provide. Thus
only the abstractions would need to be updated, like any other C
consumer of the APIs.

> 2. Testing matrix will be duplicated, both in compilation tests and in
> verification coverage. Even now, there are some kernel subsystems that
> so much in-love with CONFIG_* options that their combination is slightly
> tested or not tested at all. So imagine, we will need to recompile
> everything with Rust too and execute same coverage tests again.

I am not sure I understand this point.

On its own, `CONFIG_RUST` only changes 1 single place currently (the
addition of a `vsprintf` format specifier).

Moreover, the goal is that Rust is enabled by default for
architectures that support it. So there would be no need for
duplication at all.

> And yes, proper testing costs a lot of money, which IMHO better to
> invest in improving coverage/fixing bugs/tooling instead of adding
> new language to the pack.

The original RFC includes an overview of advantages and disadvantages of Rust:

  https://lore.kernel.org/lkml/20210414184604.23473-1-ojeda@kernel.org/

Rust brings things to the table that less-than-100%-coverage and
tooling cannot. For instance, UBSAN catches UB, but the safe subset of
Rust forbids UB statically (assuming unsafe code is sound).

Trying to clarify this sort of thing is why I included the "quick
introduction of the Rust language" point in the abstract of the tech
topic -- I think it is worth having a common ground to discuss things
and getting everybody on the same page.

Cheers,
Miguel

