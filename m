Return-Path: <ksummit+bounces-272-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F593BDF24
	for <lists@lfdr.de>; Tue,  6 Jul 2021 23:51:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 202AA3E1005
	for <lists@lfdr.de>; Tue,  6 Jul 2021 21:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F622FAD;
	Tue,  6 Jul 2021 21:51:04 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74108168
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 21:51:03 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id k16so458155ios.10
        for <ksummit@lists.linux.dev>; Tue, 06 Jul 2021 14:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+egNasBIj9EMUFU5Wwu1nvgxCZ+U9jX3uXdye1NifTI=;
        b=N33IKgiHv5UTb2qSG9jQSN5z7nMo/1tzVZVWfwlt+sb3gw8K9bd0Eat/OheXDrZZi+
         zHxvQcxCbv5NXah0IaYxdud92AIZOLTi9ALFtbpd1yYcsVRiXPnJFVp/B+Lp+kjCQRV7
         rMP2DqTfYAgs19O/ecK8UJon0WA1GoqB9qidIfWrE3mwQWRZrcDGEmjXboqhlZOnSBT+
         5pA6T2QlVU7XtLBT9u0S7E2numVYaR/EsHZjH4BzUkjBxltWZZPcaVG7LbAtXP0J/I/Z
         PWD3ZA4P74/RMxPyxrWUhfXIRNVtbydYtw9gRhQKaBzsZEZLF4B00Jl8YkQQt0J7XyfT
         MsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+egNasBIj9EMUFU5Wwu1nvgxCZ+U9jX3uXdye1NifTI=;
        b=H52dEcylwj5z6c44yU7PGGyVes7a+sNwLEEcMJU1388cl3zcSJr22ZXWf8MRURjeph
         HEwworBUnRuGRC3JTIv03TlxkAzDzUQk2pLCc8Wd364K2kN10YztdcYx770fTXaelQHS
         MTCkLVN790AJweDZK8y3D/7HxPihKlkl5okAI/WUsbIQDLSFZMPawXRFV5HXUi8b20kV
         ZWJKV6J/U9p85X4sx3YWJnB3DcF/3LJuL713/+wTIkPihjkSOypGkB4Gvh432dI4wLO2
         DB5WVG2mSWruh1VaBStbp7quYMa2b9zQYYPFqyaWtj4hOYrmQV1A2Q32WH1vAc1OXPTz
         5MkA==
X-Gm-Message-State: AOAM532F2G0/xNhPsKxRSvf6kCCsz0twbTvaEU9nZ0/RAl5DrtdWmsi0
	TBSSVRRH/LRNtCtinasjDJOH2l6mzDBrvfYuR9Y=
X-Google-Smtp-Source: ABdhPJwluWo+NvEQmVGzpIWCIrvDR5tQa5cCntUhcs0bEHXVAITb0suuJF69EiVyIldp9RcIzymFYuAVlhaD+LUDbKo=
X-Received: by 2002:a02:2b21:: with SMTP id h33mr1878388jaa.31.1625608262663;
 Tue, 06 Jul 2021 14:51:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <YOPcZE+WjlwNueTa@unreal> <CACRpkdYDF-7=O1gc=Fh_mywtAgAtEVZhvoZXDFsAHMZe4FPGHQ@mail.gmail.com>
 <CANiq72m3dkUOoAfQz8vY2UR3uaUkFD8rs=95k7sEm0KEqU8Zxw@mail.gmail.com>
 <YORwwQJfrpNQsGT4@sashalap> <CANiq72n=_LG3z8-JYVSiNeM8PgxauPh5_xjfY1hY_gnJaGsYng@mail.gmail.com>
 <YOSmkgFpSUWtf2ue@sashalap>
In-Reply-To: <YOSmkgFpSUWtf2ue@sashalap>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 6 Jul 2021 23:50:51 +0200
Message-ID: <CANiq72keYwLBY7_nRUN5RTxhQATgsi=LpYsCb59Zv+D4sg=iDg@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Sasha Levin <sashal@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Leon Romanovsky <leon@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 10:47 PM Sasha Levin <sashal@kernel.org> wrote:
>
> I strongly disagree. If we have abstractions for a particular subsystem
> all it means that someone at some point did that work, nothing more than
> that.
>
> That someone might have moved on, working elsewhere, retired, etc, and
> those abstractions are living orphaned in the kernel.

That problem is orthogonal to Rust/C. I already acknowledged that if
you want to refactor Rust code, you will need some bare minimum Rust
knowledge -- there is no way around that, for any language.

And indeed, a second language introduces downsides like this -- this
is also acknowledged in the original RFC.

What I am saying is that, in the beginning (when most kernel
developers are not accustomed to Rust), a solution would be that
subsystem maintainers could step up and help those doing a refactor
that touches their Rust code. We also discussed a bit of this in the
original LKML discussion back in April; and we also offered ourselves
(the Rust support folks) to help as much as we can if anybody is
having issues on the Rust side.

But yes, if Rust usage grows in the kernel, then eventually it would
be much better if most kernel developers have a handle on Rust.

> That's quite an ask. If the driver work goes in and I want to touch the
> driver API, I need to get Greg KH to write code for me?

I have not said that, and that obviously that does not scale. I am
just stating what I think could help everyone during the transition
period, assuming we share a common goal and accept Rust into the
kernel.

Cheers,
Miguel

