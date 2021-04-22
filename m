Return-Path: <ksummit+bounces-95-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 305EC368363
	for <lists@lfdr.de>; Thu, 22 Apr 2021 17:34:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 705131C506B
	for <lists@lfdr.de>; Thu, 22 Apr 2021 15:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 077F92FA1;
	Thu, 22 Apr 2021 15:34:04 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BA170
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 15:34:02 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id q25so2482595iog.5
        for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 08:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nWX5jxyKquVnGmAOh6eKLMc9KNks4/1NCzEJ033A5Oo=;
        b=bDWbyjV+4uszuXqft5Tc/ZG9gl6L8AT0mnnVqlz7Mhx3YoGyJU907hWeIMc7e9/I9Q
         ju2R5Vrtbfgys0D8jKdvH2a/6V3aSeWFYGJCjeeW3U7fhypfqp6StoMygfpkPnugUvLI
         pO1Rg9YUwNvT6yzl3irFibKcVRKi+pmjM+KRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nWX5jxyKquVnGmAOh6eKLMc9KNks4/1NCzEJ033A5Oo=;
        b=CnNJv3TacjndqHFy85IC/2OwgeG8z6uHDMIc9faz1uPfMmLg9QOgJAO6VaNvT6Q9iu
         ZGb7ZlQIdVUN778Sdrq8DIxqEIroikxIQDmH9X0UuXUBbN+czyJaek6sek3Z5EidDcPy
         FIdI2MM+g685PZsc0eDkp8hh4DCUSkKXq8l4crAeVFHyl2+Rw4Lgm9Y4QfXH6RxGWrCZ
         5O1V8HlQJn9kfZatwyiKUT5qB2+DcEDIuU3nbtaBaSzOdGv3UALszBfyhCMPm3qiNEaI
         zhsRRc1jx45IzDGcn27gXpBhKeU2S7qYRu+ymaV01P+G8ooMQ0n4Un/7WBHnGpWUYCvr
         Yo6w==
X-Gm-Message-State: AOAM531Omqjltibxx6iKf6LnoSYl9jJCz9t4qpqTYLUgxsdi7SGS2TUW
	3IoUTd9oPLod0yYdCvaF93neWw==
X-Google-Smtp-Source: ABdhPJzhChaINvW/Zy+4jnlLcLkUZVSwSFoCV9+KAHGf2rybdUkKEyOlU7rwrr9PewmDZ/oqMDc2zQ==
X-Received: by 2002:a05:6638:24cc:: with SMTP id y12mr3649347jat.138.1619105642064;
        Thu, 22 Apr 2021 08:34:02 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id r3sm1318220ilt.37.2021.04.22.08.34.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Apr 2021 08:34:01 -0700 (PDT)
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: ksummit@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210422123559.1dc647fb@coco.lan>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <0d83502f-eb29-9b06-ada8-fcd03f9c87a8@linuxfoundation.org>
Date: Thu, 22 Apr 2021 09:34:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210422123559.1dc647fb@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/22/21 4:35 AM, Mauro Carvalho Chehab wrote:
> Hi James,
> 
> Em Wed, 21 Apr 2021 11:35:36 -0700
> James Bottomley <James.Bottomley@HansenPartnership.com> escreveu:
> 
>> I've long been on record as not really being a fan of trivial patches
>> because they can cause merge issues with current patches and introduce
>> bugs, particularly in older drivers, that don't get detected for a long
>> while.  However, the recent events with the University of Minnesota:
>>
>> https://lore.kernel.org/lkml/20210421130105.1226686-1-gregkh@linuxfoundation.org/
>>
>> Have elevated the risk factor around trivial patches claiming to fix
>> bugs to the point where it looks like there's no such thing as a truly
>> trivial patch and they all need reviewing.
>>
>> Our policy in SCSI for a long time has been no trivial patches accepted
>> to maintained drivers, and I think that would be a good start if
>> adopted kernel wide, but I think the next policy should be no trivial
>> bug fix without a pointer to the actual bug report or report from a
>> trusted static checker.  This would likely mean we have to create a
>> list of trusted static checkers ... obviously 0day and coverity but
>> what else?
> 
> I agree that we should have a "Rethinking the acceptance policy" talk
> at the Maintainer Summit, but it should cover a scope wider than just
> trivial patches. At least the patches I checked, sent from "@unm.edu"
> to media subsystem, they all looked good enough to be merged[1].
> 
> The main question is actually what's the degree of confidence a
> maintainer can rely on a patch sent from a random contributor.
> 
> That's not an easy task.
> 
> I mean, usually, each maintainer develops internally a "trust score"
> from subsystem's contributors, but such trustee level is usually not
> shared with other maintainers.
> 
> When a developer reaches a certain level, maintainers are willing
> to merge their work faster as they know that the developer is
> there for a while and it is not trying to harm the community.
> 
> Perhaps one thing that we could add would be a
> scripts/get_developer_trustee_status, which would be returning
> a set of indicators that would help the maintainer to know
> how much it can trust a random contributor, like:
> 
> 	- how many drivers and patches a contributor has written;
> 	- how long and how frequent he's sending Kernel patches;
> 	- what subsystems received patches from him;
> 	- if the developer isn't on a blacklist/graylist.
> 
> 

This will put new developers at disadvantage. Let's think this through
before adding barriers for entry.

thanks,
-- Shuah


