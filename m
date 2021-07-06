Return-Path: <ksummit+bounces-255-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B373BDD28
	for <lists@lfdr.de>; Tue,  6 Jul 2021 20:27:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 634033E10A6
	for <lists@lfdr.de>; Tue,  6 Jul 2021 18:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEAE52FAF;
	Tue,  6 Jul 2021 18:27:02 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E46C72
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 18:27:01 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id u25so30347561ljj.11
        for <ksummit@lists.linux.dev>; Tue, 06 Jul 2021 11:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y+jSgguqQMJ63Hz0tCFlpYUfIugvGoGLFiwg8LiB4Ig=;
        b=mP/4pcpwhAOIyO9abbmm7Tpwu5xmzC1wGzTPsVv46KdDUpnoDZpitV+R6c+FNV7leJ
         vco9cS6v67ChmyD5bT9TvnO7g72SDxwlvxLYGPABEhcGl+tX1/FKciB9+1lOxJTrbLsq
         wI7KA9leLIAcE+53cTmXpBBd4euOSyAHCM3mWOy4eeko6kn1slQxcwEbprT47zkD2+JD
         uDlD7iKr0eqR/FHqDZ/US0tFCghL1L8xOE/daFTSoQ7qQBOP6o4u4AN0wpO9iIiFWiRk
         icg8F+macZiBRhZWWkxikp6elzr4ZEmFhQrM2m4zSYvY/NM4TAHPMjxlsumsriPq6ft3
         1rhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y+jSgguqQMJ63Hz0tCFlpYUfIugvGoGLFiwg8LiB4Ig=;
        b=Ud5RUljE7l5hT9MYriLoVzHyDzOwmAEMF66f23L88O99KH0h4Vd7nfPyc4Y+d1N3dc
         1jr1+FeXepdRmwrN0quD0maypAYufLlwDRNTR2megCM5ruwkYJjGXwYQeOCSf8mrIbtC
         RMH4stk2bTFtAJQVsNRsQEx995TAyPb2z3neMYHKVrhFn3xBe0Ob4mxVPqMuIKtGlYtY
         geoSwJJ5tqva0+UTZG25kDDwp+AGul/SUYkpYRTqXyfWB7fM7ZsayjQZvzXXakFkZ7Ef
         CVJ8WbYPusz/QsXEzmMW4fk4kEmSiw8PMMygK/4QPayjjHvL9vxbQj/n9ayAHjz1GX24
         r7zQ==
X-Gm-Message-State: AOAM532/wbNObcsnqmKyI3KfFvgBUCKiqCOPQmEByawv8XKIt5ZnXvHD
	uxkFwjdwVovKY+CrUmwpoe1M9QFa46IMM2QoMGGrOFOcDJdU+w==
X-Google-Smtp-Source: ABdhPJyImtpnGiErZ4QqYOwbt6kTiqFpd3oQz6u3iNRR8i/BJQ3OzIuo62sFI2J1UvsJ1E4WxjfLu9Ul8SCYKMrbRKg=
X-Received: by 2002:a2e:9483:: with SMTP id c3mr16166204ljh.273.1625596019540;
 Tue, 06 Jul 2021 11:26:59 -0700 (PDT)
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
In-Reply-To: <CANiq72m3dkUOoAfQz8vY2UR3uaUkFD8rs=95k7sEm0KEqU8Zxw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 6 Jul 2021 20:26:48 +0200
Message-ID: <CACRpkdatK-U16oefmGoov7u_obekVP4m1fT=6joCVpT00Sm09A@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Leon Romanovsky <leon@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 4:30 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:

> In other words, what we are doing is "abstract" the C APIs into Rust
> APIs that can ensure as many invariants as possible statically, using
> Rust facilities for that. Thus Rust is one more consumer of the C
> APIs.

This reasoning assumes that Rust is in the "leafs" of the kernel, if
such a thing even exists, and device drivers have been mentioned.

If we want to *write* a subsystem in Rust then of course it will
go the other way: Rust need to expose APIs to C. And I assume
the grand vision is that after that Rust will eat Linux, one piece
at a time. If it proves better than C, that is.

The leaf nodes imagined as a starting point is some device
driver subsystem where individual drivers for that subsystem
can be written or rewritten in Rust, correct?

And I asked very pointed questions as to whether device drivers
is really a good place to start.

If the whole rationale with doing device drivers first is strategic,
not necessarily bringing any benefits to that device driver
subsystem but rather serving as a testing ground and guinea
pig, then that strategy needs to be explicit and understood
by everyone. So while we understand that Rust as
all these $UPSIDES doing device drivers first is purely
strategic, correct? I think the ability to back out the whole
thing if it wasn't working out was mentioned too?

Yours,
Linus Walleij

