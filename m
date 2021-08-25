Return-Path: <ksummit+bounces-478-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C163F773E
	for <lists@lfdr.de>; Wed, 25 Aug 2021 16:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 4B9501C0FDC
	for <lists@lfdr.de>; Wed, 25 Aug 2021 14:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 364BA3FC9;
	Wed, 25 Aug 2021 14:25:39 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C977D3FC0
	for <ksummit@lists.linux.dev>; Wed, 25 Aug 2021 14:25:37 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id j9so13822951qvt.4
        for <ksummit@lists.linux.dev>; Wed, 25 Aug 2021 07:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=labbott.name; s=google;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=WjKM8CL3vH0BYmBPgF93QuNRkfZ4NCa+wfRQ23BQwRw=;
        b=NW4MFK4nH+Zy9et2Z7+/Rty3fAdaofnRjuTHfH8da1gPvR1hpPP5zmwwcQCspWVLxQ
         9Fhl61jb47Y88bt4kgXQ7riTTYklZ0hc71A3ft9yI1FkoMu/ZO+QKCqSeMTqo6p3fIpm
         petRAg6WidaoFz+TC/Qpd83GXbPC1NNbPtOeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=WjKM8CL3vH0BYmBPgF93QuNRkfZ4NCa+wfRQ23BQwRw=;
        b=G/hAvN6ac3u7tdcIC8Q0F6xIhOJR29P1TjAhnNixiiTkmmA4FhEwR7GZo4x7COyiJf
         0rFLcFRhbwYFtMhw8Mjq3aEEXcND2ZsHxFkNwBOZae5805CDNdcH9TnQ4FqguMuThSa1
         mxk2jwDZZxN2B6aAxazSIwsPOtWusX/1auhcQVixX72m4/89uaiK1TQa7s+oOcVWgupL
         3PcYqxK0Ep0W9MAhCqVcMpCVoMyd9P0bt7GjGKktjE5Iy7Om55TbP4uaQ4aa5lhTaV/E
         mG05wr5IEOcOwQWfKCo496eQ8oV4AtHgXKUNoCdPNtX4i/e31gdmbFrbUy1c6KfBDAe2
         P79A==
X-Gm-Message-State: AOAM531yY4UV12zSVTyP9IYdH7+itjL4/P8PSv0phVISUjtsvuWW640O
	CIpvcHp1mNZ5R4l4Fe+ZVEU6jw==
X-Google-Smtp-Source: ABdhPJzJm+n0AV1U7o+8RhRgHR6L6pnrMzGrAIMk6bPNDJfSLjfRlH8g2XdLsLuZMIkQ7m3sFqZksg==
X-Received: by 2002:ad4:522c:: with SMTP id r12mr44279608qvq.17.1629901536703;
        Wed, 25 Aug 2021 07:25:36 -0700 (PDT)
Received: from [192.168.1.168] (pool-74-109-246-95.pitbpa.fios.verizon.net. [74.109.246.95])
        by smtp.gmail.com with ESMTPSA id h16sm10116036qtx.23.2021.08.25.07.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Aug 2021 07:25:36 -0700 (PDT)
To: ksummit@lists.linux.dev,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tech-board-discuss@lists.linuxfoundation.org"
 <tech-board-discuss@lists.linuxfoundation.org>
From: Laura Abbott <laura@labbott.name>
Subject: Linux Foundation Technical Advisory Board election: procedures
Message-ID: <f744b489-ba9f-8688-1c08-4dd98b9ab22b@labbott.name>
Date: Wed, 25 Aug 2021 10:25:35 -0400
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

On behalf of the Linux Foundation Technical Advisory Board (TAB), I'd
like to announce the voting and nomination procedures for the 2021
election. The TAB has made some changes to its charter regarding voting
procedures. The full changes are still being finalized to be published
but the important parts are:

1) Anyone who is running for the TAB in a given election year must be
eligible to vote in that election.

2) Voting for the TAB election is now completely decoupled from Kernel
Summit and tied to activity in the Linux kernel instead.

TAB voting has been discussed off and on for many years now
(https://lists.linuxfoundation.org/pipermail/tech-board-discuss/2007-August/000029.html 
is one such example) and the TAB has made smaller
changes over the past few years (See
https://lore.kernel.org/ksummit/5A0ABD9B-34F3-44FE-838E-D66F3BB5D15B@labbott.name/ 
and
https://lore.kernel.org/ksummit/ade3420c-89fd-bed0-52e3-a0396eaeda2d@labbott.name/)

The elections will be held virtually during the week of 2021 Kernel
Summit and Linux Plumbers Conference held September 20th-24th.
Nominations are due by 9:00AM GMT-4 (US/Eastern) on September 20th.
Voting will then run from September 23rd 16:00 GMT (US/Eastern).

The following are the eligibility criteria for 2021:

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

The TAB members carefully weighed various options. The goal is to
have a representative voting pool of the upstream kernel community.
This represents a significant increase in the number of people who
are eligible to vote in the TAB elections over just kernel summit
attendees to just over 4000 people in total.

As last year, an online voting platform will be used. To avoid spamming
too many people, ballots will be automatically sent to individuals
who have more than 50 commits in this range. Anyone who has between
3-49 commits that meet the criteria may request a ballot as well.
We have a script to audit all names and catch duplicates (different
e-mails for work vs personal). If you know people who fall into
this category we strongly encourage you to encourage them to vote.

If you have any questions, feel free to reach out to the TAB at
tab@lists.linuxfoundation.org

