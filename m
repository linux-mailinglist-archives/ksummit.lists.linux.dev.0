Return-Path: <ksummit+bounces-486-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 450E93FA083
	for <lists@lfdr.de>; Fri, 27 Aug 2021 22:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 5E1A61C107C
	for <lists@lfdr.de>; Fri, 27 Aug 2021 20:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B4B53FCE;
	Fri, 27 Aug 2021 20:22:30 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB423FC1
	for <ksummit@lists.linux.dev>; Fri, 27 Aug 2021 20:22:29 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id j12so13451255ljg.10
        for <ksummit@lists.linux.dev>; Fri, 27 Aug 2021 13:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aSFzQmaEBCemUJGClUhvpAG5aG1koPpzDGAIPbkvarM=;
        b=UACWa+lGhq80lKwnwVJuWAWCYwr8YDmdppE9ssyHe51qdm0rE0h+yHKj/QLEOPx+mc
         m9x8WOPXoXiJGULs4KBUJ743XRktdeIj5Zvgd7Po76lGcnKSpcTmqDd8MahIgkxhmwyU
         dstBq1UYiGt0Vbsx6yuc8N5kFQMx3ktdgQMuyHsOyDBOFwahgrjTuB62UxHO+UIiteeY
         xU05vXal2dMyJ2ey77VgxDthcAFKTREGqAKBpu0OYMUIQX7UCgBr+LePVwtStZJFjI0y
         bQCYbGNaSzHDQjoD+Xze76FSmvrIg5YpROpBvsOF8Y8FYFxrAs+8WxQOZAy6da5RfoqE
         Ig9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aSFzQmaEBCemUJGClUhvpAG5aG1koPpzDGAIPbkvarM=;
        b=moHymLNs/Yxuf+77C35u1xb4hCqvuRW4wBPIo9cSTtAtJz4KG1/djI/VvKhjvfTJF6
         AgPQH3dY4L9Lh6ux2jrhetnb7E0m4wPcZvn/DdPURcmFrSnIquXn1st0LBL0mFJxroL0
         wDO8pKaWJGTWQv0cxL7w6uiE2QKqQmAAVpDa9eiSS2S+r9+AyAuf+jeaW893FYacaFtV
         QClHULtzmxDBp2F3iF1rEic3dzQoRe1k+ocJ85+S0Xgj8n7vOvcgpF08/kvj7rSlXj3i
         BDaj9a2Af9CRrLBFmTa7BX4ZtRauQndbYvHB1U8qCF9d0NcP618cAvrDLXdTQKIRa7FK
         KPHw==
X-Gm-Message-State: AOAM530wbvdwg8kqSFArtZtd6hhYt49hBKdUNxWtfDb4J7dVtUto83Ci
	FJ+ppDy8LjQIxi2HRuP/zXxF1golwp/2i1YdLdQJ1w==
X-Google-Smtp-Source: ABdhPJwmVTLKtydpOswwxf5+w+SayoCRnFM1NF4N6K09P/C4GfDwuNoEfl0lnRvWLVEbMPTR+Cx9QJmgdcYhZvc+Xb8=
X-Received: by 2002:a2e:54f:: with SMTP id 76mr9265934ljf.326.1630095747228;
 Fri, 27 Aug 2021 13:22:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEeCyJZas4LCnMWYTo9Wh49N9DoBChzG869x41BpUoZ+1JmCGQ@mail.gmail.com>
 <CACRpkdYaRALXisvqhF8VyK-m0fz9aUFrurH2u5m=9DS4L3FHXg@mail.gmail.com>
 <YSgVPi9H4oBt5uy8@pendragon.ideasonboard.com> <CAEeCyJY8bXNQHL-kSbxrGcVwQ45kTaR9pW4eOm=ZShEwE5hFiQ@mail.gmail.com>
In-Reply-To: <CAEeCyJY8bXNQHL-kSbxrGcVwQ45kTaR9pW4eOm=ZShEwE5hFiQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Aug 2021 22:22:15 +0200
Message-ID: <CACRpkdaaTXH8GMz2GrYoQOLDcTjaHSeGv8-mM96q63c5Nbx=8w@mail.gmail.com>
Subject: Re: kSummit proposal - The Linux kernel in ChromeOS
To: Alex Levin <levinale@google.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, ksummit@lists.linux.dev, 
	Jesse Barnes <jsbarnes@google.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 27, 2021 at 3:01 AM Alex Levin <levinale@google.com> wrote:

> > Also: your experience with using ACPI and when firmware can be
> > fixed and when it can not, and when/if the kernel has to accommodate
> > quirks rather than fixing the firmware.
>
> We can definitely touch on this topic. It might be too narrow of a
> topic to discuss widely (I would gladly have a virtual cup of coffee),

This has been and remains a really big and recurring problem
for drivers across the whole board of devices using ACPI, so I bet
more people are interested.

Yours,
Linus Walleij

