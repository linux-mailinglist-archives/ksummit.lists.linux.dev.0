Return-Path: <ksummit+bounces-266-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC923BDE3F
	for <lists@lfdr.de>; Tue,  6 Jul 2021 21:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 9FD041C0EFC
	for <lists@lfdr.de>; Tue,  6 Jul 2021 19:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EECDD2F80;
	Tue,  6 Jul 2021 19:59:29 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E960F70
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 19:59:28 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id h3so23565ilc.9
        for <ksummit@lists.linux.dev>; Tue, 06 Jul 2021 12:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BYyuplLB6VFF72yk217sWc7Ns25p27J19r7psQIVioE=;
        b=odZrlbIfN81pGWJOyMiY5iNM4+Vlzt8jwMnKwhIFY7Tt1us6l3L1X0oaFo1AL9NN8v
         aZx7fYVgr7HOyHwwjn/E4nga4B+klUG93hQmsyTJ86Lxr6TmAL/z6FYvqJEowVNrc/H/
         HMqz7d98K+l8PQVMvYMSgsIoD7WC2efTba6+l8CDaiSNxQ+VN81nXa+WaDqXoT/N6zsW
         PmwPHRHDe+PWCloWfLEszwWuUKv32gJQIX5Z5V+7kuApU6Kb+qbGnDe7pcd2eliY91Ry
         JWRz3a6kM9N8KNeRBDRPmL7UxD62Ufd1yhJQn/sZkGJHrqk66eV1vpGoDN2QQlb/9gPN
         uT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BYyuplLB6VFF72yk217sWc7Ns25p27J19r7psQIVioE=;
        b=diHjnv/2h7/zo+v40MjOwCWNw6t9a7ioTt8V4D337dnmBOlEYoUDPoFeHWwrKxDlb+
         OCYKkJMb6/SfEdXWoUkih8OX/Em80fQWHRkzTyIhHxw3DHU5F8sp9mi/FhJNLfWc/31G
         MXqiRvIuGMqOrFthZ/nl0Qpsp+p0U4lPY8mOF6+8HKntpVKuE5jo1QeUnRDJNXceptSk
         i3kgrrH063ns3J8mOMX6KhtdrpUgZcjSHnUGaa3oBiZUXiUcXo7EQnApQYESwpPOnVLm
         UHoCR1BYxcr69MvRqDagNZ3wTx1DQphjvFbzoF1rONZV7dqZL32GHtrSeYd9VVsR6aj3
         Hb/w==
X-Gm-Message-State: AOAM531QD6qYOSESNPyVGkdnmU3t+DSrDHqFXKfQLb40IDp/LDXioiDW
	qH47teFZu0pZYfAyosZg+5RewPG8AKn3pOqrGpw=
X-Google-Smtp-Source: ABdhPJzkJ523zsB26tixYqQ7bBmcPvCD2QBCGxIeAuq4RU2PHplECsS+5+eP6+uJbBxVs3x6O5i5DLOWTxFGXNn6pWE=
X-Received: by 2002:a05:6e02:20ed:: with SMTP id q13mr15722709ilv.176.1625601568205;
 Tue, 06 Jul 2021 12:59:28 -0700 (PDT)
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
 <YOR52oSIGkNA03jf@pendragon.ideasonboard.com> <CANiq72=vjXYN-A1gZysXzKvR+NgmxpSGOiOGro0S6tMhYAwR6Q@mail.gmail.com>
 <YOSjETKWhuRz0Poq@pendragon.ideasonboard.com>
In-Reply-To: <YOSjETKWhuRz0Poq@pendragon.ideasonboard.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 6 Jul 2021 21:59:17 +0200
Message-ID: <CANiq72=LrxpE_2WmdDdb5G=8ZbWnZLQTetmRjz+yH024eT4Fag@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sasha Levin <sashal@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Leon Romanovsky <leon@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 8:38 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> I agree with you here, it's a honest way to look at it: adopting Rust as
> a second language in the kernel isn't just a technical decision with
> limited impact, but also a process decision that will create a
> requirement for most kernel developers to learn Rust. Whether that
> should and will happen is what we're debating, but regardless of the
> outcome, it's important to phrase the question correctly, with a broad
> view of the implications.

Exactly -- very well put. We will definitely get the most advantages
from Rust if we all treat it as an actual second language.

Cheers,
Miguel

