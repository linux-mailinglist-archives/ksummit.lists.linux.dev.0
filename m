Return-Path: <ksummit+bounces-236-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 538963BC8BD
	for <lists@lfdr.de>; Tue,  6 Jul 2021 11:56:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id B040D3E1023
	for <lists@lfdr.de>; Tue,  6 Jul 2021 09:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A172F80;
	Tue,  6 Jul 2021 09:56:03 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052BA168
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 09:56:00 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id p1so1597185lfr.12
        for <ksummit@lists.linux.dev>; Tue, 06 Jul 2021 02:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P8GOYx7qg/zPTs3YutLiJLY5N8Ak3SLntfGp68zjeQw=;
        b=u/VcV5AVEAsAoh0OflII1P0HAxj7YKzXX1nS9U1A9xCRG+URANYlIqn/ag3G7ygXTt
         l2eaEgZSdpT5Bhhdw/kiHpoj6eI8EtUwQfDOzkTkKQvsQgseiWd36sI+aOunWVnR2slS
         2w247Z8Xhbn/SiA/VQKd/Z8hoMLbvD01Vmn6szS78NcV4NU+EfBxR7tQ/Ev/EBsgzEnu
         +LqtZJ0rNukBte3Txx9K3UdrSqdoF2ZiP8dthatzF3xYcSVYLfrQGU1pQzUDa5/1BWxR
         lgQ6SjWNZoqekjeTRnWtXtxYaLRrPmfTkRyvceflKOytagiG9ZUDVJwnfKZoBp4OGCZ0
         wrxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P8GOYx7qg/zPTs3YutLiJLY5N8Ak3SLntfGp68zjeQw=;
        b=ntd41XZVPm6QmMDnySfkqUuQX3PEHY78bfGqnMsv1zocLN/dWUj2C8S00dlMMxH03z
         YU/CIqhGrxZO8tCVU01r3uYA3QkvR2u1Z73yhlFAz4M8T9WC3vvKb5bFnCZnuOX8R8H4
         3eYgNInIlOe7Y/Nt9IrR4oU1j/ZMeXHr07/iDk2cpu4XMxGvRWMR91bbQ07CcGVyRgfw
         fQgIGGLL+gAOIkZBbLuJ6q9WeWvvdRrODTJPyIgqfzZ9jiWTIKa8RZ6zTsgc9nV5Mzds
         8mhMqDvm/ZEhRzSuNkiw6JRi7DSr1V6AaiCfeZvbjDu+982D7fm2hFHDrQZ+xsa4W90L
         i5hg==
X-Gm-Message-State: AOAM531hyHKOG03a7VkyvBUi8kRInbg8DKLEQU+AYizUsONle7TAFN+B
	wZer7T6pqdAUGLQo5KzFNy4YntpNzYtgAkClApedfA==
X-Google-Smtp-Source: ABdhPJzKFP6YTbuqnrFsJ1WHV064sQkvh3o2vtiuj4RBbBtX7olBi9uNYKY6cIAJ3VmYj9i5udKgRIqdOqFLwPxI3WY=
X-Received: by 2002:a05:6512:110a:: with SMTP id l10mr13618253lfg.649.1625565358362;
 Tue, 06 Jul 2021 02:55:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com> <YOPcZE+WjlwNueTa@unreal>
In-Reply-To: <YOPcZE+WjlwNueTa@unreal>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 6 Jul 2021 11:55:47 +0200
Message-ID: <CACRpkdYDF-7=O1gc=Fh_mywtAgAtEVZhvoZXDFsAHMZe4FPGHQ@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Leon Romanovsky <leon@kernel.org>
Cc: "a. Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 6:30 AM Leon Romanovsky <leon@kernel.org> wrote:

> 1. The addition of another language to the mix will hurt a lot our
> ability to refactor code for cross-subsystem changes.
>
> Just as an example, there are many changes in DMA/SG areas that are
> applicable for many drivers. Even simple grep->replace pattern will
> be harder and longer if it is needed for the drivers that are written
> in different languages.

This is a fair point.

> 2. Testing matrix will be duplicated, both in compilation tests and in
> verification coverage. Even now, there are some kernel subsystems that
> so much in-love with CONFIG_* options that their combination is slightly
> tested or not tested at all. So imagine, we will need to recompile
> everything with Rust too and execute same coverage tests again.

AFAIU the idea is to replace an entire piece of code in C with the
same piece in Rust, it's not like we are going to develop a second
kernel in Rust inside the kernel in C. So both/and not either/or.
I.e. you have to compile some pieces of the kernel written in
Rust to even get to a working kernel.

Yours,
Linus Walleij

