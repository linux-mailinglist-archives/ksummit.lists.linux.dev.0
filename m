Return-Path: <ksummit+bounces-261-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E703BDDDF
	for <lists@lfdr.de>; Tue,  6 Jul 2021 21:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 6F7D11C0EF9
	for <lists@lfdr.de>; Tue,  6 Jul 2021 19:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6DA72F80;
	Tue,  6 Jul 2021 19:12:31 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD5C70
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 19:12:30 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id u18so9128503lff.9
        for <ksummit@lists.linux.dev>; Tue, 06 Jul 2021 12:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hUoqXn5y4hfC2VIt1y2TKUXd/srwAIOwqCIJFhV+V3o=;
        b=DvdtFaPVe/+FWTNegyJNfkpLua+lD4BiZ8mIsB8CW3PdX+ifl1T9uhyr5KnILOarZa
         m4hbBF4KNx2CXTMUQWrgynAy6VuOK3vIKlZQpLiutXIlo4thPF9bb06Cx85omjWVhbzk
         NhxT130lMZwaKu2dX7LK/34ZZMnP857enU5uhbOMSd6VkgR3IwS4vW4s0ESXKrZuC+mn
         VDdxDWN6GLTbX8PtEVG4OUa9Rx9nb4gxp7AqzETGl4RdPu9N6aCKEuESvQ5JS4SCiHZq
         b5CeC6CeAm5iuErkZGj3HrGHS99m/Mf6XRfjl42c2yr8BrpjwZaziSKg7LOT+oevaiII
         TRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hUoqXn5y4hfC2VIt1y2TKUXd/srwAIOwqCIJFhV+V3o=;
        b=eL/0cE4bzjqDdBxdxjv6kowgO45E86y9LSxU2CUpIjM5fG0Hd1jlijga6a9EdNKdsY
         C3/VbR5ZZzhYG/VJ6lRZHRddlFvaw97sfIN9fc25OttS272sXyTqKVRNXNA+xSSHOIKz
         UMvdq2pXE9tA0ICw+HlPLJpoTzBT5orTL8GvlKWNiepByqQfPDTrG8Yvr6IdhRhWuQs+
         tVbwMi/MpAUPzciX3JaMagts6dPQdb2LwlyHaVzwjwKtd069vId95zI45vwPpWuJfNGr
         Y9kl4Trpva6C1LN7yyaUqjbboN5dL9/LmFnwdmVYvDrajgY3HwtU+EhhxTAIFJZ50Ezh
         fShg==
X-Gm-Message-State: AOAM533MNl2pQqXaPVc7xzwCM3LyiE684yg3Q6UmanlIdJE7MrnKK/4h
	SSb11Hj65MoeRPg1i1SCv1Ez7TKtV2CYArjV4ndVxA==
X-Google-Smtp-Source: ABdhPJxl5Nx4LVTeD7Hw5mPfh0BFbx6/tbGoLMTTYNno8xkD7cWL5pIcx5z3WJl70xy7Pfgxr2RJ8F6GtfNPVtWf5MI=
X-Received: by 2002:a05:6512:3186:: with SMTP id i6mr15756047lfe.291.1625598748657;
 Tue, 06 Jul 2021 12:12:28 -0700 (PDT)
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
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 6 Jul 2021 21:12:17 +0200
Message-ID: <CACRpkdbF88Xaz-X1q7-5o9mpq7Lyq0Z4ReFBzCqgVFrbMWw3hw@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Leon Romanovsky <leon@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 8:36 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
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

Yeah that was the thing I read about in The Register through my
newsfeed.

Excellent hack! It shows that this can be done, but perhaps partly
due to licensing a Rust front-end needs to be written for GCC
from scratch as well.

Yours,
Linus Walleij

