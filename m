Return-Path: <ksummit+bounces-1100-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D76797271
	for <lists@lfdr.de>; Thu,  7 Sep 2023 14:58:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38427281599
	for <lists@lfdr.de>; Thu,  7 Sep 2023 12:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 839B263D8;
	Thu,  7 Sep 2023 12:57:51 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85A963C3
	for <ksummit@lists.linux.dev>; Thu,  7 Sep 2023 12:57:49 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1bf078d5f33so8128555ad.3
        for <ksummit@lists.linux.dev>; Thu, 07 Sep 2023 05:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694091469; x=1694696269; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dpAncpsnxY7aC1ou9acM0h7ym6Wf8QSElbvjg5hra5A=;
        b=YqiZn8YsGzivopt2mlAqW4enSi+4YuzNu9k7nNE2SrQ40iIYeTCCnh/Mzp8t9HrMQj
         1oHyItCFfwNe3nXfpVz9YXDVKfjnGANzkDIzW5ZNgd8TA3YUxZYZWGu+kWB8zS6lVVRE
         /0XSP9AF7NoJfQjxl92pBIWa4PoRNPr0J8HrtyLUsRnJC3uk1RZoVZYSGKGt28DP8Cyi
         Ftnd+fCe+jupVVOky4sSNkImalLjq4C3D5XtQTk434nnXxCtHGU/bIk/SrsiXKKJRc2W
         Tl9bM+kalUP16F4rfnmFp3R1xo4LRKFEVzoZ3aPmak+IwV/KtMMp4IVWPeepwW3lR5vf
         vJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694091469; x=1694696269;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dpAncpsnxY7aC1ou9acM0h7ym6Wf8QSElbvjg5hra5A=;
        b=NRcCEPFmo0cgGSIw4p6TSQp7TMMCT6zJiizxI4oNlYSzx0/tHtMPkAYNuTPpoNQVOt
         Vc1pIuCj/nqJYiilwj9rApJMXIlZpiE3YS+AnDendJmD7c16OnlzpgrWEtz5Tu43kRVh
         1FjFflu8NwuVcIhQRq71TVxOWuKOprXdoRCPjOk2H7cV0ssXM2epFhNMSr3nuiF8lBGi
         6uwA1PKk+rSauYYQDdrBi3++IqKbFomdpY72hOhXysa6VtrECZPAgC3lfQmb0g/civ5d
         h2eHlFotXgWf2Q97URc1hA+X54u7ORld9xCMSVxz7Nf8parolWqC2X+1VpaxHVFe9SK+
         D/fA==
X-Gm-Message-State: AOJu0Yxq1+b2K0ne0S/WGBD523+8a7W83PNEqhz/ZfunEoYwQs7RUUcv
	rfQXsBb7j9FcJJ6K7thY2Cc=
X-Google-Smtp-Source: AGHT+IHAe8UshzC+ci2VJWs1XhLXI14inSCq20rj6Saz8wM90SJzwKqtmMYRcTiJwoBMCIX9HIxUuA==
X-Received: by 2002:a17:902:db12:b0:1bc:28a8:f856 with SMTP id m18-20020a170902db1200b001bc28a8f856mr22601053plx.47.1694091469006;
        Thu, 07 Sep 2023 05:57:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t11-20020a170902a5cb00b001bfd92ec592sm12738065plq.292.2023.09.07.05.57.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 05:57:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0ece94aa-141e-564c-f43c-2d6d4b9e61c4@roeck-us.net>
Date: Thu, 7 Sep 2023 05:57:47 -0700
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Thorsten Leemhuis <linux@leemhuis.info>,
 Christian Brauner <brauner@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, Steven Rostedt
 <rostedt@goodmis.org>, Dave Chinner <david@fromorbit.com>,
 Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
 linux-fsdevel@vger.kernel.org
References: <ZO9NK0FchtYjOuIH@infradead.org>
 <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>
 <ZPkDLp0jyteubQhh@dread.disaster.area>
 <20230906215327.18a45c89@gandalf.local.home>
 <ZPkz86RRLaYOkmx+@dread.disaster.area>
 <20230906225139.6ffe953c@gandalf.local.home>
 <ZPlC0pf2XA1ZGr6j@casper.infradead.org>
 <c89ebbb2-1249-49f3-b80f-0b08711bc29b@leemhuis.info>
 <20230907-kauern-kopfkissen-d8147fb40469@brauner>
 <d62225ae-73dc-4b45-a1d9-078137224eb5@leemhuis.info>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
In-Reply-To: <d62225ae-73dc-4b45-a1d9-078137224eb5@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/7/23 04:18, Thorsten Leemhuis wrote:
> On 07.09.23 12:29, Christian Brauner wrote:
>>> So why can't that work similarly for unmaintained file systems? We could
>>> even establish the rule that Linus should only apply patches to some
>>> parts of the kernel if the test suite for unmaintained file systems
>>> succeeded without regressions. And only accept new file system code if a
>>
>> Reading this mail scared me.
> 
> Sorry about that, I can fully understand that. It's just that some
> statements in this thread sounded a whole lot like "filesystems want to
> opt-out of the no regression rule" to me. That's why I at some point
> thought I had to speak up.
> 
>> The list of reiserfs bugs alone is crazy.
> 
> Well, we regularly remove drivers or even support for whole archs
> without getting into conflict with the "no regressions" rule, so I'd say
> that should be possible for file systems as well.
> 
> And I think for reiserfs we are on track with that.
> 
> But what about hfsplus? From hch's initial mail of this thread it sounds
> like that is something users would miss. So removing it without a very
> strong need[1] seems wrong to me. That's why I got involved in this
> discussion.
> 

The original mail also suggested that there would be essentially no means
to create a hfsplus file system in Linux. That would mean it would, for all
practical purposes, be untestable.

However:

$ sudo apt-get install hfsprogs
$ truncate -s 64M filesystem.hfsplus
$ mkfs.hfsplus filesystem.hfsplus
Initialized filesystem.hfsplus as a 64 MB HFS Plus volume
$ file filesystem.hfsplus
filesystem.hfsplus: Macintosh HFS Extended version 4 data last mounted by: '10.0', created: Thu Sep  7 05:41:21 2023, last modified: Thu Sep  7 12:41:21 2023, last checked: Thu Sep  7 12:41:7

So I am not really sure I understand what the problem actually is.

No a side note, the crash I observed with ntfs3 was introduced by
commit a4f64a300a29 ("ntfs3: free the sbi in ->kill_sb").

Guenter


