Return-Path: <ksummit+bounces-494-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C16405B45
	for <lists@lfdr.de>; Thu,  9 Sep 2021 18:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 1513D1C076F
	for <lists@lfdr.de>; Thu,  9 Sep 2021 16:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269413FFB;
	Thu,  9 Sep 2021 16:49:43 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152DD3FF0
	for <ksummit@lists.linux.dev>; Thu,  9 Sep 2021 16:49:40 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id s32so1972264qtc.12
        for <ksummit@lists.linux.dev>; Thu, 09 Sep 2021 09:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=labbott.name; s=google;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=7EsbivK71P1e8bO206IiNcmpNFbYB/rwlYkekF7WVpA=;
        b=rg22EH8oPa2UtSFo4o58oKKq0IgbnmTiFcU5r2NQn36mpg3WhfVpH2yC1rTYNi2rEj
         Pa6uTEAcCm3dTFqMZyQiAJRn5G/guuoepQG2NdzsE44OD4HeVn39EZZf068fY7InA+yY
         d2xDr0F1L57JC8/Vxr/HU+u39UmoUQVYoiZLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=7EsbivK71P1e8bO206IiNcmpNFbYB/rwlYkekF7WVpA=;
        b=JX4AEVwFMfODArRdLrz+SuKPg/WkyDjY+IFC4fL/Df4j70QEMbhab4HQ+u9HgX01UJ
         oSjRlCUdJ5lttDDTQF2crnz3f9Pt4s1wL1B2SPhlpmR4N0zxeeerxP35fNWXb/w/jNP5
         mllLzS3pZBHftDX1gwhC9un4D5wCRN2ftgdCLquy8hcJqtf/ZX0YIDabe3BuCS5E4+Io
         L8Fwa4m7zD0Ts5oLDXTSUyGgi+jeQZXX0i5BUeneVxz1TFFXtuqmWlRqZZsaE/6RfLYG
         OIwagw1iXjdxEzUaU/ydi//UfoJzt2nDH652EW5xO6lWLDRR0lsdUCTQfKeXpOhc3GGR
         znxg==
X-Gm-Message-State: AOAM533MyeBOCr6KKvYKpMuH5XbBiigd741xAYHT8QawP6u0eJfYY8Tu
	Z3apVLMcVeQ53zl3Sghp8it87Q==
X-Google-Smtp-Source: ABdhPJyHiFTiCv41LoyjxABqn9ZNC1MT0IdS8abyUHfAvtnIw9vRkaq0eOknKr9nLtClttE8V53AYA==
X-Received: by 2002:ac8:7f83:: with SMTP id z3mr3921439qtj.346.1631206180012;
        Thu, 09 Sep 2021 09:49:40 -0700 (PDT)
Received: from [192.168.1.168] (pool-74-109-246-95.pitbpa.fios.verizon.net. [74.109.246.95])
        by smtp.gmail.com with ESMTPSA id f20sm1612683qka.64.2021.09.09.09.49.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Sep 2021 09:49:39 -0700 (PDT)
To: ksummit@lists.linux.dev,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tech-board-discuss@lists.linuxfoundation.org"
 <tech-board-discuss@lists.linuxfoundation.org>
From: Laura Abbott <laura@labbott.name>
Subject: Reminder: Voting procedures for the Linux Foundation Technical
 Advisory Board
Message-ID: <fccbdadc-a57a-f6fe-68d2-0fbac2fd6b81@labbott.name>
Date: Thu, 9 Sep 2021 12:49:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

Reminder that the Linux Foundation Technical Advisory Board (TAB) annual
election will be held virtually during the 2021 Kernel Summit and Linux
Plumbers Conference. Voting will run from September 20th to September
23rd 16:00 GMT-4 (US/Eastern). The voting criteria for the 2021 election
are:

There exist three kernel commits in a mainline or stable released
kernel that both
- Have a commit date in the year 2020 or 2021
- Contain an e-mail address in one of the following tags or merged
tags (e.g. Reviewed-and-tested-by)
-- Signed-off-by
-- Tested-by
-- Reported-by
-- Reviewed-by
-- Acked-by

If you have more than 50 commits that meet this requirement you will
receive a ballot automatically.

If you have between 3 and 49 commits that meet this requirement please
e-mail tab-elections@lists.linuxfoundation.org to request your ballot.
We strongly encourage everyone who meets this criteria to request a
ballot.

We will be using Condorcet Internet Voting
Service (CIVS) https://civs1.civs.us/ . This is a voting service
focused on security and privacy. There are sample polls on the
website if you would like to see what a ballot will look like.

If you have any questions please e-mail 
tab-elections@lists.linuxfoundation.org.

Thanks,
Laura

P.S. Please also consider this another reminder to consider running for
the TAB as well

