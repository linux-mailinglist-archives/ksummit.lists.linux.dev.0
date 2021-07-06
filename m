Return-Path: <ksummit+bounces-257-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 025D73BDD5A
	for <lists@lfdr.de>; Tue,  6 Jul 2021 20:37:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 1BF1D1C0EF0
	for <lists@lfdr.de>; Tue,  6 Jul 2021 18:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 637372FAE;
	Tue,  6 Jul 2021 18:36:56 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3A270
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 18:36:55 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id h190so4102085iof.12
        for <ksummit@lists.linux.dev>; Tue, 06 Jul 2021 11:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0xyx0pklQR+95zKxEndiU06jX1kO2TXkLillzRG+x6g=;
        b=WKVN+Khstry4enrloSSi2BBRzF2tR5jswElXvuEvkJAFhOqHoozseTCtQIRApzr2rC
         Hurx1lBH/auX6G9z/wTAU+oTem87ghmsEVAYinARpLF0yZOAEOMHuvc30CdjYdJBQSKl
         MolnbTjM2lSeJ5pOaBeaOxE4YmVOLpM1eer/IsU40erAir8Zj30LTXuYVMx9WXRH/72f
         znLUE72BVbiykyID0+80XKPXN5qAErwhdMfo5GYBh+IqDt7VVaoPQdm6GOW9bhEEWAMI
         EqqDyzmgu8GD6pd6ns0IMEpUrU8ywcL0MxyUTCFRKA69She2VeWYEXimDJhhYLjEFbho
         EuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0xyx0pklQR+95zKxEndiU06jX1kO2TXkLillzRG+x6g=;
        b=kC1Vxy+5zqgrEe0EzTFGEYS88ewunrjGbdqyA95/hwU698GwnFM5zkPrtZcvNqi827
         YnLCsqey2KSkdRzpfqSnwy2nb9pD4kjz41BVbogJOBbyeMPeRRXfDCqtdHa59a6OWv8V
         t7dGdcZUdhiPIDOrqnJVaCKN6xt00Nti0ObKmi0S/Gmj+CKuPPQOWWWbKnzT9RPIITxB
         7TQqzEONW1TLEeJarAnDp6JEBVZ4NOgkLOX65VPZINFU8h2Iy9aQKpQS8j4bUwJJxq8r
         aGyN8gv7eF9G8+b1rVmAqKoW798qjgNzt/iM4AGYzFI65M4tg20PISZSNYGn+8jZnXPJ
         86eA==
X-Gm-Message-State: AOAM531llSNMbRCU8EydvMkL0f50d4h8ldNBOBXrZxbSrqpX6sFt3yZ/
	WCyMqySMiqFsOnHZqum6vLHVzUnzXJMEnY613AwCRam+6j1rig==
X-Google-Smtp-Source: ABdhPJwpTQNeoTqf+fwPxWXOBCQY0eWUxrqEuxY3T/U1t4InrMBr7DTNJcvah8OQzTSkens1hCwQ0hSM9mWUnAz1S1Y=
X-Received: by 2002:a6b:185:: with SMTP id 127mr9473053iob.64.1625596614548;
 Tue, 06 Jul 2021 11:36:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <YOPcZE+WjlwNueTa@unreal> <CACRpkdYDF-7=O1gc=Fh_mywtAgAtEVZhvoZXDFsAHMZe4FPGHQ@mail.gmail.com>
 <CAMuHMdU5FOdSj+-d38t3BuPrZsYF0YT-Ff1efYLS3W7yNN_Y6Q@mail.gmail.com> <CACRpkdbr9orKFfDmwZDz1wPHZvUfSaDVJtJB1uz+2Ho=QZFGiQ@mail.gmail.com>
In-Reply-To: <CACRpkdbr9orKFfDmwZDz1wPHZvUfSaDVJtJB1uz+2Ho=QZFGiQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 6 Jul 2021 20:36:43 +0200
Message-ID: <CANiq72no33T6RXMyZ18bS_nVaUcOpWEmu15Bs=+zJPnnhrnYRA@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Leon Romanovsky <leon@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 8:00 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> I brought this up for discussion with Miguel et al and it turns out
> the project to develop a GCC front-end for Rust is now well under
> way and there is already a frankencompiler using LLVM first
> and then feeding that into GCC IIUC.

By the latter, I think you are referring to `rustc_codegen_gcc` -- in
that case, a quick note: it does not involve LLVM. `rustc` has its own
set of IRs which then gets translated into LLVM IR (in the most common
backend), but in the case of `rustc_codegen_gcc` it gets translated
into something libgccjit can consume. There is also a third backend in
the works, called cranelift, for different use cases.

So `rustc_codegen_gcc` is basically a very quick way of supporting the
entirety of the Rust language (exactly as `rustc` supports it) but
having a GCC codegen path.

Cheers,
Miguel

