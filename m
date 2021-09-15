Return-Path: <ksummit+bounces-592-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 536A640CE89
	for <lists@lfdr.de>; Wed, 15 Sep 2021 23:11:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id E4B0E3E1034
	for <lists@lfdr.de>; Wed, 15 Sep 2021 21:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2486D17;
	Wed, 15 Sep 2021 21:11:14 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395E53FC3
	for <ksummit@lists.linux.dev>; Wed, 15 Sep 2021 21:11:13 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id y18so5339555ioc.1
        for <ksummit@lists.linux.dev>; Wed, 15 Sep 2021 14:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GTklZ0TZHnqTLVKAYMSXufi3jXO25MrnhIiEToyloJE=;
        b=CF2RsMzd+XjZH+58qLc9upcw3f9+YoaEVqE1BCMEpIjlBJpuA2g6Bca9MiXsOO8a7w
         wfy42NPfjpy6uDbeugL5bMatuVuyidzGW0DfcnXvn0YO3Uosn2pIJTW9Y0RqZ5xVa7M/
         LTGs+8kalGBihvD1OW9j7gMPIffawVAu/mqrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GTklZ0TZHnqTLVKAYMSXufi3jXO25MrnhIiEToyloJE=;
        b=gZuD3FsskUOaba2S8l7pFiFbI45ZUYX/nsxF5orQIerA2JzyYPOBNWCv1FZFJu9Vhi
         03/whI/yWQQ2dbLP63S3klmrd6gRJrhyxuuLOItmhBONjQCX2hESlH76EWka6a0LpMjv
         qRVj2O94iuRJaJ34bmj6Cbys4KMB5lftOulVq+2l31DXDXy8TQtSD2dcZbyMbqZGwxYc
         PYMu+MRopixBH0MvnUx1fKaoQX9yIPYdp2MocD77v1jqmVC49TLyNXwkSwqbdn+CKoFg
         5E9eSl++a9H/wzxgLnGQVPAamDyUCiwYfRhw1/sGD7z84pZ9c6iLFGocfQ3yIzaKmdjk
         FZzA==
X-Gm-Message-State: AOAM5331TtNvIXkOT5lJIo5tvo8SbGo8BfQfCq320e0x43leyrJzDF8N
	LONcF8EgMQdf5jwdVNLAYMc9Hw==
X-Google-Smtp-Source: ABdhPJy+beHrlL8Y84AHGMrL9X9iV8beocxtrcNvp0MZWAEyTv7ribbKjRAk4ESrlzZ5FCBSrmHB4A==
X-Received: by 2002:a5d:9c89:: with SMTP id p9mr1698866iop.13.1631740272166;
        Wed, 15 Sep 2021 14:11:12 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id r13sm608020ilh.80.2021.09.15.14.11.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 14:11:11 -0700 (PDT)
Subject: Re: [Tech-board-discuss] Reminder: Voting procedures for the Linux
 Foundation Technical Advisory Board
To: Laura Abbott <laura@labbott.name>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: ksummit@lists.linux.dev,
 "tech-board-discuss@lists.linuxfoundation.org"
 <tech-board-discuss@lists.linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <fccbdadc-a57a-f6fe-68d2-0fbac2fd6b81@labbott.name>
 <b90db9e7-9b6b-c415-d087-3505ba0be0d6@labbott.name>
 <YUH+DO5aHWGVdNb7@pendragon.ideasonboard.com>
 <dc45975a-86df-a70d-ff15-58a3bdcf09ee@labbott.name>
 <YUIHPv3uvAZjJxfB@pendragon.ideasonboard.com>
 <90e00588-3596-01f5-e5a0-73516224b883@labbott.name>
 <YUIbvmPUEUtf/BDU@pendragon.ideasonboard.com>
 <9af9f018-5df5-f5d6-5472-2387c1bb594a@linuxfoundation.org>
 <00b4158c-a0c8-b4c2-a0e5-3c646079393a@labbott.name>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <ab8920a9-0fe0-4b92-d524-8911e88b90dd@linuxfoundation.org>
