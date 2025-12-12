Return-Path: <ksummit+bounces-2669-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C954CBA111
	for <lists@lfdr.de>; Sat, 13 Dec 2025 00:48:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B52723002B99
	for <lists@lfdr.de>; Fri, 12 Dec 2025 23:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940F82BDC3F;
	Fri, 12 Dec 2025 23:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b="vdOCz8lN"
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA36221540
	for <ksummit@lists.linux.dev>; Fri, 12 Dec 2025 23:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765583316; cv=none; b=McbYDjw9iiEjf56dYCbTBEioc5xGiyGJ5UzDf2sVXjGSd7iRqVwuu3uZ0RGnvdXnuE0s0Q5CJNrfXQBud6fd2em3SqRbDberD6t+SLATTVP/kaBVZdQSHnw5TfTuF0XmahsxAZvr5PvKTKENMlpuMG8zpQfyeGdYjhiHsXkik6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765583316; c=relaxed/simple;
	bh=s/tBHiYOy2eC7/UIVWnocuiWDk5Z9I2ep7hg/uuwhFM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sd13yBWpM+ct5QrX8Z38Mv6r9+HUPWVBABqTpuSYnxB8C9YGZzRx+D4NaMe5J67aDAowKKtuGbneGfNZEyqxjkQd0StIK2Jv+lvhsqao27KjSIvZDpyU/fQ1nJFDNA70ZzJyxrJXFkivMYulrsLGBCAM7Z0CkdSpX2yAHAMlWz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org; spf=pass smtp.mailfrom=networkplumber.org; dkim=pass (2048-bit key) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b=vdOCz8lN; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-29efd139227so19788955ad.1
        for <ksummit@lists.linux.dev>; Fri, 12 Dec 2025 15:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20230601.gappssmtp.com; s=20230601; t=1765583313; x=1766188113; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWP8BFs1bgT8Z4A6IjuNlfDRtFMEro3mFLBqE6tL2Ps=;
        b=vdOCz8lNFCnCA57aE5iI3MyYxghahdJi5dfU8Ahi3BJsX2TpDwFCjzSgOBFvTo+d0a
         9dezzQfyoAfi/xhLDFtTFMp+hhf9/R9olAfLod1qelCPs6tsfbpM+QrbJrP9YpOx+91C
         e2WeJtAAFR8yaH8/4BaqFGj28RoGUZ2kk/YJ8L5BURzSjjfisHqB0X55PIBjGw/fPmz9
         qMb7KcSNrT3jKcZRm4QRSP6/wPeYpeg7q2hTSu+1JH5AT6I3NjnKk0PZcubgW69uz6Na
         Wv/8hHhoK8sTypBigItd3dLJpEyQKH1oPyxUa7KRsWKjd+aFikXcIVRkmuuK8rLU/B1Y
         dZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765583313; x=1766188113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wWP8BFs1bgT8Z4A6IjuNlfDRtFMEro3mFLBqE6tL2Ps=;
        b=JZJxy9a5gUwLxuzlOz4MLPWwmztDzbfF3v6f7TgLgm6gc7m9rttEDNrnpk3Tp+rPS6
         DEPpDgDfu2rXjgqaZ0IghjfEKJ+dmNyIjpuk9MQvdSvj0CiPrceAHvcuwxF76pVDNqcE
         D/FZVAMhSwGlOJEOeuH71p8FDkvjD6SOKdEWZByDrsbUEAy4QTgwU4sEIwTech7OlFQC
         B/HA338lpPSEX1+0eL6AMzcrP0kOj0eALfo3b+jMvwErSqEmsBj2at94wXemlO5597tA
         QJx/OQJZDvmYUDdgMl6AOpdoVCra3NF1olmcC0Vd3Dv1Grf73o7Oo9Qyw1h85QmrJ1Da
         hRdg==
X-Forwarded-Encrypted: i=1; AJvYcCWIaKGH5NIdkkTKNxhhFM7kAG8ubxvpSIxyYw52DGVcFTIadH2hdq3kbMqS3IluqsNTA780VXLj@lists.linux.dev
X-Gm-Message-State: AOJu0YydcfJMkV1X+kwN8x+wGMDV3J4B2lvrKDhrLeKnmr/lVI9lkQ0I
	PLaUPZV0EMXpPmp+ffH7IKoZcydVFFBRIpW2E8R1V9/rmkSfCnWi6cwYnIIcgB0F1GY=
