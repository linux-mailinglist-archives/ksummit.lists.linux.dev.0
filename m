Return-Path: <ksummit+bounces-576-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA7540C78E
	for <lists@lfdr.de>; Wed, 15 Sep 2021 16:36:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 537A31C0DAE
	for <lists@lfdr.de>; Wed, 15 Sep 2021 14:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29E2A3FD8;
	Wed, 15 Sep 2021 14:36:50 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B225E3FC5
	for <ksummit@lists.linux.dev>; Wed, 15 Sep 2021 14:36:48 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id w9so1965283qvs.12
        for <ksummit@lists.linux.dev>; Wed, 15 Sep 2021 07:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=labbott.name; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2H7DzI+go8EOc+36ORDqjtNoZm8AbQrnLy9kD0rxxtc=;
        b=ZU6w5lZQHlgdde9E2wHoIO/rj0um8v8hFdyIKtuXBBtJUs0mFo1wV/6EADZOzWJpB9
         NW0MnoVm+LcLeJcZsb/QZRe1qTe4rop4et8kVcS1yeKSrQnMuFLoN+2h1eqf7ZuBgFrh
         LHa5fNoQzsHBbtHoNo8RTq9CaJGkrX9LdQ89k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2H7DzI+go8EOc+36ORDqjtNoZm8AbQrnLy9kD0rxxtc=;
        b=7A+7LX5qd0s16jITKQ2vGQJzC73ejr8IESkd6Nt/QO6kahfBR+ESxF6P7ku0HNU0Al
         u/irHaBZS6Y9IMFKwcc/5xiUGOhcilmplsW3iLtsfcaoP3dbM+qtvoh7ghLG7nW1J4gR
         tPDHaBZOf2PfTNpM++xwINllqXj0TYsrNlxek3wjwuFRZuNkhQ7G+OVW8/0+FjaYnvmS
         7eniMcLeUjS8qoCiSB7bka4jYU1pqJBvKHotdEgkWwSWXDsmzHlyPD72bqy/UQuKweW1
         rY7ZiHvEuLfatMOdWerC0dIpgxIcl/j0IOfPyPXHsVck2ngSDUczYQGzYhQBitp6UtOY
         Pmqg==
X-Gm-Message-State: AOAM530eNCsu7g1vefVRgf5+qO5sNE300QY9JWZ9lPRufocEPsg3a7HP
	UBsfT2pzEiz3NxEiGMS4435GSA==
X-Google-Smtp-Source: ABdhPJxxteW0dULHX34Lzt8pxnIcdiKoz1yKv0VX+J6HlXzEVnnaGcucetHMs9J9FPM6HwxwvOegKg==
X-Received: by 2002:a05:6214:2609:: with SMTP id gu9mr11501239qvb.35.1631716606236;
        Wed, 15 Sep 2021 07:36:46 -0700 (PDT)
Received: from [192.168.1.168] (pool-74-109-246-95.pitbpa.fios.verizon.net. [74.109.246.95])
        by smtp.gmail.com with ESMTPSA id s28sm112172qkm.43.2021.09.15.07.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 07:36:45 -0700 (PDT)
Message-ID: <dc45975a-86df-a70d-ff15-58a3bdcf09ee@labbott.name>
Date: Wed, 15 Sep 2021 10:36:45 -0400
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: Reminder: Voting procedures for the Linux Foundation Technical
 Advisory Board
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: ksummit@lists.linux.dev,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tech-board-discuss@lists.linuxfoundation.org"
 <tech-board-discuss@lists.linuxfoundation.org>
References: <fccbdadc-a57a-f6fe-68d2-0fbac2fd6b81@labbott.name>
 <b90db9e7-9b6b-c415-d087-3505ba0be0d6@labbott.name>
 <YUH+DO5aHWGVdNb7@pendragon.ideasonboard.com>
From: Laura Abbott <laura@labbott.name>
In-Reply-To: <YUH+DO5aHWGVdNb7@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/21 10:07, Laurent Pinchart wrote:
> Hi Laura,
> 
> On Wed, Sep 15, 2021 at 09:58:32AM -0400, Laura Abbott wrote:
>> On 9/9/21 12:49, Laura Abbott wrote:
>>> Hi,
>>>
>>> Reminder that the Linux Foundation Technical Advisory Board (TAB) annual
>>> election will be held virtually during the 2021 Kernel Summit and Linux
>>> Plumbers Conference. Voting will run from September 20th to September
>>> 23rd 16:00 GMT-4 (US/Eastern). The voting criteria for the 2021 election
>>> are:
>>>
>>> There exist three kernel commits in a mainline or stable released
>>> kernel that both
>>> - Have a commit date in the year 2020 or 2021
>>> - Contain an e-mail address in one of the following tags or merged
>>> tags (e.g. Reviewed-and-tested-by)
>>> -- Signed-off-by
>>> -- Tested-by
>>> -- Reported-by
>>> -- Reviewed-by
>>> -- Acked-by
>>>
>>> If you have more than 50 commits that meet this requirement you will
>>> receive a ballot automatically.
>>>
>>> If you have between 3 and 49 commits that meet this requirement please
>>> e-mail tab-elections@lists.linuxfoundation.org to request your ballot.
>>> We strongly encourage everyone who meets this criteria to request a
>>> ballot.
>>>
>>> We will be using Condorcet Internet Voting
>>> Service (CIVS) https://civs1.civs.us/ . This is a voting service
>>> focused on security and privacy. There are sample polls on the
>>> website if you would like to see what a ballot will look like.
>>>
>>> If you have any questions please e-mail
>>> tab-elections@lists.linuxfoundation.org.
>>>
>>> Thanks,
>>> Laura
>>>
>>> P.S. Please also consider this another reminder to consider running for
>>> the TAB as well
>>
>> Final reminder: please remember to request your ballot for the TAB
>> elections. If you know others who are eligible please encourage
>> them to request a ballot as well.
> 
> When are the ballots supposed to be sent ? It would be nice to avoid
> requiring everybody to check whether they're below or above the 50
> commits threshold manually :-)
> 

The ballots will be sent sometime after Monday September 20th
9:00am GMT-4 (US/Eastern).

I did make an attempt to send e-mails to the > 50 commits individuals
but there is a chance my e-mail got eaten by spam filters or just
didn't get sent out. I discovered Google Apps' e-mail limits and
that you should not attempt to bcc too many people. This is something
I'd like to handle in a more automated fashion next year to make
it easier for both voters and those running the elections.

Thanks,
Laura

