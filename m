Return-Path: <ksummit+bounces-249-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 037AC3BDA41
	for <lists@lfdr.de>; Tue,  6 Jul 2021 17:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 3A0D61C0EBD
	for <lists@lfdr.de>; Tue,  6 Jul 2021 15:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E4F2F80;
	Tue,  6 Jul 2021 15:33:55 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510B4168
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 15:33:54 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id g3so19904785ilq.10
        for <ksummit@lists.linux.dev>; Tue, 06 Jul 2021 08:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JK6E/zp3DC71PmOJoaMx2I6f/zZCvTR+cWFdomidFWU=;
        b=iMZYBbI8J6Un7bLZ/THC57cNtFa05OlWb2Xj0BQS1ShmMHTrDG+N+eM2+WW1ju/Ux1
         c5COEYI2tN94hmlsNbG+B2q8tCC4mhNYnKQG0PpM06sJv6QrGMl0qgEUTPUn7GXh0Su2
         JF04Srj6bCrxkgQ8Y0QFBeaDE35ivL/vUWJ48+c2TWW465zmN0YtiVsOQEu0lRSy/l+H
         EzzMx3SbwrqivD36Fgl5QfdnveNSJhJUl5IUDiPciRosiiqvjDyyqqSRGc4V86y+mYxn
         tOyIIHyGSUiCh+ZqXUn6/Vz1zYpSLCCtGXpMw/lXzFgvTUJyaHXqLkGZui51OoR6rU6R
         hcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JK6E/zp3DC71PmOJoaMx2I6f/zZCvTR+cWFdomidFWU=;
        b=t5RR0hI7LMZ61r4F5iydf5o+Og+LJnqA7Fc8dPCvU5dRz615CtSVqflK8plwE391LY
         75cW9NAarGwI+0zELjd37HHEnG18uqA6IFpL6nQ6w9nPw+iUheRkvXG+a9lAVS04BkOB
         mMvGy4KTNKZXZWDwumOGGNK9mHHLgJfrNQVyOVEkhgyxRoghKGv56wfiQziOvZmXozqw
         UAZ5Xa1xD2vagG0QKfT+uqve+40Dr70+idauOH0AOgDE+eq66XnDaupEbzGDJMaizGX0
         ajfKobJrm2LooOS69N782HWhxPLqSVQb2ovLZVjAz/CnTfOyUXZWF1lw6zwHmUBZuYVJ
         +JaA==
X-Gm-Message-State: AOAM532x3xZc6egF4vpwOW5uqblu92b3QBEBG4XdFIUfGwRfE5prEIGc
	17b46bej8VFH2ncRKMm8K3wyDyLRy66gOQral/8=
X-Google-Smtp-Source: ABdhPJzI8ua7c9zcP9LynIPzqtXOzD9VY6oFjRf2fifhR/ksSFweCT0ehcJxGeGS4pqw/HDCx/65rgOJuxcJKqcCnLk=
X-Received: by 2002:a05:6e02:12e3:: with SMTP id l3mr15044344iln.203.1625585633552;
 Tue, 06 Jul 2021 08:33:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <YOPcZE+WjlwNueTa@unreal> <CACRpkdYDF-7=O1gc=Fh_mywtAgAtEVZhvoZXDFsAHMZe4FPGHQ@mail.gmail.com>
 <CANiq72m3dkUOoAfQz8vY2UR3uaUkFD8rs=95k7sEm0KEqU8Zxw@mail.gmail.com> <YORwwQJfrpNQsGT4@sashalap>
In-Reply-To: <YORwwQJfrpNQsGT4@sashalap>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 6 Jul 2021 17:33:42 +0200
Message-ID: <CANiq72n=_LG3z8-JYVSiNeM8PgxauPh5_xjfY1hY_gnJaGsYng@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Sasha Levin <sashal@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Leon Romanovsky <leon@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 5:03 PM Sasha Levin <sashal@kernel.org> wrote:
>
> Does this mean that anyone who wishes to modify these C APIs must also
> know Rust to fix up those abstractions too?

Please see my answer to James and Leon, i.e. if we have abstractions
for a particular subsystem, it should mean somebody is happy to write,
use and maintain them.

That means that, yes, for subsystems that have Rust abstractions, if
you want to touch the C API, you also need to do so for the Rust
abstractions. But for any heavy refactor, I would expect maintainers
being the ones doing it, or at least helping to do so if somebody else
wants to change something in the C side and does not know how to
update the Rust side.

Cheers,
Miguel

