Return-Path: <ksummit+bounces-270-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D563BDEEC
	for <lists@lfdr.de>; Tue,  6 Jul 2021 23:32:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id F16803E1044
	for <lists@lfdr.de>; Tue,  6 Jul 2021 21:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 847922FAD;
	Tue,  6 Jul 2021 21:32:14 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5C7168
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 21:32:13 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id y8so388002iop.13
        for <ksummit@lists.linux.dev>; Tue, 06 Jul 2021 14:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cnUoSrW9rk8e/FSKyNHS4k9CUnDp6erUN2wyVfXW/FM=;
        b=u44pvAszQaPK0q+MpF/UrXzevzJLTbLS3F7OClCsFLsa4i+g6EfN4e118gXjYLZIih
         xaJOZq7jIU6cd1HiE43uTUrdjJ+b57TenkKrZLg+J0cDqSfE9A4bB1s7vUH2HTgUkxAa
         +/gXZYO8IkLbEjLZl+h1hS06rk9JtNYz8M+wP92rstRTP8uOXxxY+Z5DJr2gaUyKdisw
         ivHBf5JNV+bmKKN2aYh5rxMnZNMVYxTewu5nJGWQ2SUYVWJcIdzGKZrGTDPdNsHr37eu
         eLjpCwje8oPgM/vJSIDnrvESLxXPadFzZmzY4+7z7g2K9FJtD5b3JEsvbeFuIO/7aDrE
         hd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cnUoSrW9rk8e/FSKyNHS4k9CUnDp6erUN2wyVfXW/FM=;
        b=FJmuXKP+3pzo8uKLmJ/UDW6tCMnhSwcevp4bMbefg/jtpeK+UBPX1T6A3sgSYBuh+g
         ue25keXlzR7zUeRnFxzI2YD6rXq7O1kH1EQV6jY4RzQzL4cn3OlC7dQ4YwgSLup78KfV
         X2/gASnRkRegDlsZ2Gnqu+pXsi1KC1E6Fa+5QeTip6TkCvgXU15YO+Uw5M0r97+DMqvf
         iQBxgQICBEXzFydAC9Ne/Im8Zf6yd/DHLrUwe/yThLvEHzzJTmUwbaVEhLp7QmM9kYbs
         rbHggvFlPrHLcHGBDDEOuc6Ma89AX8Prf93Lr0WjVGKXRhAVoBncwL5l3s2lQqVnCZXt
         M+Xw==
X-Gm-Message-State: AOAM532wkx/bksh31KH3DLDhPF602MXmo3h4XztGtQyCRy/OxgsWfz7g
	/xRw+VXZ/ueodOXnqcrLFVv06BdNyj7Tq3o0T6Y=
X-Google-Smtp-Source: ABdhPJwIgrflD026f+omPfQjh9Xa5jmGDTVCUdcaD0kojPSXgZQIzYxzEmLlur5Xmo+7iu8ebDTZQx44Ls1hv6P1CwU=
X-Received: by 2002:a05:6602:2c85:: with SMTP id i5mr2297718iow.91.1625607132911;
 Tue, 06 Jul 2021 14:32:12 -0700 (PDT)
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
 <CANiq72no33T6RXMyZ18bS_nVaUcOpWEmu15Bs=+zJPnnhrnYRA@mail.gmail.com> <CACRpkdbF88Xaz-X1q7-5o9mpq7Lyq0Z4ReFBzCqgVFrbMWw3hw@mail.gmail.com>
In-Reply-To: <CACRpkdbF88Xaz-X1q7-5o9mpq7Lyq0Z4ReFBzCqgVFrbMWw3hw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 6 Jul 2021 23:32:01 +0200
Message-ID: <CANiq72=O2MD=3TCHfY5acjS2saJCQ_OiSCX_o-Hb7TRt4qXQSA@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Leon Romanovsky <leon@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 9:12 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Yeah that was the thing I read about in The Register through my
> newsfeed.

Ah, yes, I have read the article now -- it has a few mistakes,
including that `rustc_codegen_gcc` explanation, so it is
understandable where the confusion came from.

Cheers,
Miguel

