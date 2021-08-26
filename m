Return-Path: <ksummit+bounces-482-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E337B3F9066
	for <lists@lfdr.de>; Fri, 27 Aug 2021 00:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 527D31C0603
	for <lists@lfdr.de>; Thu, 26 Aug 2021 22:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA3A3FCE;
	Thu, 26 Aug 2021 22:08:10 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B113FC4
	for <ksummit@lists.linux.dev>; Thu, 26 Aug 2021 22:08:09 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id s3so7784232ljp.11
        for <ksummit@lists.linux.dev>; Thu, 26 Aug 2021 15:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=D/2DbmH4o7aRJ7Odn+m6pfLW9eXUlLLoJ6smTWfVw6k=;
        b=KrdnE+4uUJjUnFoRXLEaj5xxlTaDnLapHKyj/WQpo6bCFMjN4OCFpJF6EOfpavAGyy
         woNWCp2t4twhaQupZ5UA23//uTFsN3/zx7dh/srF/4FYS4N08ceJeSuM6VnmQq6cM9F1
         X+P+W+2jQVP9rUKYbYoZjnq2dktST/SjjvzAy0tBsivul1FGX5pzuLrzYAectZrJsNXV
         f6rgKhYlr6fKAFmYCDy9Vv+3BfS4TGrV/Uk/LGOo4N+DBfFYRkgjnmuNytfHaSm036s6
         sBSE2JUZmJyTc6ATid/ZNoWU9COMfu4eQ24zk7vAvTGIo1WI7Q86RFmyPdS6Y91h6wVG
         8t0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=D/2DbmH4o7aRJ7Odn+m6pfLW9eXUlLLoJ6smTWfVw6k=;
        b=VcysqzgyOnGUNZJtDUL77xAFIxyuVF+XQfdCqsBxWSoknwoV9xljLr8F3uB1p6Vzfk
         J9ZIIwpzbsFz3mJZ61L3ezQIouQTgHLFw+RuKKNS0VXD5KhUaywbeto1evWkF9WYzrYW
         3vjt8e7BJeayn3W9eXKgB+3NVbFSNrNmmwzHeZNHO/a1ECJ/8POXdX2aJj/ysMl34mYK
         TxAHW/EhW6qsf4Ti2eyVoY+NI0M/lndIAe3kt/UPLuo08NCkSK0hDsxnVkMXypv4J1uD
         VghEjQFNV22e++Kw6Uj3nNKssMVXLF0Mns2RGZPCluJscFlWxcMviMlIxFlpZ+Ouez9h
         GK7g==
X-Gm-Message-State: AOAM530mBfxsqjstM5ILa75xsVsZ405nm1W7bV+jB50ydGHMp4mUU/g1
	n0Mt8YRWsYYBKU0QCXxQqPdyGxfmLBgMQKF15ZW+Rw==
X-Google-Smtp-Source: ABdhPJwpP1agtKqykS1K7hCKpl7Lrjfi0tq2KDiFmfvCRhoxskouZUp4spih2gwBujXa18hLeD9HanPXk3+CrOubMPY=
X-Received: by 2002:a2e:54f:: with SMTP id 76mr4981668ljf.326.1630015687281;
 Thu, 26 Aug 2021 15:08:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEeCyJZas4LCnMWYTo9Wh49N9DoBChzG869x41BpUoZ+1JmCGQ@mail.gmail.com>
In-Reply-To: <CAEeCyJZas4LCnMWYTo9Wh49N9DoBChzG869x41BpUoZ+1JmCGQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Aug 2021 00:07:56 +0200
Message-ID: <CACRpkdYaRALXisvqhF8VyK-m0fz9aUFrurH2u5m=9DS4L3FHXg@mail.gmail.com>
Subject: Re: kSummit proposal - The Linux kernel in ChromeOS
To: Alex Levin <levinale@google.com>
Cc: ksummit@lists.linux.dev, Jesse Barnes <jsbarnes@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 24, 2021 at 3:06 AM Alex Levin <levinale@google.com> wrote:

> - Testing the upstream RC on as many platforms as we can as early as we c=
an.
> - Updating the Linux kernel on existing platforms (millions of users at a=
 time).
> - Managing technical =E2=80=9Cdebt=E2=80=9D and keeping the ChromeOS kern=
el as close
> as possible to the upstream kernel.
> - Current pain points in dealing with upstream.
>
> We feel 45-60 minutes would be enough and will allow a discussion.

I think this is really interesting.

Also explain what this stuff is: drivers/platform/chrome/* and why it is
so necessarily different and can't live in existing subsystems?

Also: your experience with using ACPI and when firmware can be
fixed and when it can not, and when/if the kernel has to accommodate
quirks rather than fixing the firmware.

Yours,
Linus Walleij

