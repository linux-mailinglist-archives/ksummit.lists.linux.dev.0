Return-Path: <ksummit+bounces-593-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 605B240CEBB
	for <lists@lfdr.de>; Wed, 15 Sep 2021 23:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id F2A183E03AB
	for <lists@lfdr.de>; Wed, 15 Sep 2021 21:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136C36D17;
	Wed, 15 Sep 2021 21:20:34 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853E63FC3
	for <ksummit@lists.linux.dev>; Wed, 15 Sep 2021 21:20:32 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id a12so2845576qvz.4
        for <ksummit@lists.linux.dev>; Wed, 15 Sep 2021 14:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=labbott.name; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GQZcIEA9tkNl+mH9IpM3LJwM66ZeLtxIeJ+vYlq0va0=;
        b=neZ/WBQqn0DZnwBEid1caGlAUERFJdXQq4sQYKoWUgigUNx/sgT6Bc9VmBAbrBiDfL
         zh51nCDVc7B1cdqjoEURL0SouKljKsYRfPqErmhCcXOlUIWrRVX49d3MzXLEh+TS/cxI
         /RY4gJnZiX5je5oTddrUzFOSUMjPsRK+cWbBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GQZcIEA9tkNl+mH9IpM3LJwM66ZeLtxIeJ+vYlq0va0=;
        b=TmIId2CSxGcRWO0KKyuIZEs+ZnHTmGcknnmAEX/6SJ7BqTdgd+0LsHRYIuamy0QGPB
         te2nWELKgTkJL5qO9PhHnPNLFf/dQ2gmeU3tfcKy3SHC6CpS4jS3g9QZmU6iXokbS/8A
         fvTqgD6XCW6/eLaoiQFuHgeJpFTKOpnlpKaqN/H6u1/R2N9IWMkiUZKb9GOEpyxMVIIs
         pnshUTqZAYvrC4twSnKkpN/oU1LFcdzz3tFuRevARc2JTkzQiPsmuwnGbmsi/rTv55Fw
         AdIqk8op5uk3fRxD5k1mGtjqDRWfrIpRzhm1Q6MDZeAJWhgAbUzO+8TRoEx2U+PrPJ+k
         Jgpg==
X-Gm-Message-State: AOAM531fbZhqR/D7/679Jhnyq9xZCjqa5pos7UYme/PhANAkz5E7mITy
	AoKW/XyeUMzomrE9qOVn5V7Kiw==
X-Google-Smtp-Source: ABdhPJwjl6YXt3gnbFxW18Gc9nl4CN2WWbvb4xKyeGbwrB7a34u2rEjnaykYeSKiQ0oZHO2EGnCLzg==
X-Received: by 2002:a05:6214:13cd:: with SMTP id cg13mr1874325qvb.51.1631740831302;
        Wed, 15 Sep 2021 14:20:31 -0700 (PDT)
Received: from [192.168.1.168] (pool-74-109-246-95.pitbpa.fios.verizon.net. [74.109.246.95])
        by smtp.gmail.com with ESMTPSA id v23sm756260qto.55.2021.09.15.14.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 14:20:30 -0700 (PDT)
Message-ID: <516d0aed-983b-e1e4-71ea-3d5f05865811@labbott.name>
Date: Wed, 15 Sep 2021 17:20:30 -0400
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [Tech-board-discuss] Reminder: Voting procedures for the Linux
 Foundation Technical Advisory Board
Content-Language: en-US
To: Shuah Khan <skhan@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: ksummit@lists.linux.dev,
 "tech-board-discuss@lists.linuxfoundation.org"
 <tech-board-discuss@lists.linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>
References: <fccbdadc-a57a-f6fe-68d2-0fbac2fd6b81@labbott.name>
 <b90db9e7-9b6b-c415-d087-3505ba0be0d6@labbott.name>
 <YUH+DO5aHWGVdNb7@pendragon.ideasonboard.com>
 <dc45975a-86df-a70d-ff15-58a3bdcf09ee@labbott.name>
 <YUIHPv3uvAZjJxfB@pendragon.ideasonboard.com>
 <90e00588-3596-01f5-e5a0-73516224b883@labbott.name>
 <YUIbvmPUEUtf/BDU@pendragon.ideasonboard.com>
 <9af9f018-5df5-f5d6-5472-2387c1bb594a@linuxfoundation.org>
 <00b4158c-a0c8-b4c2-a0e5-3c646079393a@labbott.name>
 <ab8920a9-0fe0-4b92-d524-8911e88b90dd@linuxfoundation.org>
