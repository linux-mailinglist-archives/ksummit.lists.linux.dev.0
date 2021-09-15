Return-Path: <ksummit+bounces-589-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED6540CD41
	for <lists@lfdr.de>; Wed, 15 Sep 2021 21:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 566D53E0F79
	for <lists@lfdr.de>; Wed, 15 Sep 2021 19:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A766D17;
	Wed, 15 Sep 2021 19:34:49 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ED33FC9
	for <ksummit@lists.linux.dev>; Wed, 15 Sep 2021 19:34:47 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id q3so4946450iot.3
        for <ksummit@lists.linux.dev>; Wed, 15 Sep 2021 12:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=q6X4eOwLOW6F1Tc1fuiBbdIJjWx8PRKmkvWkGccAsxs=;
        b=R9+85zNaqPRGqWEABtmUzWfBnBiG2rOs/xkjO9yYMz4ipfpfWI1ZhT/wwmtSWwld1/
         i/Z103+FdFJnKYTDrUagsTEaJcDiOt/o8m+5OOTomM6/lhgV2zwMzW9LCdW01Nn4MDbV
         GLTZ7tW0z+6FABFIXs7wvNqVA/C1o8drweNxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q6X4eOwLOW6F1Tc1fuiBbdIJjWx8PRKmkvWkGccAsxs=;
        b=Vz+oVJ/y+FR1tOtDFZUPHV/2hlcnbuVj4AF5cNZiVeCEffpQhnmmtY+9gfej6sJBEw
         FCALTuYbjm1kMuRYFpT8pa/UJ7z+bFYD/iSqQ2N8yiJWk5O2OtreuVVcBXfg2mmAjprI
         PLNRl42frwvK0DSyyyIS5keY0qqL/2yO0hFn3agxeLh3wFdcu95jmNup0m8YMPlVCW8V
         iiECuDJ7GX1aYB9C7QKA9PbpRYNHnjHCp7BZge0XRdGEkRHgZ52HsdJ/+TWXHIGQPfOf
         T7SRyMoJ4iKVImUVMSwH/DDgjdxmgF5PJwHf3/rWikYNbMUKMovva8HhyNkmd0B3n7q6
         iVBw==
X-Gm-Message-State: AOAM532ZUPIGW6Y0FvZql6uZbFouGGvQft/rWz5TLyb1etl1dj2wuyND
	IJqd/ff2aW4EiB6GywuPZjYY2A==
X-Google-Smtp-Source: ABdhPJy89P0qmJmBkpmUeMFZtVS/BSHZPUO5URZI0kUcnXa+RUBHTzBX0I86nPIOH7YW93A9RKfqXw==
X-Received: by 2002:a05:6602:3284:: with SMTP id d4mr1397094ioz.100.1631734487057;
        Wed, 15 Sep 2021 12:34:47 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id s13sm437895ilh.21.2021.09.15.12.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 12:34:46 -0700 (PDT)
Subject: Re: [Tech-board-discuss] Reminder: Voting procedures for the Linux
 Foundation Technical Advisory Board
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Laura Abbott <laura@labbott.name>
Cc: ksummit@lists.linux.dev,
 "tech-board-discuss@lists.linuxfoundation.org"
 <tech-board-discuss@lists.linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <fccbdadc-a57a-f6fe-68d2-0fbac2fd6b81@labbott.name>
 <b90db9e7-9b6b-c415-d087-3505ba0be0d6@labbott.name>
 <YUH+DO5aHWGVdNb7@pendragon.ideasonboard.com>
 <dc45975a-86df-a70d-ff15-58a3bdcf09ee@labbott.name>
 <YUIHPv3uvAZjJxfB@pendragon.ideasonboard.com>
 <90e00588-3596-01f5-e5a0-73516224b883@labbott.name>
 <YUIbvmPUEUtf/BDU@pendragon.ideasonboard.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <9af9f018-5df5-f5d6-5472-2387c1bb594a@linuxfoundation.org>
