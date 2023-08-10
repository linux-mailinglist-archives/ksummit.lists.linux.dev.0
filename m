Return-Path: <ksummit+bounces-959-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD138778105
	for <lists@lfdr.de>; Thu, 10 Aug 2023 21:07:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A6281C20E7F
	for <lists@lfdr.de>; Thu, 10 Aug 2023 19:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC3F22F0A;
	Thu, 10 Aug 2023 19:07:38 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBC520FAC
	for <ksummit@lists.linux.dev>; Thu, 10 Aug 2023 19:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=q4dOCpcfdnf6VOsY+NvrQfEFK/NXcmmXz4w/v+/GD1Y=;
  b=Ks814qn7RMEEwiqxCviCtiM4tmlOdn45u5ooWEVdRxMDznO22gWkEFfn
   /7aW9zOvdDTUAshXJKt9/gTWDI95XPrFyzWZgEPgepizL8j9JM7s2FjtA
   w3U7rR0fB0Et5azQJ3197lkxPxgJ2MOSq0Npww/SD3RraLc7kX9bBiNxU
   s=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.01,163,1684792800"; 
   d="scan'208";a="63320691"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 21:07:27 +0200
Date: Thu, 10 Aug 2023 21:07:26 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
cc: ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Improving resource ownership and life-time in linux
 device drivers
In-Reply-To: <CACMJSev18ZdTVDK7j3gCpzw4rAiaNMZRT4KSvLzd99H61XwMOA@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2308102107110.3802@hadrien>
References: <CACMJSev18ZdTVDK7j3gCpzw4rAiaNMZRT4KSvLzd99H61XwMOA@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 9 Aug 2023, Bartosz Golaszewski wrote:

> Hi!
>
> I submitted this proposal on time using the website but forgot about
> sending it here too. Hope that's alright. The abstract follows.
>
> Bartosz Golaszewski
>
> --
>
> Recently there have been several talks about issues with object
> ownership in device drivers, use-after-free bugs and problems with
> handling hot unplug events in certain subsystems.
>
> First Laurent Pinchart revisited an older discussion about the harmful
> side-effects of devres helpers during LPC 2022[1]. I then went down
> that rabbit hole only to discover a whole suite of issues, not really
> linked to devres in any way but rather mostly caused by the way
> subsystems and drivers mix reference counted resources with regular
> ones[2]. This year Wolfram Sang continued the research and presented
> even more vulnerable subsystems as well as some potential remedies
> during his talk at the EOSS 2023 in Prague[3].
>
> I have since experimented with several approaches and would like to
> present some updates on this subject. During this talk I plan to jump
> straight into presenting concrete ideas and timelines for improving
> the driver model and introducing some unification in the way
> subsystems handle driver data. While this is a significant effort
> spanning multiple device subsystems that will need to be carried out
> in many phases over what will most likely be years, without addressing
> the problems, we'll be left with many parts of the kernel not being
> able to correctly handle simple driver unbinds.
>
> [1] https://lpc.events/event/16/contributions/1227/
> [2] https://fosdem.org/2023/schedule/event/devm_kzalloc/
> [3] https://eoss2023.sched.com/event/1LcPP/subsystems-with-object-lifetime-issues-in-the-embedded-case-wolfram-sang-sang-engineering-renesas

I will be very interested in seeing this talk.

julia

