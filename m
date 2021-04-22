Return-Path: <ksummit+bounces-64-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 695523680E7
	for <lists@lfdr.de>; Thu, 22 Apr 2021 14:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 6DBFF3E5AD5
	for <lists@lfdr.de>; Thu, 22 Apr 2021 12:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA982FA2;
	Thu, 22 Apr 2021 12:54:12 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [194.109.24.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D407B2F9B
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 12:54:09 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
	by smtp-cloud9.xs4all.net with ESMTPA
	id ZYpElsGsKvTEDZYpHlZHLK; Thu, 22 Apr 2021 14:53:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
	t=1619095981; bh=OFeJ8n/PuyBnRCYr6r8amecOzMggqOGzM80PqalbuXU=;
	h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
	 Subject;
	b=KHqzPg/78yRWVo86V+74wdI3w7RrkYLAcEy+JkcHPtYJ0ylv1OWx4OK021hGDeDj5
	 aiVKx0B/xArnzkIMYRaFNoZjhnO/cwa8MCDq3hvT0NTDLsGB/Ehh5X1mtT2Qhvi6NQ
	 lgL44V05gzx72rFRvtMURswlTsR0GxvabJBGjce/9++x6HOKZ/KvNcIGzHwvJuJLu9
	 9Q7QqV83t0yCz+K1Yiugu6ntPE5SK858B2ZkwwCxevAnyvEVf3vrxW77TlagPaf64U
	 0IhD8dA8z/wUXRNuIo414H7z5AuJkf0Fnhf5KcsoyOkzGP5CIuqDSE0IrtpZPgEBfY
	 QIB2jam0JYzbw==
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
To: Leon Romanovsky <leon@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, James Morris <jmorris@namei.org>,
 Julia Lawall <julia.lawall@inria.fr>,
 Stephen Hemminger <stephen@networkplumber.org>,
 Roland Dreier <roland@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 ksummit@lists.linux.dev
References: <20210421152209.68075314@gandalf.local.home>
 <CAG4TOxNOHRexUoKTo7ndViNtss0_BDeh4YCVHexvdQhQWF+vaw@mail.gmail.com>
 <alpine.DEB.2.22.394.2104212150230.20674@hadrien>
 <20210421132824.13a70f6c@hermes.local>
 <alpine.DEB.2.22.394.2104212233450.20674@hadrien>
 <d95ee281-4dc0-c5c1-ec87-81d83f44979@namei.org>
 <CAMuHMdU=c2bY1_sq+rSh1fON5QhNx8xWqMQLT+cD0BpqG0RtCg@mail.gmail.com>
 <20210422115511.60d1f735@coco.lan> <YIFlo6TSE1n6tD6K@unreal>
 <20210422122604.GC4572@sirena.org.uk> <YIFtf+1Oj7oJn/43@unreal>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <93a9de51-93ce-80b0-25e3-7c80479e564d@xs4all.nl>
Date: Thu, 22 Apr 2021 14:52:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YIFtf+1Oj7oJn/43@unreal>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfER70EVribRjuYjfMfPkAAskym2pGLzAK8qlj/hUdC5XRAOdclNwYHcKLgjNj516fMZNINtr9jGR3F/QUS72OH3+zhhnS3lsmjfc8h4oZwPUO4wC5iAS
 e3Ow8dVDnxN4RBsGIZgQN9BAJ/BkyqTsAoohURQETm3g6A/csOYN4zyM263vjVDVpkA3dLlqxxK2FVsVzDnX3jTS4muOi1m2FcbRd8cGYnLSCMCiB35Difz4
 i3XV0EcwabgPHVPSBRQk+5SWjpbo+ALtDNG/WgPLIRvRO5RTd3H31t7B/YxozAsAXVAH9IxqVr85wUIb99EomirfZwff98HlE0FaA4H10E+kbIGCAZSrzUVW
 kBadWm57N6V7hgAIucvJv9pXIl6jsciit2auIt/Ndydrr8UiDgv5NmrPEC+wT7YL9Fe+VOX8R/B7F4iYEruiVq2HYsPhj2HOFNBhLE6UNgm1o7QJipL87CfM
 JxGg2aewMk1I73f/GuJyy2CkfH1Jnv4XOnVJoVTAn4oKraIGWeYTPQrCLRE=

On 22/04/2021 14:35, Leon Romanovsky wrote:
> On Thu, Apr 22, 2021 at 01:26:04PM +0100, Mark Brown wrote:
>> On Thu, Apr 22, 2021 at 03:01:39PM +0300, Leon Romanovsky wrote:
>>> On Thu, Apr 22, 2021 at 11:55:11AM +0200, Mauro Carvalho Chehab wrote:
>>
>>>> The reverted ones for media (29 patches) didn't contain any malicious code.
>>>> One was useless (because the media core already fixes the pointed issue),
>>>> but the other ones were valid patches.
>>
>>> And didn't you ask yourself after seeing same 29 patches that the
>>> correct fix should be in another place? pm_runtime_get_sync?

A new function was created that does the correct cleanup:
pm_runtime_resume_and_get().

But these patches predate that addition.

Regards,

	Hans

>>
>> The runtime PM APIs are for legitimate reasons really fiddly to get
>> right - there's a bunch of different ways to do things and disabling
>> runtime PM in Kconfig can cause surprises.  It's been identified as an
>> issue for years but it's really not trivial to address it at the API
>> level.
> 
> There is no need to fix all problems at once, but seeing same mistake
> over and over like in commit 57cc666d36ad ("media: st-delta: Fix reference
> count leak in delta_run_work") can be fixed very easily (+grep all source
> code to remove extra put):
> 
> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> index 18b82427d0cb..d73c967ddb80 100644
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -1089,6 +1089,9 @@ int __pm_runtime_resume(struct device *dev, int rpmflags)
>         retval = rpm_resume(dev, rpmflags);
>         spin_unlock_irqrestore(&dev->power.lock, flags);
> 
> +       if (retval && rpmflags & RPM_GET_PUT)
> +               atomic_dec(&dev->power.usage_count);
> +
>         return retval;
>  }
>  EXPORT_SYMBOL_GPL(__pm_runtime_resume);
> 
> 
> 
> 


