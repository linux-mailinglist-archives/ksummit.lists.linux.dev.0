Return-Path: <ksummit+bounces-94-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBDD36835C
	for <lists@lfdr.de>; Thu, 22 Apr 2021 17:32:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 0E6711C4C1E
	for <lists@lfdr.de>; Thu, 22 Apr 2021 15:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 290562FA0;
	Thu, 22 Apr 2021 15:32:14 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5A12F83
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 15:32:12 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id i22so33488528ila.11
        for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 08:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NrmZKy+FiYMLABZD7C+CrT9P/Ho+A5c95IqEIYdL8S4=;
        b=ZFp4CKgioh3qpXZIQSEIIgtf26DmIs3KDcnIZ8gmvlPFQYHshmfUVE/9smxjVuyZMk
         /emg3eVsruRLiYffr1NTgO0eSieQbAY1K9NcRKYk696OcK89RpBXtKP5TKqnBbIPtvav
         g/T6aetLD4NdNU1jlcjcE+vtnVu1Fcb8FdPN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NrmZKy+FiYMLABZD7C+CrT9P/Ho+A5c95IqEIYdL8S4=;
        b=GKUkb6JCUHTBZjpCMMAQeJc63AIFboalQq7QUN5qKqrfGjvrY2xfMjoxsXG97LMLxZ
         s2XwnoElZyLULT+OHlWeenKLo+h8YcGepmSpNgi+Ok0u9wvwNMH+ItZrbyNE3xHHc6MU
         8T/p6LHkC7QsLWTYuv7svMbm7bm0lFuTMDLyis+MCShw0EwwtKA5EVi+kfNLVginMnd+
         gIj9+YIrvctUMgNpdCWEwwSK5sDlUzffc8QmWR124npxtyn3MOQlLKDrzKKI4eh3Cuav
         Aa+YoJLVGjG99f7zMtERV3/btUVvf2ecDCLtlcYZFbAThbcbS0Zjij/CU5PAvSeqjKmf
         yCeg==
X-Gm-Message-State: AOAM5300B8lHGi7UY/vAwNz3uZlMqzTOHAvi9H3rzGtGmE+3bKI7Ii0w
	O2DuGc2+GgnLgmYaUTH9L7TQYA==
X-Google-Smtp-Source: ABdhPJxheAZcFhQ18iB8UHVy/jsEtLJU0qO0msRjUVPV32ggyLV/PaxNn0cwqNth9xDWH6flvqURmA==
X-Received: by 2002:a05:6e02:168f:: with SMTP id f15mr3501936ila.264.1619105531960;
        Thu, 22 Apr 2021 08:32:11 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id x13sm1317204ilv.88.2021.04.22.08.32.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Apr 2021 08:32:11 -0700 (PDT)
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
To: Mike Rapoport <rppt@linux.ibm.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mark Brown <broonie@kernel.org>, Leon Romanovsky <leon@kernel.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 ksummit@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal> <20210422124023.GD4572@sirena.org.uk>
 <YIFx/iorjncjslob@linux.ibm.com>
 <YIGNa8iAoJSFmkT1@pendragon.ideasonboard.com>
 <YIGS302BVvk26p7s@linux.ibm.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <dc985b24-d108-db14-ada3-882a53d9312c@linuxfoundation.org>
Date: Thu, 22 Apr 2021 09:32:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YIGS302BVvk26p7s@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/22/21 9:14 AM, Mike Rapoport wrote:
> On Thu, Apr 22, 2021 at 05:51:23PM +0300, Laurent Pinchart wrote:
>> On Thu, Apr 22, 2021 at 03:54:22PM +0300, Mike Rapoport wrote:
>>> On Thu, Apr 22, 2021 at 01:40:23PM +0100, Mark Brown wrote:
>>>> On Thu, Apr 22, 2021 at 07:21:26AM +0300, Leon Romanovsky wrote:
>>>>
>>>>> While we are talking about policies, I would like to raise another bad
>>>>> practice that is done by even seasoned developers - sending patches with
>>>>> carefully crafted and filtered TO and CC.
>>>>
>>>>> This practice causes to get out of context patches without ability to
>>>>> see whole picture and the worse part that it divides feedback to
>>>>> "islands" without ability to agree or disagree with the feedback.
>>>>
>>>> The flip side of copying everyone on everything is that especially for
>>>> serieses which aren't just repetitive changes this gets really noisy
>>>> really quickly and things end up just not getting read.
>>>
>>> I think this is quite subjective and different people have different email
>>> flows.
>>>
>>> For me the most annoying is to get several patches from the middle of a
>>> series. IMHO, sending at least cover letter to everyone is the bare minimum
>>> so that people at least can take a look at high level details and request a
>>> repost.
>>
>> Could tooling based on lore and b4 help here ? The prospect of getting
>> more patches in my inbox isn't exactly enticing, but the ability to
>> quickly get the full context of a patch series is certainly useful (I've
>> had to look up parts I wasn't CC'ed on previously).
> 
> lore definitely helps, but still requires an extra step. I think having the
> cover letter in your inbox helps to decide if you want to do that extra
> step.
> 

+1 on cover letter. I like to see the cover letter for the series in my
Inbox to give me the context and scope of the change. It helps with
reviewing the change in my code.

thanks,
-- Shuah