X-Gm-Gg: AY/fxX4btUJzthxsVo7NhlzPOgSv0upV7hDbFECLdpVkNV63urdH0S29qI9G/d5B7eJ
	rxUaRJFI/D2bDOtnvDUBqnooky4mEXisP5+G/bNjjsMeW46fbHb7blmENbcFfC9i/XSROl/7kUk
	YkKuMyIxbGMOBtx5QSPT15xTgGAcEUM3ssY4zeLOikoZYprIU57Lr4vr+g5acZqu3oBiQ8nZ8kl
	6HdVboxcxZrLlLB3342uqDaWxtUbeCeC8i3kBE+mfP0jDjDpgQGzBHPaY31y1jtCFxoJejr0uXs
	xuTo6ysklj5NR+x7dlB21PCIBu/3yyKncOSCSB8au/lcSDi4rnA9ZlUG86jtuL6fgyHktr6j+UU
	Fja6UsviSFSA7jvGZN6RrXKEeHvQVQ9zGVB6uqHXuPTQZ4BwQM/02pSvzo7FSOoXw9hRlODDGfF
	CtykHf9cKNFnap3fXwa5VNX8CW5FOYC5QYkCwG+d1iOxJKuwO9TLIR3MEBzvA=
X-Google-Smtp-Source: AGHT+IH5DZZVRCULf6txAGDp1FIo3v39FvSWX2YSJi9J8wYZkjZxPxwUqn5V5CjP/NoiB+w3TzKOrQ==
X-Received: by 2002:a17:903:11d0:b0:295:557e:747e with SMTP id d9443c01a7336-29f23caff8amr38947595ad.40.1765583313480;
        Fri, 12 Dec 2025 15:48:33 -0800 (PST)
Received: from stephen-xps.local (p99250-ipoefx.ipoe.ocn.ne.jp. [153.246.134.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9d38ae7sm65484845ad.35.2025.12.12.15.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 15:48:33 -0800 (PST)
Date: Sat, 13 Dec 2025 08:48:27 +0900
From: Stephen Hemminger <stephen@networkplumber.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
 ksummit@lists.linux.dev, Linux kernel regressions list
 <regressions@lists.linux.dev>
Subject: Re: kernel.org tooling update
Message-ID: <20251213084827.634cb60f@stephen-xps.local>
In-Reply-To: <f1bb8d04-9949-417d-9726-64787994d40e@leemhuis.info>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
	<f1bb8d04-9949-417d-9726-64787994d40e@leemhuis.info>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 10 Dec 2025 14:30:37 +0100
Thorsten Leemhuis <linux@leemhuis.info> wrote:

> he update, much appreciated!
> 
> On 12/10/25 05:48, Konstantin Ryabitsev wrote:
> 
> > ### Bugzilla
> > 
> > It may be time to kill bugzilla:  
> 
> Thx for bringing this up, as I a few months ago again looked somewhat
> closer at the state of how well our bugzilla is working for the core
> kernel. I didn't post the analysis in the end, but to me it looked like
> the state of things was round the same as it was three years ago -- when
> it wasn't working well, which was among the reasons why we came close to
> abandoning bugzilla for kernel bugs[1].
> 
> [1] for those that don't remember, see https://lwn.net/Articles/910740/
> and
> https://lore.kernel.org/all/aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info/
> 
> 
> 
> >     - despite periodic "we're not dead yet" emails, it doesn't appear very
> >       active
> >     - the upgrade path to 6.0 is broken for us due to bugzilla abandoning the
> >       5.2 development branch and continuing with 5.1
> >     - question remains with what to replace bugzilla,  
> 
> To me it looks like most subsystems don't care much or at all about
> bugzilla.kernel.org. This made me wonder (and maybe you could gather
> some opinions on this in Tokyo):
> 
> * How many kernel subsystems have a strong interest in a bug tracking
> solution at all[2]? And how many of those might be happy by using some
> external issue tracker, like those in github (like Rust for Linux,
> thesofproject, and a few others do), gitlab (either directly, like
> apparmor, or self-hosted, like the DRM subsystem)?
> 
> * Does the kernel as a whole need a bug tracking solution at all to
> receive reports? We for now require email for patches, so why not for
> bugs as well, unless a subsystem really wants something (see above)?

I am the default target for all networking bugzilla submissions.
Would be very happy to just see bugzilla die.
Right now, all I do is do a quick scan and respond to the junk submissions
and forward the rest to the netdev mailing list with a note on the bug
to go there in the future.

Issue tracking is not in the workflow for the community.

