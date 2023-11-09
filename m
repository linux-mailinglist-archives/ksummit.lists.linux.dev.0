Return-Path: <ksummit+bounces-1207-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3907E6FEF
	for <lists@lfdr.de>; Thu,  9 Nov 2023 18:14:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD7F91C20C11
	for <lists@lfdr.de>; Thu,  9 Nov 2023 17:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1621122308;
	Thu,  9 Nov 2023 17:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="LmXnPv1F"
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821D8208B0
	for <ksummit@lists.linux.dev>; Thu,  9 Nov 2023 17:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-5b97ca78da8so893530a12.3
        for <ksummit@lists.linux.dev>; Thu, 09 Nov 2023 09:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1699550080; x=1700154880; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JUcet9CXGiFMTdM/gsoA8nqqbtKJ2w9r5XQkoVTangs=;
        b=LmXnPv1FEdu8eStaPeRfMS2dX0bIaxddSsC9YyVvfs4tlPQ6yNSYU47f/LlHDr2WTj
         7A3bi1W8tWXWLwaXeotAa682PSltAREbuObar9MDAzMJ57DbAfCVHJS9vvOFp8jUvK8v
         1XlwHsVGxey1ERopwldvWTdmbApWNVVoTWdVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699550080; x=1700154880;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JUcet9CXGiFMTdM/gsoA8nqqbtKJ2w9r5XQkoVTangs=;
        b=T6JoAobtv1AOUh3JAb5NEcoROuVscrD145t4ieiKx7JIXZiXc4u9tIDnIjUcTq7LIX
         AkVI/rYWFTaCBrEWwFzH0ZaWF1cxlo5stsir0PVuULByhIJH5PhvHAaWOUMHd6sgUna3
         dw0oYAv4r8+PI3l/+83dixNT01f3deGNyga/1/co3AJGzaRwG5uup/sHIjjeFpsndZBE
         VHYzqrMXyyp4eqlHewtL3u5K7f/W4diPEqbe6LGjufqjgSzuNQzVzZiSyn+/hSz0Qxj0
         +CcMW9O6Rb8WWLzS8l+Z7YxWAAq4EIrptmw+wPLqeiboh3oBX1FwXZkpnQlJqA9TncxR
         M7yA==
X-Gm-Message-State: AOJu0YxqBrqRwIwUTY8iBQ0PQpPOrX6A1bxqE7Rc+VH790pOuCQkkcrG
	AplqxGz2gKPbyZQFHjBI+USXxQ==
X-Google-Smtp-Source: AGHT+IFvR5dUwKjy7Yl7Qf2rn3a4AOM1s29l3PN+YcQ6cL/UyAxtTLcBq2JCOlW8/yDjjb0apqoctA==
X-Received: by 2002:a05:6a20:2445:b0:138:2fb8:6c48 with SMTP id t5-20020a056a20244500b001382fb86c48mr6097019pzc.8.1699550080663;
        Thu, 09 Nov 2023 09:14:40 -0800 (PST)
Received: from [10.211.55.3] ([12.10.41.130])
        by smtp.googlemail.com with ESMTPSA id nh1-20020a17090b364100b0027cf8869ee7sm3540749pjb.0.2023.11.09.09.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 09:14:40 -0800 (PST)
Message-ID: <903adc04-b56f-4b40-b009-4a760b3ff404@ieee.org>
Date: Thu, 9 Nov 2023 11:14:38 -0600
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [workflows]RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Joe Perches <joe@perches.com>,
 Mark Brown <broonie@kernel.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 users@linux.kernel.org, ksummit@lists.linux.dev
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
 <20231106110547.6956a430@gandalf.local.home>
 <280f404dcaab5a1cee2cc67f829c1d85aa91d772.camel@perches.com>
 <ZUu68zEzrlDVenA1@finisterre.sirena.org.uk>
 <6737487f097401510c87f38239d2f75e22fca46d.camel@perches.com>
 <20231108140415.46f84baa@gandalf.local.home>
 <eb1befce-af02-4e33-b5f2-f2ae17bf0eec@kadam.mountain>
 <20231109092701.GG21616@pendragon.ideasonboard.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20231109092701.GG21616@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/9/23 3:27 AM, Laurent Pinchart wrote:
> On Thu, Nov 09, 2023 at 11:32:16AM +0300, Dan Carpenter wrote:
>> On Wed, Nov 08, 2023 at 02:04:15PM -0500, Steven Rostedt wrote:
>>>
>>> Right. For example, I use linux-trace-kernel@ to add patches to patchwork,
>>> but I prefer the discussions to be done on LKML.
>>
>> I had no idea that how tracing worked...  I normally strip out mailing
>> lists from my patches if I think they're not necessary so I seldom CC
>> lkml.  In years past, there used to be a lot of complaining about CC'ing
>> too many people so I try to trim the CC list when I send patches.

I used to do this too but at some point I was told I was leaving
someone or some list out.  It seemed get_maintainer.pl was returning
a smaller list of addressees than it once did, so I just started using
the list it produces.  It seems excessive though.

My input is that whatever the outcome of all this discussion, please
define it as policy and have get_maintainer.pl implement it.  I don't
want to have to think too hard about who *should* be included (beyond
people I already know).

					-Alex


> 
> I do exactly the same and drop LKML from most of my patch submissions if
> there are more "appropriate" (in the sense of more targetted) lists
> reported by get_maintainer.pl.
> 
>> Networking doesn't need to be CC'd about wireless patches.
>> Drm doesn't need to be CC'd about amd gpu driver patches.
>>
>> And for bug reports, I only ever CC one lore mailing list.  (For zero
>> day bot stuff, the bot chooses the CC lists).
> 