From: Laura Abbott <laura@labbott.name>
In-Reply-To: <ab8920a9-0fe0-4b92-d524-8911e88b90dd@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/21 17:11, Shuah Khan wrote:
> On 9/15/21 2:42 PM, Laura Abbott wrote:
>> On 9/15/21 15:34, Shuah Khan wrote:
>>> On 9/15/21 10:13 AM, Laurent Pinchart wrote:
>>>> Hi Laura,
>>>>
>>>> On Wed, Sep 15, 2021 at 12:07:13PM -0400, Laura Abbott wrote:
>>>>> On 9/15/21 10:46, Laurent Pinchart wrote:
>>>>>> On Wed, Sep 15, 2021 at 10:36:45AM -0400, Laura Abbott wrote:
>>>>>>> On 9/15/21 10:07, Laurent Pinchart wrote:
>>>>>>>> On Wed, Sep 15, 2021 at 09:58:32AM -0400, Laura Abbott wrote:
>>>>>>>>> On 9/9/21 12:49, Laura Abbott wrote:
>>>>>>>>>> Hi,
>>>>>>>>>>
>>>>>>>>>> Reminder that the Linux Foundation Technical Advisory Board 
>>>>>>>>>> (TAB) annual
>>>>>>>>>> election will be held virtually during the 2021 Kernel Summit 
>>>>>>>>>> and Linux
>>>>>>>>>> Plumbers Conference. Voting will run from September 20th to 
>>>>>>>>>> September
>>>>>>>>>> 23rd 16:00 GMT-4 (US/Eastern). The voting criteria for the 
>>>>>>>>>> 2021 election
>>>>>>>>>> are:
>>>>>>>>>>
>>>>>>>>>> There exist three kernel commits in a mainline or stable released
>>>>>>>>>> kernel that both
>>>>>>>>>> - Have a commit date in the year 2020 or 2021
>>>>>>>>>> - Contain an e-mail address in one of the following tags or 
>>>>>>>>>> merged
>>>>>>>>>> tags (e.g. Reviewed-and-tested-by)
>>>>>>>>>> -- Signed-off-by
>>>>>>>>>> -- Tested-by
>>>>>>>>>> -- Reported-by
>>>>>>>>>> -- Reviewed-by
>>>>>>>>>> -- Acked-by
>>>>>>>>>>
>>>>>>>>>> If you have more than 50 commits that meet this requirement 
>>>>>>>>>> you will
>>>>>>>>>> receive a ballot automatically.
>>>>>>>>>>
>>>>>>>>>> If you have between 3 and 49 commits that meet this 
>>>>>>>>>> requirement please
>>>>>>>>>> e-mail tab-elections@lists.linuxfoundation.org to request your 
>>>>>>>>>> ballot.
>>>>>>>>>> We strongly encourage everyone who meets this criteria to 
>>>>>>>>>> request a
>>>>>>>>>> ballot.
>>>>>>>>>>
>>>>>>>>>> We will be using Condorcet Internet Voting
>>>>>>>>>> Service (CIVS) https://civs1.civs.us/ . This is a voting service
>>>>>>>>>> focused on security and privacy. There are sample polls on the
>>>>>>>>>> website if you would like to see what a ballot will look like.
>>>>>>>>>>
>>>>>>>>>> If you have any questions please e-mail
>>>>>>>>>> tab-elections@lists.linuxfoundation.org.
>>>>>>>>>>
>>>>>>>>>> Thanks,
>>>>>>>>>> Laura
>>>>>>>>>>
>>>>>>>>>> P.S. Please also consider this another reminder to consider 
>>>>>>>>>> running for
>>>>>>>>>> the TAB as well
>>>>>>>>>
>>>>>>>>> Final reminder: please remember to request your ballot for the TAB
>>>>>>>>> elections. If you know others who are eligible please encourage
>>>>>>>>> them to request a ballot as well.
>>>>>>>>
>>>>>>>> When are the ballots supposed to be sent ? It would be nice to 
>>>>>>>> avoid
>>>>>>>> requiring everybody to check whether they're below or above the 50
>>>>>>>> commits threshold manually :-)
>>>>>>>
>>>>>>> The ballots will be sent sometime after Monday September 20th
>>>>>>> 9:00am GMT-4 (US/Eastern).
>>>>>>>
>>>>>>> I did make an attempt to send e-mails to the > 50 commits 
>>>>>>> individuals
>>>>>>> but there is a chance my e-mail got eaten by spam filters or just
>>>>>>> didn't get sent out. I discovered Google Apps' e-mail limits and
>>>>>>> that you should not attempt to bcc too many people. This is 
>>>>>>> something
>>>>>>> I'd like to handle in a more automated fashion next year to make
>>>>>>> it easier for both voters and those running the elections.
>>>>>>
>>>>>> Does it mean I should ask for a ballot after the 20th if I don't get
>>>>>> one, or request one *before* ? I meet the above criteria but haven't
>>>>>> received any ballot yet, so I was unsure whether I should ask or 
>>>>>> wait.
>>>>>
>>>>> The intention was that if you were in the range of between 3-49 
>>>>> commits
>>>>> you would ask for a ballot now.
>>>>
>>>> Would it be possible to share the script that you are using to check in
>>>> which category a developer is, to avoid the criteria being applied in
>>>> slightly different ways ?
>>>>
>>>
>>> Same request. Is this the same script that gets used to determine 
>>> candidate
>>> eligibility before they get added to the ballot?
>>>
>>> thanks,
>>> -- Shuah
>>
>> You can thank Kees for the script
>>
>> https://github.com/kees/kernel-tools/blob/trunk/identity-canonicalizer
>>
>> This is the same script for both voting and nomination
>>
>> The set generated is
>>
>> # Find people participating in 50+ commits since 2020-01-01:
>> git log --since=2020-01-01 | ~/bin/identity-canonicalizer | sort -g > 
>> contributors.txt
>> cat contributors.txt | awk '{if ($1 > 2) {print $0}}' >eligible.txt
>> cat eligible.txt | awk '{if ($1 > 49) {print $0}}' >ballots.txt
> 
> So people that this script spits out are the ones that are
> eligible for the following:
> 
> -- get added to the ballot if they sent in the nomination
> -- get sent a ballot by Sept 20th for voting
> 

eligible.txt would be all people who can potentially vote. This is also
the set of people who can submit a nomination.

ballots.txt is all people who would be sent a ballot automatically.
If you are in eligible.txt but not in ballots.txt you may request
a ballot.

> Also does this criteria get applied to TAB Chair/co-Chair election
> going forward?

It does not.

Thanks,
Laura


