Return-Path: <ksummit+bounces-1668-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A519B8312
	for <lists@lfdr.de>; Thu, 31 Oct 2024 20:08:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DAEC1C21A28
	for <lists@lfdr.de>; Thu, 31 Oct 2024 19:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B071CB304;
	Thu, 31 Oct 2024 19:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BsQv05ze"
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FD813C8FF
	for <ksummit@lists.linux.dev>; Thu, 31 Oct 2024 19:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730401696; cv=none; b=EVpC2PjomiOPjfj+jfR0v8zq0rXjFVU0bA++UEn+jTRdtc2HnPbTUIrCOu4sxagVhL+pT2RLwDe/MVKZB3JhmlmhASvOLZWVrd/7io6VLw6xdpLCNsWzKLqcdao6eTYb5fLPmVyTHs7iLfjQmS+yOVkCl+nSpXkXP+jNyiVPPWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730401696; c=relaxed/simple;
	bh=InZBgv+kFX0M1o8Ll1iRSk/5sbqiSGMb3mGm8OERP94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OHsMjneZfDHQqYTFbL8DiixHASixbKiAFvMkBmzIQHpTk5qog4le+P9BPfYKWrVvg1fcUF9kUs0k6m/jI6TV9KTDRWCtbSqg7FG7Rf/dRkt8EOLn9X9DMQ2I+0lisO4tRD44gKt1tbJRRLGD1gQ5t28ZcsOzicD1VS4EJdxtxxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BsQv05ze; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-83abf71f244so41841939f.1
        for <ksummit@lists.linux.dev>; Thu, 31 Oct 2024 12:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730401693; x=1731006493; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cbq/ZEWacRJdHkw1gGMFiFwPYAsuKPdwhjOfwE9lyNs=;
        b=BsQv05zeBXEXJuR2Wb0X0bl7vB0BQxAYN8SiK55NcGXLAvUIG3L2PvNKVP1ETZhM0S
         zJpB81HAn4L3CEtqs/BSTgwLAlydHTLAW9gkBwCiZ1RwukhJlb8lHiN36GxGE/q/EAvx
         VeQl+4Y2cqjBzI2LXXrRKsGy5l7wKOKHs7Hvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730401693; x=1731006493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cbq/ZEWacRJdHkw1gGMFiFwPYAsuKPdwhjOfwE9lyNs=;
        b=fH9o5fjzuNVlHjxK0woSAO6RfjxbBD9LlJ4x4+H6LyVjtt+Seq5zRVOs4qtKcgtaTd
         VcFfNZtf2cAfjHq2Oz855HGnop8SLiv4PZBtcSCnj4hKlcR8hOszqJ8ApGklXirAnOhH
         o8v8zqbPyuOrBfi+t30kxRLAvRXFIFu454UW5ZjE9Fhk7RfLbPC2d9jug41JdhVu3wal
         duhBkqHTPX51/j+dsVBQJUd4/TiqwzsFVXEO9OI8gxlyPab67VOOU6R4JD/4044z1h8x
         dj2xcoBdzFrJ6jOXxOOSfa6jhkS1HO3rZOKf9YoRKo0pOhOS3MfR7dDDbr6t1sVsElhQ
         asYA==
X-Forwarded-Encrypted: i=1; AJvYcCXSPCLVyzZWf9rK0BPT778+Oh6MY7aC498/u77xrzMKk3kiP2CtvbvDy8cWN+19a+jTbKOFsZ+9@lists.linux.dev
X-Gm-Message-State: AOJu0YzTGvK+p0IWLbzVXZ72r4DBhB4AjQb9ypCfEohqKV902w6tfwFV
	GSyRUDH8PIT770GS/3ws/IpkgRwEx05BmtgfZZWTbZe05RlFolrBOmZ5YLG5rKE=
X-Google-Smtp-Source: AGHT+IFJB6gk7rz/6qG7W/1JVxLTExwIHZPrU8sd4sVvWjmbAlGDJwlGUPH7LH6gUDcfZtyBoYurjw==
X-Received: by 2002:a05:6602:6d1b:b0:83a:9820:f26b with SMTP id ca18e2360f4ac-83b64f7309dmr534498639f.2.1730401693242;
        Thu, 31 Oct 2024 12:08:13 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4de048c0150sm403742173.65.2024.10.31.12.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 12:08:12 -0700 (PDT)
Message-ID: <1cb27980-7679-43c7-92b5-48af6d711a1c@linuxfoundation.org>
Date: Thu, 31 Oct 2024 13:08:12 -0600
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linus-next: improving functional testing for to-be-merged pull
 requests
To: Steven Rostedt <rostedt@goodmis.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Christoph Hellwig <hch@infradead.org>, Kees Cook <kees@kernel.org>,
 Sasha Levin <sashal@kernel.org>, torvalds@linux-foundation.org,
 ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <ZxZ8MStt4e8JXeJb@sashalap>
 <792F4759-EA33-48B8-9AD0-FA14FA69E86E@kernel.org>
 <ZxdKwtTd7LvpieLK@infradead.org>
 <20241022041243.7f2e53ad@rorschach.local.home>
 <ZxiN3aINYI4u8pRx@infradead.org>
 <20241023042004.405056f5@rorschach.local.home>
 <CAMuHMdUxrULbo=A77DFDE4ySbii3jSMuh8xVvUXaqyCnwEAU-w@mail.gmail.com>
 <20241023051914.7f8cf758@rorschach.local.home>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241023051914.7f8cf758@rorschach.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/24 03:19, Steven Rostedt wrote:
> On Wed, 23 Oct 2024 10:36:20 +0200
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> 
>>> To put it this way. The bugs I'm fixing was for code in linux-next
>>> where the bugs were never found. They only appeared when they went into
>>> Linus's tree. So why put the fixes in linux-next, if it didn't catch
>>> the bugs I fixed in the first place?
>>
>> Hmmm...
>>
>> Your arguments sound very similar to those being used in recent
>> discussions about not posting patches for public review...
>>
>> Please follow the process! ;-)
> 
> What process?
> 
> Note, I probably post everything to mailing lists more than anyone
> else (besides stable). All my commits come from mailing lists. Even
> things I change myself. I always send out the change to a list. Then I
> use patchwork to pull it into my tree.
> 
> After the changes are tested, I send out the patches *again* with my
> [for-next] tags in the subject. If it's a fix for Linus, it goes out as
> a "[for-linus]" tag. These emails automatically update my patchwork
> status.
> 
> No change goes into Linus's tree from me that hasn't been sent out
> publicly.
> 
> But pushing to linux-next for a day or two, what does that give me?
> 

I don't send pull requests without soaking it in next for 2 to 3 days.
It helps me find problems related to things something breaking on an
architecture and/or config.

I find next very helpful in finding merge conflicts and build/test
breakages.

thanks,
-- Shuah


