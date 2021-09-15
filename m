Return-Path: <ksummit+bounces-573-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 6772D40C6E6
	for <lists@lfdr.de>; Wed, 15 Sep 2021 15:58:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 8CD1C1C0F38
	for <lists@lfdr.de>; Wed, 15 Sep 2021 13:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352C83FE2;
	Wed, 15 Sep 2021 13:58:36 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62EC3FD2
	for <ksummit@lists.linux.dev>; Wed, 15 Sep 2021 13:58:34 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id s32so2332194qtc.12
        for <ksummit@lists.linux.dev>; Wed, 15 Sep 2021 06:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=labbott.name; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:references:in-reply-to:content-transfer-encoding;
        bh=j7F4OhupuEb6jt4oCrBdO2k5ZYwBESobEAtwAMK2gYE=;
        b=vbs1cZg30L6WP2BfD2X2u4qRXc7cOdrvi4uc/GTN9IGfiWF35ZFEzxc7byJF7v7TwU
         7fAP8Slm82zd/npPXX0VHyHxRepP15H0h3WhPuJ8GYdjtFqlbLH199U4ClweMjpCiIl7
         eamuMz3W+Bzwr1kxvjVd/T6f3mqbxqzinwQLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:references:in-reply-to
         :content-transfer-encoding;
        bh=j7F4OhupuEb6jt4oCrBdO2k5ZYwBESobEAtwAMK2gYE=;
        b=OGG7rCekACXt7uAheXCApdGyOfB2fHahC1EEpWoEAQ71rb2s50ae/5vUxsaE+IAmsD
         sKMhMTS9jsmw08RQvz1NMbxzsB+eI4OItvA427unE3VMsZL8kiuW66lD886PxIL0K1Vl
         UylXwGdvh+hCo++mYgO991YPDHCEGLnn+qG1SJBIhfcQ7QwnMlyPawRcTI1uuLCfT2aI
         9jIt6lYgFD/ZwzgzTgb8RliThWHASeX8RDfLyf00rHGFpXXUNBw7ZXrgIMoz3i7KJj/M
         AVFpSHU10R2ln84ymCi0i4EfGRReVJep91kI3V0w1XbAclR+D5BYQQNOxIk7u2YOx9GC
         eZSQ==
X-Gm-Message-State: AOAM53096ADCwta9SI0x1I9QcGX6LzzsnqQoY928nRh3E1xzse1K/lqT
	xTemy7SmO3auqL5vhXsbt31OVp5fm+KIHA==
X-Google-Smtp-Source: ABdhPJygNeXQKoTJzVhhCRvRmxlTV1a88tZZk81IsttCzR2c9PKQ19nOgodRrh78dqHj8mHFm94UkQ==
X-Received: by 2002:a05:622a:1651:: with SMTP id y17mr10295686qtj.332.1631714313291;
        Wed, 15 Sep 2021 06:58:33 -0700 (PDT)
Received: from [192.168.1.168] (pool-74-109-246-95.pitbpa.fios.verizon.net. [74.109.246.95])
        by smtp.gmail.com with ESMTPSA id z6sm52309qke.24.2021.09.15.06.58.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 06:58:32 -0700 (PDT)
Message-ID: <b90db9e7-9b6b-c415-d087-3505ba0be0d6@labbott.name>
Date: Wed, 15 Sep 2021 09:58:32 -0400
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
From: Laura Abbott <laura@labbott.name>
To: ksummit@lists.linux.dev,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tech-board-discuss@lists.linuxfoundation.org"
 <tech-board-discuss@lists.linuxfoundation.org>
References: <fccbdadc-a57a-f6fe-68d2-0fbac2fd6b81@labbott.name>
In-Reply-To: <fccbdadc-a57a-f6fe-68d2-0fbac2fd6b81@labbott.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/21 12:49, Laura Abbott wrote:
> Hi,
> 
> Reminder that the Linux Foundation Technical Advisory Board (TAB) annual
> election will be held virtually during the 2021 Kernel Summit and Linux
> Plumbers Conference. Voting will run from September 20th to September
> 23rd 16:00 GMT-4 (US/Eastern). The voting criteria for the 2021 election
> are:
> 
> There exist three kernel commits in a mainline or stable released
> kernel that both
> - Have a commit date in the year 2020 or 2021
> - Contain an e-mail address in one of the following tags or merged
> tags (e.g. Reviewed-and-tested-by)
> -- Signed-off-by
> -- Tested-by
> -- Reported-by
> -- Reviewed-by
> -- Acked-by
> 
> If you have more than 50 commits that meet this requirement you will
> receive a ballot automatically.
> 
> If you have between 3 and 49 commits that meet this requirement please
> e-mail tab-elections@lists.linuxfoundation.org to request your ballot.
> We strongly encourage everyone who meets this criteria to request a
> ballot.
> 
> We will be using Condorcet Internet Voting
> Service (CIVS) https://civs1.civs.us/ . This is a voting service
> focused on security and privacy. There are sample polls on the
> website if you would like to see what a ballot will look like.
> 
> If you have any questions please e-mail 
> tab-elections@lists.linuxfoundation.org.
> 
> Thanks,
> Laura
> 
> P.S. Please also consider this another reminder to consider running for
> the TAB as well

Final reminder: please remember to request your ballot for the TAB
elections. If you know others who are eligible please encourage
them to request a ballot as well.

