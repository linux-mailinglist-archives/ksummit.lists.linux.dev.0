Return-Path: <ksummit+bounces-241-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB993BD83C
	for <lists@lfdr.de>; Tue,  6 Jul 2021 16:30:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 22DF63E10B4
	for <lists@lfdr.de>; Tue,  6 Jul 2021 14:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843912F80;
	Tue,  6 Jul 2021 14:30:19 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877CE168
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 14:30:18 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id h190so3073602iof.12
        for <ksummit@lists.linux.dev>; Tue, 06 Jul 2021 07:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=95zCskDBz86au6UprMKlARup2EFZJMFxF8SIZMBQVmI=;
        b=Kncl07mbnRch29K4FfRAeCQNy9QGfpXGgSNB1sasRgSxgapjuPk07ADdQd6QygUi3a
         Lh+MyP3YxDxB0sTku1924a/VcJPLq0+ecE1bBJWk1GG35QqYTk/wvL97/zGhc30oONo0
         Cap5/KRiuji38fJgqxCDXPqa9xSJEnHbEYpCTRPrMyCV4gMYggp8djTwf6J2AMGEJ7Xk
         ZoFT0+tDsrrkAtHJwTRmL92fxta/ryakEXk/IobYGTz/u152H4hj2ya5PENEWCYFE4d6
         nG8BAaFMTnpB6DwJ/CmvBSA8poAu5jWFkZuNRbNF+x/++KbHDFimk6VD89YIRjmPwshc
         AmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=95zCskDBz86au6UprMKlARup2EFZJMFxF8SIZMBQVmI=;
        b=ZZ9JtPOykIqx0Rb3+qLEJd/ZzBOuKlcUqm9sSnAwYfcAqh9OGyujE40TSdADHX1K2K
         pPKuneevaVV+0eswvOP/RoD998AU0Wu/Ng1IWW3W/Nmt0BzW5F3c345DY4gPI3nh0Ivq
         Hq3EEKtQpS+23NzEcmx+jyAU7J8SJMwJVbxflrs9V0I8ipyUiPRmtQ5vNmzSWFrbfTiH
         jg1avxBdBaES1rTg7ELmJ6JjfZ51kgNPEFX02ZfBbncfUMovSbNbzxuQeMHUCqnBgivR
         HlSMSxfVV0KVgZGhePGPIEcGMywbyV6/9p/8DrhNgdV95lKGi7rmkMEBmhl9paH7s8dq
         jT6g==
X-Gm-Message-State: AOAM533vEzw/ElmMrQgUuaVasOhOOEGcpKV+AmHc3teRSGZ2ZE1VbYTU
	nkri6Bep1QnuJLjA5O7thRtdAT8Ldo20Y+G5ksQ=
X-Google-Smtp-Source: ABdhPJz/BOOZ5l9W5CJB37TRlmQnq+B+2WejfuSu1XKuZfS5TxjVFH52kc7klb9lRFp10p9TvB6cJjr1tcC4P28tf/w=
X-Received: by 2002:a02:2b21:: with SMTP id h33mr401537jaa.31.1625581817824;
 Tue, 06 Jul 2021 07:30:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <YOPcZE+WjlwNueTa@unreal> <CACRpkdYDF-7=O1gc=Fh_mywtAgAtEVZhvoZXDFsAHMZe4FPGHQ@mail.gmail.com>
In-Reply-To: <CACRpkdYDF-7=O1gc=Fh_mywtAgAtEVZhvoZXDFsAHMZe4FPGHQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 6 Jul 2021 16:30:06 +0200
Message-ID: <CANiq72m3dkUOoAfQz8vY2UR3uaUkFD8rs=95k7sEm0KEqU8Zxw@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Leon Romanovsky <leon@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 11:55 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> AFAIU the idea is to replace an entire piece of code in C with the
> same piece in Rust, it's not like we are going to develop a second
> kernel in Rust inside the kernel in C. So both/and not either/or.
> I.e. you have to compile some pieces of the kernel written in
> Rust to even get to a working kernel.

Let me clarify this, since it is important: no, we are not replacing C
code In fact, the Rust side is based on the C one.

But that does not mean we are not rewriting a second kernel either --
for instance, we have red-black trees "abstracted" in the Rust side by
reusing C's API.

In other words, what we are doing is "abstract" the C APIs into Rust
APIs that can ensure as many invariants as possible statically, using
Rust facilities for that. Thus Rust is one more consumer of the C
APIs.

Cheers,
Miguel