Date: Wed, 15 Sep 2021 13:34:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YUIbvmPUEUtf/BDU@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/15/21 10:13 AM, Laurent Pinchart wrote:
> Hi Laura,
> 
> On Wed, Sep 15, 2021 at 12:07:13PM -0400, Laura Abbott wrote:
>> On 9/15/21 10:46, Laurent Pinchart wrote:
>>> On Wed, Sep 15, 2021 at 10:36:45AM -0400, Laura Abbott wrote:
>>>> On 9/15/21 10:07, Laurent Pinchart wrote:
>>>>> On Wed, Sep 15, 2021 at 09:58:32AM -0400, Laura Abbott wrote:
>>>>>> On 9/9/21 12:49, Laura Abbott wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> Reminder that the Linux Foundation Technical Advisory Board (TAB) annual
>>>>>>> election will be held virtually during the 2021 Kernel Summit and Linux
>>>>>>> Plumbers Conference. Voting will run from September 20th to September
>>>>>>> 23rd 16:00 GMT-4 (US/Eastern). The voting criteria for the 2021 election
>>>>>>> are:
>>>>>>>
>>>>>>> There exist three kernel commits in a mainline or stable released
>>>>>>> kernel that both
>>>>>>> - Have a commit date in the year 2020 or 2021
>>>>>>> - Contain an e-mail address in one of the following tags or merged
>>>>>>> tags (e.g. Reviewed-and-tested-by)
>>>>>>> -- Signed-off-by
>>>>>>> -- Tested-by
>>>>>>> -- Reported-by
>>>>>>> -- Reviewed-by
>>>>>>> -- Acked-by
>>>>>>>
>>>>>>> If you have more than 50 commits that meet this requirement you will
>>>>>>> receive a ballot automatically.
>>>>>>>
>>>>>>> If you have between 3 and 49 commits that meet this requirement please
>>>>>>> e-mail tab-elections@lists.linuxfoundation.org to request your ballot.
>>>>>>> We strongly encourage everyone who meets this criteria to request a
>>>>>>> ballot.
>>>>>>>
>>>>>>> We will be using Condorcet Internet Voting
>>>>>>> Service (CIVS) https://civs1.civs.us/ . This is a voting service
>>>>>>> focused on security and privacy. There are sample polls on the
>>>>>>> website if you would like to see what a ballot will look like.
>>>>>>>
>>>>>>> If you have any questions please e-mail
>>>>>>> tab-elections@lists.linuxfoundation.org.
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Laura
>>>>>>>
>>>>>>> P.S. Please also consider this another reminder to consider running for
>>>>>>> the TAB as well
>>>>>>
>>>>>> Final reminder: please remember to request your ballot for the TAB
>>>>>> elections. If you know others who are eligible please encourage
>>>>>> them to request a ballot as well.
>>>>>
>>>>> When are the ballots supposed to be sent ? It would be nice to avoid
>>>>> requiring everybody to check whether they're below or above the 50
>>>>> commits threshold manually :-)
>>>>
>>>> The ballots will be sent sometime after Monday September 20th
>>>> 9:00am GMT-4 (US/Eastern).
>>>>
>>>> I did make an attempt to send e-mails to the > 50 commits individuals
>>>> but there is a chance my e-mail got eaten by spam filters or just
>>>> didn't get sent out. I discovered Google Apps' e-mail limits and
>>>> that you should not attempt to bcc too many people. This is something
>>>> I'd like to handle in a more automated fashion next year to make
>>>> it easier for both voters and those running the elections.
>>>
>>> Does it mean I should ask for a ballot after the 20th if I don't get
>>> one, or request one *before* ? I meet the above criteria but haven't
>>> received any ballot yet, so I was unsure whether I should ask or wait.
>>
>> The intention was that if you were in the range of between 3-49 commits
>> you would ask for a ballot now.
> 
> Would it be possible to share the script that you are using to check in
> which category a developer is, to avoid the criteria being applied in
> slightly different ways ?
> 

Same request. Is this the same script that gets used to determine candidate
eligibility before they get added to the ballot?

thanks,
-- Shuah

