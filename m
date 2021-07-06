Return-Path: <ksummit+bounces-256-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 523F63BDD2F
	for <lists@lfdr.de>; Tue,  6 Jul 2021 20:29:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 119253E1070
	for <lists@lfdr.de>; Tue,  6 Jul 2021 18:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C5B2FAD;
	Tue,  6 Jul 2021 18:29:34 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6952772
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 18:29:33 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id g3so20479199ilq.10
        for <ksummit@lists.linux.dev>; Tue, 06 Jul 2021 11:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L+6hL4cETKSQpkfuXOfoKyG/L4giHXOy2L15aNboUGA=;
        b=tVHh1o4k6sjy5NQQKINcyss2W9fEF78oNxPoqkMNY4JtH/28Rhr43wQq/i0IPclhLW
         /3EilNwRgyxQGO5Y4Y4o0r22XyiRx54Q3SY5yggnktu3RT6pXykoaZn01BNchPaQnaCF
         oOqDGyJOvmjpXgx5lJcnvzBl5Xe5PngqJVItnSfLhWhAIRXZXO1bvGOjFUCezHu2g0RW
         x39vN1jAJkxzrgMT8Ti8AzSiK/kJwQQVBXAZXUJaljorRwCUFiMjRiDRLBP4tcq6xWr2
         UMd53ObpERMAfrMHoEA00EH9M8zvJdKzLt8ceqL6jTl4eugeBR8DWVk+fJV1kHpZyhmr
         Y/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L+6hL4cETKSQpkfuXOfoKyG/L4giHXOy2L15aNboUGA=;
        b=ILeFXzf8ChFP9eYSeGtJDZEE4aetwIOqOulPDshezD/XbwQ3yP5rbK6BYiDCuVfEcG
         cTjr3zsjSUSG2VqOEd9IckOyZs9uCOuWrg28tc6ZmzUEXxA73ePowN2LJ+7MzyygYBir
         Z24ekGg2Cp7kSYgD1XaMvTPJaEkwrWLkAjL/bN1lrDpDAyKltdOINlfr35uF+OJfZR+I
         /9KRjrINk1XcnsylzNrpaeVbpQ+xNlfTzhLOStCjEbXQ6e851TSMBU7oeoMK5ox5KTNk
         sseUTOtJsv0+i308FoIbIIWds+iULxWLVacnG8V2C3oPMA9m8LVXsjRbvMKhskeZocpS
         UFBg==
X-Gm-Message-State: AOAM5323dw5PnsGe3i3QUSVU28OD3Zn5LmJOP4pHa8TnaI5fs6wcp3xt
	RMTJzwmE+MSM24oBIHoqwvp3xyiS99MMIjSmZVE=
X-Google-Smtp-Source: ABdhPJxviXakglgD/rAUn4yVWSjU92ZdCD+vKqL+D+eMNBM6lMhXptE06b4JxcT3w7yEdjAaefYn4EteCJjxsF/vA5w=
X-Received: by 2002:a05:6e02:ea2:: with SMTP id u2mr14973920ilj.247.1625596172647;
 Tue, 06 Jul 2021 11:29:32 -0700 (PDT)
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
 <YOR52oSIGkNA03jf@pendragon.ideasonboard.com>
In-Reply-To: <YOR52oSIGkNA03jf@pendragon.ideasonboard.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 6 Jul 2021 20:29:21 +0200
Message-ID: <CANiq72=vjXYN-A1gZysXzKvR+NgmxpSGOiOGro0S6tMhYAwR6Q@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sasha Levin <sashal@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Leon Romanovsky <leon@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 5:43 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> There are lots of core APIs that are used by most drivers and that are
> not subsystem-specific, so those will need to be considered too.

Yes, but those are maintained in the "common"/shared support, e.g.
data structures, sync-related facilities, etc.; and hopefully will be
much better understood by everyone.

> Additionally, even if there's a subsystem maintainer willing to maintain
> a Rust abstraction, it also means that someone doing tree-wide or
> subsystem-wide refactoring will need to pull the maintainer(s) in and
> make it a team project. I really don't see how that can scale, tree-wide
> changes are already very painful.
>
> I'm afraid that doesn't really match how development is done today :-)
> Lots of subsystem-wide refactoring is done by developers who are not
> subsystem maintainers.

What I was saying is that the changes need to go through the
maintainers, which then would know Rust and the abstractions they
maintain.

Of course, somebody wishing to do tree-wide refactoring needs to know
at least a bit of Rust to at least know how to refactor and submit the
code for the maintainers -- but that is a given.

After all, if we are going to have Rust as a second language in the
kernel, we should try to have as many people on board as possible, at
least to some degree, within some reasonable time frame.

Cheers,
Miguel