Date: Wed, 15 Sep 2021 15:11:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <00b4158c-a0c8-b4c2-a0e5-3c646079393a@labbott.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/15/21 2:42 PM, Laura Abbott wrote:
> On 9/15/21 15:34, Shuah Khan wrote:
>> On 9/15/21 10:13 AM, Laurent Pinchart wrote:
>>> Hi Laura,
>>>
>>> On Wed, Sep 15, 2021 at 12:07:13PM -0400, Laura Abbott wrote:
>>>> On 9/15/21 10:46, Laurent Pinchart wrote:
>>>>> On Wed, Sep 15, 2021 at 10:36:45AM -0400, Laura Abbott wrote:
>>>>>> On 9/15/21 10:07, Laurent Pinchart wrote:
>>>>>>> On Wed, Sep 15, 2021 at 09:58:32AM -0400, Laura Abbott wrote:
>>>>>>>> On 9/9/21 12:49, Laura Abbott wrote:
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> Reminder that the Linux Foundation Technical Advisory Board (TAB) annual
>>>>>>>>> election will be held virtually during the 2021 Kernel Summit and Linux
>>>>>>>>> Plumbers Conference. Voting will run from September 20th to September
>>>>>>>>> 23rd 16:00 GMT-4 (US/Eastern). The voting criteria for the 2021 election
>>>>>>>>> are:
>>>>>>>>>
>>>>>>>>> There exist three kernel commits in a mainline or stable released
>>>>>>>>> kernel that both
>>>>>>>>> - Have a commit date in the year 2020 or 2021
>>>>>>>>> - Contain an e-mail address in one of the following tags or merged
>>>>>>>>> tags (e.g. Reviewed-and-tested-by)
>>>>>>>>> -- Signed-off-by
>>>>>>>>> -- Tested-by
>>>>>>>>> -- Reported-by
>>>>>>>>> -- Reviewed-by
>>>>>>>>> -- Acked-by
>>>>>>>>>
>>>>>>>>> If you have more than 50 commits that meet this requirement you will
>>>>>>>>> receive a ballot automatically.
>>>>>>>>>
>>>>>>>>> If you have between 3 and 49 commits that meet this requirement please
>>>>>>>>> e-mail tab-elections@lists.linuxfoundation.org to request your ballot.
>>>>>>>>> We strongly encourage everyone who meets this criteria to request a
>>>>>>>>> ballot.
>>>>>>>>>
>>>>>>>>> We will be using Condorcet Internet Voting
>>>>>>>>> Service (CIVS) https://civs1.civs.us/ . This is a voting service
>>>>>>>>> focused on security and privacy. There are sample polls on the
>>>>>>>>> website if you would like to see what a ballot will look like.
>>>>>>>>>
>>>>>>>>> If you have any questions please e-mail
>>>>>>>>> tab-elections@lists.linuxfoundation.org.
>>>>>>>>>
>>>>>>>>> Thanks,
>>>>>>>>> Laura
>>>>>>>>>
>>>>>>>>> P.S. Please also consider this another reminder to consider running for
>>>>>>>>> the TAB as well
>>>>>>>>
>>>>>>>> Final reminder: please remember to request your ballot for the TAB
>>>>>>>> elections. If you know others who are eligible please encourage
>>>>>>>> them to request a ballot as well.
>>>>>>>
>>>>>>> When are the ballots supposed to be sent ? It would be nice to avoid
>>>>>>> requiring everybody to check whether they're below or above the 50
>>>>>>> commits threshold manually :-)
>>>>>>
>>>>>> The ballots will be sent sometime after Monday September 20th
>>>>>> 9:00am GMT-4 (US/Eastern).
>>>>>>
>>>>>> I did make an attempt to send e-mails to the > 50 commits individuals
>>>>>> but there is a chance my e-mail got eaten by spam filters or just
>>>>>> didn't get sent out. I discovered Google Apps' e-mail limits and
>>>>>> that you should not attempt to bcc too many people. This is something
>>>>>> I'd like to handle in a more automated fashion next year to make
>>>>>> it easier for both voters and those running the elections.
>>>>>
>>>>> Does it mean I should ask for a ballot after the 20th if I don't get
>>>>> one, or request one *before* ? I meet the above criteria but haven't
>>>>> received any ballot yet, so I was unsure whether I should ask or wait.
>>>>
>>>> The intention was that if you were in the range of between 3-49 commits
>>>> you would ask for a ballot now.
>>>
>>> Would it be possible to share the script that you are using to check in
>>> which category a developer is, to avoid the criteria being applied in
>>> slightly different ways ?
>>>
>>
>> Same request. Is this the same script that gets used to determine candidate
>> eligibility before they get added to the ballot?
>>
>> thanks,
>> -- Shuah
> 
> You can thank Kees for the script
> 
> https://github.com/kees/kernel-tools/blob/trunk/identity-canonicalizer
> 
> This is the same script for both voting and nomination
> 
> The set generated is
> 
> # Find people participating in 50+ commits since 2020-01-01:
> git log --since=2020-01-01 | ~/bin/identity-canonicalizer | sort -g > contributors.txt
> cat contributors.txt | awk '{if ($1 > 2) {print $0}}' >eligible.txt
> cat eligible.txt | awk '{if ($1 > 49) {print $0}}' >ballots.txt

So people that this script spits out are the ones that are
eligible for the following:

-- get added to the ballot if they sent in the nomination
-- get sent a ballot by Sept 20th for voting

Also does this criteria get applied to TAB Chair/co-Chair election
going forward?

thanks,
-- Shuah

